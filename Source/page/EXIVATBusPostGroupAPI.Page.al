/// <summary>
/// Page EXI VAT Business Posting Group API (ID 50501).
/// </summary>
page 50501 "EXI VAT Bus Post Group API"
{
    APIGroup = 'expenseIn';
    APIPublisher = 'expensesIn';
    APIVersion = 'v2.0';
    Caption = 'vatBusinessPostingGroupsAPI';
    DelayedInsert = true;
    EntityName = 'vatBusinessPostingGroups';
    EntitySetName = 'vatBusinessPostingGroups';
    PageType = API;
    SourceTable = "VAT Business Posting Group";

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
