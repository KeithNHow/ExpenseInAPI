/// <summary>
/// Unknown "EXI_ExpenseInAPI" (ID 50300).
/// </summary>
permissionset 50300 EXI_ExpenseInAPI
{
    Assignable = true;
    Caption = 'Expense In API', MaxLength = 30;
    Permissions =
        table "EXI_GenJournalLineBuffer" = X,
        tabledata "EXI_GenJournalLineBuffer" = RMID,
        codeunit "EXI_ExpenseInInstallMgt" = X,
        codeunit "EXI_ExpenseInMgt" = X,
        page EXI_PurchaseJournalAPI = X,
        page EXI_VATBusinessPostingGroupAPI = X,
        page EXI_GeneralLedgerSetupAPI = X,
        page EXI_GenProductPostingGroupAPI = X,
        page EXI_GenJournalBatchesAPI = X,
        page EXI_GenBusPostingGroupAPI = X,
        page EXI_VATProductPostingGroupsAPI = X;
}
