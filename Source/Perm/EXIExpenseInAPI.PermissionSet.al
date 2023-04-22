/// <summary>
/// Unknown "EXIExpenseInAPI" (ID 50300).
/// </summary>
permissionset 50300 EXIExpenseInAPI
{
    Assignable = true;
    Caption = 'Expense In API', MaxLength = 30;
    Permissions =
        table "EXIGenJournalLineBuffer" = X,
        tabledata "EXIGenJournalLineBuffer" = RMID,
        codeunit "EXIExpenseInInstallMgt" = X,
        codeunit "EXIExpenseInMgt" = X,
        page EXIPurchaseJournalAPI = X,
        page EXIVATBusinessPostingGroupAPI = X,
        page EXIGeneralLedgerSetupAPI = X,
        page EXIGenProductPostingGroupAPI = X,
        page EXIGenJournalBatchesAPI = X,
        page EXIGenBusPostingGroupAPI = X,
        page EXIVATProductPostingGroupsAPI = X;
}
