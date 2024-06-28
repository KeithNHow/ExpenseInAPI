/// <summary>
/// Page "EXI Gen. Product Posting Group API (ID 50503).
/// </summary>
page 50503 "EXI Gen Prod Post Group API"
{
    APIGroup = 'expenseIn';
    APIPublisher = 'expensesIn';
    APIVersion = 'v2.0';
    Caption = 'genProductPostingGroupsAPI';
    DelayedInsert = true;
    EntityName = 'genProductPostingGroups';
    EntitySetName = 'genProductPostingGroups';
    PageType = API;
    SourceTable = "Gen. Product Posting Group";

    layout
    {
        area(Content)
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