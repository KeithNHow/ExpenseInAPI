/// <summary>
/// Codeunit "EXIExpenseInMgt". (ID 50301).
/// Codeunit setup as web service in app? 
/// </summary>
codeunit 50301 EXIExpenseInMgt
{
    /// <summary>
    /// Calls local procedures GetBatch and PostBatch
    /// </summary>
    procedure post()
    var
        GenJournalBatch: Record "Gen. Journal Batch";
        ActionContext: WebServiceActionContext;
    begin
        GetBatch(GenJournalBatch);
        PostBatch(GenJournalBatch, ActionContext);
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

    local procedure GetBatch(var GenJournalBatch: Record "Gen. Journal Batch")
    var
        CannotFindBatchErr: Label 'The journal batch does not exist.';
    begin
        if not GenJournalBatch.Get('PURCHASES', 'EXPENSEIN') then
            Error(CannotFindBatchErr);
    end;

    /// <summary>
    /// Tries to Post GJL's on GJB and GJT 
    /// </summary>
    local procedure PostBatch(var GenJournalBatch: Record "Gen. Journal Batch"; var ActionContext: WebServiceActionContext)
    var
        GenJournalLine: Record "Gen. Journal Line";
        ThereIsNothingToPostErr: Label 'There is nothing to post.';
    begin
        GenJournalLine.SetRange("Journal Template Name", GenJournalBatch."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        if not GenJournalLine.FindFirst() then
            Error(ThereIsNothingToPostErr);

        if Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine) then begin
            ActionContext.SetObjectType(ObjectType::Codeunit);
            ActionContext.AddEntityKey(GenJournalBatch.FieldNo(SystemId), GenJournalBatch.SystemId);
            ActionContext.SetResultCode(WebServiceActionResultCode::Created);
        end else
            Error(GetLastErrorText());
    end;

    /// <summary>
    /// Preview Posts GJL's on GJB and GJT 
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