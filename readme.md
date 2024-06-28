# API Extension written for ExpenseIn
-------------------------------------
# Extension --> Consists of 2 codeunits, 7 pages,, 1 table (buffer), 1 permissionset.

# Codeunit InstallMgmt --> Runs on install of extension. 
Creates General Journal template and batch records if need be.

# Codeunit Expense Mgmt --> Posts Gen Jnl Line records. Needs to be setup as a web service?
5 Procedures --> Post, PreviewPost, GetBatch, PostBatch, PreviewPostBatch 
Post procedure calls GetBatch followed by PostBatch procedure. 
PreviewPost procdure calls GetBatch and PrevPostBatch procedure.

# Table --> GenJnlBuffer contains OnModify and OnInsert triggers. 
These create and update GenJnlLines using GenJnlLine buffer record.

# Pages --> 7 API's all import only
GenBusPostGrp --> 3 fields (AutoInsert, Code, Desc)
GenProdPostGrp --> 2 fields (Code, Desc)
VATBusPostGrp --> 2 fields (Code, Desc)
VATProdPostGrp --> 2 fields (Code, Desc)
GenLedgSetup --> Multiple fields
GenJnlBatch --> Multiple fields
PurchaseJournal --> Contains OnNewRecord and OnInsertRecord triggers. 
--> OnNewRecord sets Journal Template Name and Journal Batch name. 
--> OnInsertRecord either creates or updates GenJnlLine record in buffer table.

# WebServiceActionContext
SetObjectType(ObjectType) --> Sets the object type.
AddEntityKey(Integer, Any)	--> Add a new <fieldId, value> pair to the collection of entity keys.
SetResultCode(WebServiceActionResultCode) --> Sets the web service action result status code.