/// <summary>
/// Page "EXI_GenProductPostingGroupAPI" (ID 50303).
/// </summary>
page 50503 "EXI_GenProductPostingGroupAPI"
{
    APIGroup = 'expenseIn';
    APIPublisher = 'rsmuk';
    APIVersion = 'v2.0';
    Caption = 'genProductPostingGroupsAPI';
    DelayedInsert = true;
    EntityName = 'genProductPostingGroups';
    EntitySetName = 'genProductPostingGroups';
    PageType = API;
    SourceTable = "Gen. Product Posting Group";

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
                field(defVATProdPostingGroup; Rec."Def. VAT Prod. Posting Group")
                {
                    Caption = 'Def. VAT Prod. Posting Group';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
