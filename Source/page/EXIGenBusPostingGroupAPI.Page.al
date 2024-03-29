/// <summary>
/// Page EXI Gen Bus Posting Group API (ID 50505).
/// </summary>
page 50505 EXIGenBusPostingGroupAPI
{
    APIGroup = 'expenseIn';
    APIPublisher = 'rsmuk';
    APIVersion = 'v2.0';
    Caption = 'genBusinessPostingGroupsAPI';
    DelayedInsert = true;
    EntityName = 'genBusinessPostingGroups';
    EntitySetName = 'genBusinessPostingGroups';
    PageType = API;
    SourceTable = "Gen. Business Posting Group";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(autoInsertDefault; Rec."Auto Insert Default")
                {
                    Caption = 'Auto Insert Default';
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(defVATBusPostingGroup; Rec."Def. VAT Bus. Posting Group")
                {
                    Caption = 'Def. VAT Bus. Posting Group';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
