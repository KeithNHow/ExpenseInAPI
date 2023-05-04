API Extension written for ExpenseIn
-----------------------------------
Extension --> Consists of 2 codeunits, 7 pages, 1 permissionset, 1 table (buffer).
Table --> GJL Buffer contains OnModify and OnInsert triggers. These create and update GJL's using GJL buffer record.
Pages --> API's for GBPG, GPPG, VBPG, VPPG, GJB, GLS, GJL Buffer.
Page PurchJnlAPI --> Contains OnNewRecord and OnInsertRecord triggers. OnNewRecord trigger sets Generel Journal Template and Batch names. OnInsertRecord trigger either creates or update GJL from GJL buffer record.
Codeunit --> Runs on install of extension. Creates GJ template and batch records if need be.
Codeunit --> Posts GJL records. Needs to be setup as a web service? Post proc calls GetBatch followed by PostBatch. Prev Post Proc calls GetBatch and PrevPostBatch.