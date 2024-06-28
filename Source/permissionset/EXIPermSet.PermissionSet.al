/// <summary>
/// Unknown EXIPermSet (ID 50500).
/// </summary>
permissionset 50500 EXIPermSet
{
    Assignable = true;
    Caption = 'Expense In API', MaxLength = 30;
    Permissions = table EXIGenJournalLineBuffer = X,
        tabledata EXIGenJournalLineBuffer = RMID,
        codeunit "EXI Install Mgmt." = X,
        codeunit "EXI Expense Mgmt." = X,
        page "EXI Purchase Journal API" = X,
        page "EXI VAT Bus Post Group API" = X,
        page "EXI Gen Bus Post Group API" = X,
        page "EXI VAT Prod Post Group API" = X,
        page "EXI Gen Journal Batch API" = X,
        page "EXI Gen Ledger Setup API" = X,
        page "EXI Gen Prod Post Group API" = X;
}