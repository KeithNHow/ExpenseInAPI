/// <summary>
/// Page EXI Purchase Journal API (ID 50500).
/// </summary>
page 50500 EXIPurchaseJournalAPI
{
    SourceTable = EXIGenJournalLineBuffer;
    APIVersion = 'v2.0';
    EntityCaption = 'Purchase Journal';
    EntitySetCaption = 'Purchase Journals';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'expenseInPurchaseJournal';
    EntitySetName = 'expenseInPurchaseJournal';
    ODataKeyFields = SystemId;
    PageType = API;
    APIGroup = 'expenseIn';
    APIPublisher = 'rsmuk';
    SourceTableView = where("Journal Template Name" = filter('PURCHASES'));
    DeleteAllowed = true;
    ModifyAllowed = true;
    Extensible = false;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(lines)
            {
                field(systemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    ApplicationArea = All;
                }
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field(extDocNo; Rec."External Document No.")
                {
                    ApplicationArea = All;
                }
                field(accountType; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field(accountNo; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(genPostingType; Rec."Gen. Posting Type")
                {
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(amountLCY; Rec."Amount (LCY)")
                {
                    ApplicationArea = All;
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                }
                field(vatAmount; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                }
                field(vatDifference; Rec."VAT Difference")
                {
                    ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    ApplicationArea = All;
                }
                field(balGenPostingType; Rec."Bal. Gen. Posting Type")
                {
                    ApplicationArea = All;
                }
                field(balGenBusPostingGroup; Rec."Bal. Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(balGenProdPostingGroup; Rec."Bal. Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(balVATBusPostingGroup; Rec."Bal. VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(balVATProdPostingGroup; Rec."Bal. VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field(balVAT; Rec."Bal. VAT %")
                {
                    ApplicationArea = All;
                }
                field(balVATAmount; Rec."Bal. VAT Amount")
                {
                    ApplicationArea = All;
                }
                field(balVATAmountLCY; Rec."Bal. VAT Amount (LCY)")
                {
                    ApplicationArea = All;
                }
                field(balVATBaseAmount; Rec."Bal. VAT Base Amount")
                {
                    ApplicationArea = All;
                }
                field(balVATDifference; Rec."Bal. VAT Difference")
                {
                    ApplicationArea = All;
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = All;
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = All;
                }
                field(appliesToExtDocNo; Rec."Applies-to Ext. Doc. No.")
                {
                    ApplicationArea = All;
                }
                field(appliesToID; Rec."Applies-to ID")
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode1; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode2; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode3; ShortcutDimCode[3])
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode4; ShortcutDimCode[4])
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode5; ShortcutDimCode[5])
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode6; ShortcutDimCode[6])
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode7; ShortcutDimCode[7])
                {
                    ApplicationArea = All;
                }
                field(shortcutDimCode8; ShortcutDimCode[8])
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Journal Template Name" := 'PURCHASES';
        Rec."Journal Batch Name" := 'EXPENSEIN';
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        DimensionValue: Record "Dimension Value";
        DimensionSetEntry: Record "Dimension Set Entry";
        TempDimensionSetEntry: Record "Dimension Set Entry" temporary;
        DimensionManagement: codeunit DimensionManagement;
        i: Integer;
        DimSetID: Integer;
        DimValueCodeErr: Label 'Dimension Value Code %1 for Dimension Code %2 not found.', Comment = '%1 = DimValueCode, %2 = DimCode';
    begin
        if Rec."Shortcut Dimension 1 Code" <> '' then
            ShortcutDimCode[1] := Rec."Shortcut Dimension 1 Code";
        if Rec."Shortcut Dimension 2 Code" <> '' then
            ShortcutDimCode[2] := Rec."Shortcut Dimension 2 Code";
        TempDimensionSetEntry.DeleteAll();
        for i := 1 to 8 do begin
            GeneralLedgerSetup.Get();
            if ShortcutDimCode[i] <> '' then begin
                DimensionValue.Reset();
                case i of
                    1:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 1 Code");
                    2:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 2 Code");
                    3:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
                    4:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 4 Code");
                    5:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 5 Code");
                    6:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 6 Code");
                    7:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 7 Code");
                    8:
                        DimensionValue.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 8 Code");
                end;
                DimensionValue.SetRange(Code, ShortcutDimCode[i]);
                if DimensionValue.FindFirst() then begin
                    TempDimensionSetEntry.Init();
                    if i = 1 then begin
                        if DimensionSetEntry.FindLast() then
                            TempDimensionSetEntry."Dimension Set ID" := DimensionSetEntry."Dimension Set ID" + 1
                        else
                            TempDimensionSetEntry."Dimension Set ID" := 1;
                        DimSetID := TempDimensionSetEntry."Dimension Set ID";
                    end else
                        TempDimensionSetEntry."Dimension Set ID" := DimSetID;
                    case i of
                        1:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 1 Code");
                        2:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 2 Code");
                        3:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
                        4:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 4 Code");
                        5:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 5 Code");
                        6:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 6 Code");
                        7:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 7 Code");
                        8:
                            TempDimensionSetEntry.Validate("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 8 Code");
                    end;
                    TempDimensionSetEntry.Validate("Dimension Value Code", DimensionValue.Code);
                    TempDimensionSetEntry.Insert();
                end else
                    Error(DimValueCodeErr, ShortcutDimCode[i], Rec."Shortcut Dimension 1 Code");
            end;
        end;
        Rec."Dimension Set ID" := DimensionManagement.GetDimensionSetID(TempDimensionSetEntry);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}
