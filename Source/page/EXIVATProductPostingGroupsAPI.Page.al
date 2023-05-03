/// <summary>
/// Page "EXI_VATProductPostingGroupsAPI" (ID 50306).
/// </summary>
page 50306 "EXI_VATProductPostingGroupsAPI"
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
