/// <summary>
/// Codeunit "EXI_ExpenseInMgt". (ID 50301).
/// Codeunit setup as web service in app? 
/// 5 Procedures --> 2 Global --> Post, PreviewPost, 3 Local --> GetBatch, PostBatch, PreviewPostBatch
/// </summary>
codeunit 50501 "EXI Expense Mgmt."
{
    /// <summary>
    /// Calls local procedures GetBatch and PostBatch
    /// </summary>
    procedure Post()
    var
        GenJournalBatch: Record "Gen. Journal Batch";
        WSActionContext: WebServiceActionContext;
    begin
        GetBatch(GenJournalBatch);
        PostBatch(GenJournalBatch, WSActionContext);
        Message('Posted');
    end;

    /// <summary>
    /// Calls GetBatch and PreviewPostBatch
    /// </summary>
    procedure PreviewPost()
    var
        GenJournalBatch: Record "Gen. Journal Batch";
    begin
        GetBatch(GenJournalBatch);
        PreviewPostBatch(GenJournalBatch)
    end;

    ///<summary>
    /// Gives error if GenJnlBatch not found
    ///</summary>
    local procedure GetBatch(var GenJournalBatch: Record "Gen. Journal Batch")
    var
        CannotFindBatchErr: Label 'The journal batch does not exist.';
    begin
        if not GenJournalBatch.Get('PURCHASES', 'EXPENSEIN') then
            Error(CannotFindBatchErr);
    end;

    /// <summary>
    /// Tries to post GenJnlLines on GenJnlBatch and GenJnlTemplate 
    /// </summary>
    local procedure PostBatch(var GenJournalBatch: Record "Gen. Journal Batch"; var WSActionContext: WebServiceActionContext)
    var
        GenJournalLine: Record "Gen. Journal Line";
        ThereIsNothingToPostErr: Label 'There is nothing to post.';
    begin
        GenJournalLine.SetRange("Journal Template Name", GenJournalBatch."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        if not GenJournalLine.FindFirst() then
            Error(ThereIsNothingToPostErr);

        if Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine) then begin
            WSActionContext.SetObjectType(ObjectType::Codeunit);
            WSActionContext.AddEntityKey(GenJournalBatch.FieldNo(SystemId), GenJournalBatch.SystemId);
            WSActionContext.SetResultCode(WebServiceActionResultCode::Created);
        end else
            Error(GetLastErrorText());
    end;

    /// <summary>
    /// Preview posts GenJnlLines on GenJnlBatch and GenJnlTemplate 
    /// </summary>
    local procedure PreviewPostBatch(var GenJournalBatch: Record "Gen. Journal Batch")
    var
        GenJournalLine: Record "Gen. Journal Line";
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
    begin
        GenJournalLine.SetRange("Journal Template Name", GenJournalBatch."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        if GenJournalLine.FindSet() then
            GenJnlPost.Preview(GenJournalLine);
    end;
}