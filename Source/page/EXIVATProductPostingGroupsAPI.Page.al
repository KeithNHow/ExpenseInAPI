/// <summary>
/// Page EXI VAT Product Posting Groups API (ID 50506).
/// </summary>
page 50506 EXIVATProductPostingGroupsAPI
{
    APIGroup = 'expenseIn';
    APIPublisher = 'rsmuk';
    APIVersion = 'v2.0';
    Caption = 'vatProductPostingsGroupsAPI';
    DelayedInsert = true;
    EntityName = 'vatProductPostingGroups';
    EntitySetName = 'vatProductPostingGroups';
    PageType = API;
    SourceTable = "VAT Product Posting Group";

    layout
    {
        area(content)
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
