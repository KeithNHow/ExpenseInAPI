/// <summary>
/// Page "EXIVATBusinessPostingGroupAPI" (ID 50301).
/// </summary>
page 50301 EXIVATBusinessPostingGroupAPI
{
    APIGroup = 'expenseIn';
    APIPublisher = 'rsmuk';
    APIVersion = 'v2.0';
    Caption = 'vatBusinessPostingGroupsAPI';
    DelayedInsert = true;
    EntityName = 'vatBusinessPostingGroups';
    EntitySetName = 'vatBusinessPostingGroups';
    PageType = API;
    SourceTable = "VAT Business Posting Group";

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
