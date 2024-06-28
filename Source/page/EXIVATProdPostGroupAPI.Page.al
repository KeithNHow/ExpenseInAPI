/// <summary>
/// Page EXI VAT Prod Posting Group API (ID 50506).
/// </summary>
page 50506 "EXI VAT Prod Post Group API"
{
    APIGroup = 'expenseIn';
    APIPublisher = 'expensesIn';
    APIVersion = 'v2.0';
    Caption = 'vatProductPostingsGroupsAPI';
    DelayedInsert = true;
    EntityName = 'vatProductPostingGroups';
    EntitySetName = 'vatProductPostingGroups';
    PageType = API;
    SourceTable = "VAT Product Posting Group";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
