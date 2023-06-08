/// <summary>
/// Codeunit "EXI_ExpenseInMgt". (ID 50301).
/// Codeunit setup as web service in app? 
/// </summary>
codeunit 50501 "EXI_ExpenseInMgt"
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
    local procedure PostBatch(var GenJournalBatch: Record "Gen. Journal Batch"; var WSActionContext: WebServiceActionContext)
    var
        GenJournalLine: Record "Gen. Journal Line";
        //TempErrorMessage: Record "Error Message" temporary;
        //ErrorArray: List of [ErrorInfo];
        //Error: ErrorInfo;
        //ArrayListInt: List of [Integer];
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
        /*
        foreach Error in GetCollectedErrors(true) do begin //test2
            TempErrorMessage.ID := tempErrorMessage.ID + 1;
            TempErrorMessage.Description := CopyStr(error.Message, 1, 250);
            TempErrorMessage.Validate("Record ID", error.RecordId);
            TempErrorMessage.Insert();
        end;
        */
        //ErrorArray := GetCollectedErrors(); //test3
        //ArrayListInt.AddRange(1, ErrorArray.Count);
        //Error(Format(ArrayListInt));
    end;

    /// <summary>
    /// Preview Posts GJL's on GJB and GJT 
    /// </summary>
    local procedure PreviewPostBatch(var GenJournalBatch: Record "Gen. Journal Batch")
    var
        GenJournalLine: Record "Gen. Journal Line";
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
    begin
        GenJournalLine.SetRange("Journal Template Name", genJournalBatch."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        if genJournalLine.FindSet() then
            GenJnlPost.Preview(GenJournalLine);
    end;
}