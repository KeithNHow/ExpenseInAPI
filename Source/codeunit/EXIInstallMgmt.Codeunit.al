/// <summary>
/// Codeunit "EXI_ExpenseInInstallMgt" (ID 50300).
/// Operations outside of the ext code that need to be run when ext is installed.
/// Install code is run only when an ext version is first inst or reinst by running the Install-NAVApp cmdlet or from the Extension Management page in the client.
/// </summary>
codeunit 50500 "EXI Install Mgmt."
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
        if not GenJournalTemplate.Get('PURCHASES') then begin
            GenJournalTemplate.Init();
            GenJournalTemplate.Type := GenJournalTemplate.Type::Purchases;
            GenJournalTemplate.Name := 'PURCHASES';
            GenJournalTemplate.Description := 'Purchases journal';
            GenJournalTemplate."Source Code" := 'PURCHJNL';
            GenJournalTemplate."Page ID" := Page::"Purchase Journal";
            GenJournalTemplate.Insert();
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
        GenJournalTemplate.Get('PURCHASES');
        if not GenJournalBatch.Get(GenJournalTemplate.Name, 'EXPENSEIN') then begin
            GenJournalBatch.Init();
            GenJournalBatch."Journal Template Name" := GenJournalTemplate.Name;
            GenJournalBatch.Name := 'EXPENSEIN';
            GenJournalBatch.Description := 'ExpenseIn Integration';
            GenJournalBatch."Bal. Account Type" := GenJournalTemplate."Bal. Account Type";
            GenJournalBatch."Bal. Account No." := GenJournalTemplate."Bal. Account No.";
            GenJournalBatch."No. Series" := GenJournalTemplate."No. Series";
            GenJournalBatch."Posting No. Series" := GenJournalTemplate."Posting No. Series";
            GenJournalBatch."Copy VAT Setup to Jnl. Lines" := GenJournalTemplate."Copy VAT Setup to Jnl. Lines";
            GenJournalBatch."Allow VAT Difference" := true;
            GenJournalBatch.Insert(true);
        end;
    end;

    var
        GenJournalTemplate: Record "Gen. Journal Template";
}