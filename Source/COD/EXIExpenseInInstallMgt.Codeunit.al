/// <summary>
/// Codeunit "EXIExpenseInInstallMgt" (ID 50300).
/// Operations outside of the ext code that need to be run when ext is installed.
/// Install code is run only when an ext version is first inst or reinst by running the Install-NAVApp cmdlet or from the Extension Management page in the client.
/// </summary>
codeunit 50300 EXIExpenseInInstallMgt
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        CreateJournalTemplate();
        CreateJournalBatch();
    end;

    /// <summary>
    /// Check if Purchases template rec exists. If not create rec.
    /// </summary>
    local procedure CreateJournalTemplate()
    begin
        if not GeneralJournalTemplate.Get('PURCHASES') then begin
            GeneralJournalTemplate.Init();
            GeneralJournalTemplate.Type := GeneralJournalTemplate.Type::Purchases;
            GeneralJournalTemplate.Name := 'PURCHASES';
            GeneralJournalTemplate.Description := 'Purchases journal';
            GeneralJournalTemplate."Source Code" := 'PURCHJNL';
            GeneralJournalTemplate."Page ID" := Page::"Purchase Journal";
            GeneralJournalTemplate.Insert();
        end;
    end;

    /// <summary>
    /// Get Purchases template rec
    /// Check if GJB rec exists. If not create rec
    /// </summary>
    local procedure CreateJournalBatch()
    var
        GenJournalBatch: Record "Gen. Journal Batch";
    begin
        GeneralJournalTemplate.Get('PURCHASES');
        if not GenJournalBatch.Get(GeneralJournalTemplate.Name, 'EXPENSEIN') then begin
            GenJournalBatch.Init();
            GenJournalBatch."Journal Template Name" := GeneralJournalTemplate.Name;
            GenJournalBatch.Name := 'EXPENSEIN';
            GenJournalBatch.Description := 'ExpenseIn Integration';
            GenJournalBatch."Bal. Account Type" := GeneralJournalTemplate."Bal. Account Type";
            GenJournalBatch."Bal. Account No." := GeneralJournalTemplate."Bal. Account No.";
            GenJournalBatch."No. Series" := GeneralJournalTemplate."No. Series";
            GenJournalBatch."Posting No. Series" := GeneralJournalTemplate."Posting No. Series";
            GenJournalBatch."Copy VAT Setup to Jnl. Lines" := GeneralJournalTemplate."Copy VAT Setup to Jnl. Lines";
            GenJournalBatch."Allow VAT Difference" := true;
            GenJournalBatch.Insert(true);
        end;
    end;

    var
        GeneralJournalTemplate: Record "Gen. Journal Template";
}