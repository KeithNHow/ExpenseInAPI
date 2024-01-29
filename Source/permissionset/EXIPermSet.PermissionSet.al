/// <summary>
/// Unknown EXIPermSet (ID 50500).
/// </summary>
permissionset 50500 EXIPermSet
{
    Assignable = true;
    Caption = 'Expense In API', MaxLength = 30;
    Permissions =
        table EXIGenJournalLineBuffer = X,
        tabledata EXIGenJournalLineBuffer = RMID,
        codeunit EXIInstallMgmt = X,
        codeunit EXIExpenseMgmt = X,
        page EXIPurchaseJournalAPI = X,
        page EXIVATBusinessPostingGroupAPI = X,
        page EXIGeneralLedgerSetupAPI = X,
        page EXIGenProductPostingGroupAPI = X,
        page EXIGenJournalBatchesAPI = X,
        page EXIGenBusPostingGroupAPI = X,
        page EXIVATProductPostingGroupsAPI = X;
}
