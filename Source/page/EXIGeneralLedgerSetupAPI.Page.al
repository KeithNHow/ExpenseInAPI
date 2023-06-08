/// <summary>
/// Page "EXI_GeneralLedgerSetupAPI" (ID 50302).
/// </summary>
page 50502 "EXI_GeneralLedgerSetupAPI"
{
    APIGroup = 'expenseIn';
    APIPublisher = 'rsmuk';
    APIVersion = 'v2.0';
    Caption = 'generalLedgerSetupAPI';
    DelayedInsert = true;
    EntityName = 'glSetup';
    EntitySetName = 'glSetup';
    PageType = API;
    SourceTable = "General Ledger Setup";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(accSchedForBalanceSheet; Rec."Acc. Sched. for Balance Sheet")
                {
                    Caption = 'Acc. Sched. for Balance Sheet';
                }
                field(accSchedForCashFlowStmt; Rec."Acc. Sched. for Cash Flow Stmt")
                {
                    Caption = 'Acc. Sched. for Cash Flow Stmt';
                }
                field(accSchedForIncomeStmt; Rec."Acc. Sched. for Income Stmt.")
                {
                    Caption = 'Acc. Sched. for Income Stmt.';
                }
                field(accSchedForRetainedEarn; Rec."Acc. Sched. for Retained Earn.")
                {
                    Caption = 'Acc. Sched. for Retained Earn.';
                }

                field(additionalReportingCurrency; Rec."Additional Reporting Currency")
                {
                    Caption = 'Additional Reporting Currency';
                }
                field(adjustForPaymentDisc; Rec."Adjust for Payment Disc.")
                {
                    Caption = 'Adjust for Payment Disc.';
                }
                field(allowGLAccDeletionBefore; Rec."Allow G/L Acc. Deletion Before")
                {
                    Caption = 'Check G/L Acc. Deletion After';
                }
                field(allowPostingFrom; Rec."Allow Posting From")
                {
                    Caption = 'Allow Posting From';
                }
                field(allowPostingTo; Rec."Allow Posting To")
                {
                    Caption = 'Allow Posting To';
                }
                field(amountDecimalPlaces; Rec."Amount Decimal Places")
                {
                    Caption = 'Amount Decimal Places';
                }
                field(amountRoundingPrecision; Rec."Amount Rounding Precision")
                {
                    Caption = 'Amount Rounding Precision';
                }
                field(applnRoundingPrecision; Rec."Appln. Rounding Precision")
                {
                    Caption = 'Appln. Rounding Precision';
                }
                field(bankAccountNos; Rec."Bank Account Nos.")
                {
                    Caption = 'Bank Account Nos.';
                }
                field(billToSellToVATCalc; Rec."Bill-to/Sell-to VAT Calc.")
                {
                    Caption = 'Bill-to/Sell-to VAT Calc.';
                }
                field(checkGLAccountUsage; Rec."Check G/L Account Usage")
                {
                    Caption = 'Check G/L Account Usage';
                }
                field(custBalancesDue; Rec."Cust. Balances Due")
                {
                    Caption = 'Cust. Balances Due';
                }
                field(emuCurrency; Rec."EMU Currency")
                {
                    Caption = 'EMU Currency';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(invRoundingPrecisionLCY; Rec."Inv. Rounding Precision (LCY)")
                {
                    Caption = 'Inv. Rounding Precision (LCY)';
                }
                field(invRoundingTypeLCY; Rec."Inv. Rounding Type (LCY)")
                {
                    Caption = 'Inv. Rounding Type (LCY)';
                }
                field(jobQPrioForPostPrint; Rec."Job Q. Prio. for Post & Print")
                {
                    Caption = 'Job Q. Prio. for Post & Print';
                }
                field(jobQueueCategoryCode; Rec."Job Queue Category Code")
                {
                    Caption = 'Job Queue Category Code';
                }
                field(jobQueuePriorityForPost; Rec."Job Queue Priority for Post")
                {
                    Caption = 'Job Queue Priority for Post';
                }
                field(lcyCode; Rec."LCY Code")
                {
                    Caption = 'LCY Code';
                }
                field(lastICTransactionNo; Rec."Last IC Transaction No.")
                {
                    Caption = 'Last IC Transaction No.';
                }
                field(localAddressFormat; Rec."Local Address Format")
                {
                    Caption = 'Local Address Format';
                }
                field(localContAddrFormat; Rec."Local Cont. Addr. Format")
                {
                    Caption = 'Local Cont. Addr. Format';
                }
                field(localCurrencyDescription; Rec."Local Currency Description")
                {
                    Caption = 'Local Currency Description';
                }
                field(localCurrencySymbol; Rec."Local Currency Symbol")
                {
                    Caption = 'Local Currency Symbol';
                }
                field(markCrMemosAsCorrections; Rec."Mark Cr. Memos as Corrections")
                {
                    Caption = 'Mark Cr. Memos as Corrections';
                }
                field(maxPaymentToleranceAmount; Rec."Max. Payment Tolerance Amount")
                {
                    Caption = 'Max. Payment Tolerance Amount';
                }
                field(maxVATDifferenceAllowed; Rec."Max. VAT Difference Allowed")
                {
                    Caption = 'Max. VAT Difference Allowed';
                }
                field(notifyOnSuccess; Rec."Notify On Success")
                {
                    Caption = 'Notify On Success';
                }
                field(paymentDiscountGracePeriod; Rec."Payment Discount Grace Period")
                {
                    Caption = 'Payment Discount Grace Period';
                }
                field(paymentTolerance; Rec."Payment Tolerance %")
                {
                    Caption = 'Payment Tolerance %';
                }
                field(paymentTolerancePosting; Rec."Payment Tolerance Posting")
                {
                    Caption = 'Payment Tolerance Posting';
                }
                field(paymentToleranceWarning; Rec."Payment Tolerance Warning")
                {
                    Caption = 'Payment Tolerance Warning';
                }
                field(payrollTransImportFormat; Rec."Payroll Trans. Import Format")
                {
                    Caption = 'Payroll Trans. Import Format';
                }
                field(pmtDiscExclVAT; Rec."Pmt. Disc. Excl. VAT")
                {
                    Caption = 'Pmt. Disc. Excl. VAT';
                }
                field(pmtDiscTolerancePosting; Rec."Pmt. Disc. Tolerance Posting")
                {
                    Caption = 'Pmt. Disc. Tolerance Posting';
                }
                field(pmtDiscToleranceWarning; Rec."Pmt. Disc. Tolerance Warning")
                {
                    Caption = 'Pmt. Disc. Tolerance Warning';
                }
                field(postPrintWithJobQueue; Rec."Post & Print with Job Queue")
                {
                    Caption = 'Post & Print with Job Queue';
                }
                field(postWithJobQueue; Rec."Post with Job Queue")
                {
                    Caption = 'Post with Job Queue';
                }
                field(postingPreviewType; Rec."Posting Preview Type")
                {
                    Caption = 'Posting Preview Type';
                }
                field(prepaymentUnrealizedVAT; Rec."Prepayment Unrealized VAT")
                {
                    Caption = 'Prepayment Unrealized VAT';
                }
                field(primaryKey; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                }
                field(printVATSpecificationInLCY; Rec."Print VAT specification in LCY")
                {
                    Caption = 'Print VAT specification in LCY';
                }
                field(registerTime; Rec."Register Time")
                {
                    Caption = 'Register Time';
                }
                field(reportOutputType; Rec."Report Output Type")
                {
                    Caption = 'Report Output Type';
                }
                field(reqCountryRegCodeInAddr; Rec."Req.Country/Reg. Code in Addr.")
                {
                    Caption = 'Require Country/Region Code in Address';
                }
                field(sepaExportWOBankAccData; Rec."SEPA Export w/o Bank Acc. Data")
                {
                    Caption = 'SEPA Export w/o Bank Acc. Data';
                }
                field(sepaNonEuroExport; Rec."SEPA Non-Euro Export")
                {
                    Caption = 'SEPA Non-Euro Export';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                }
                field(showAmounts; Rec."Show Amounts")
                {
                    Caption = 'Show Amounts';
                }
                field(summarizeGLEntries; Rec."Summarize G/L Entries")
                {
                    Caption = 'Summarize G/L Entries';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(taxInvoiceRenamingThreshold; Rec."Tax Invoice Renaming Threshold")
                {
                    Caption = 'Tax Invoice Renaming Threshold';
                }
                field(thresholdAmount; Rec."Threshold Amount")
                {
                    Caption = 'Threshold Amount';
                }
                field(thresholdApplies; Rec."Threshold applies")
                {
                    Caption = 'Threshold applies';
                }
                field(unitAmountDecimalPlaces; Rec."Unit-Amount Decimal Places")
                {
                    Caption = 'Unit-Amount Decimal Places';
                }
                field(unitAmountRoundingPrecision; Rec."Unit-Amount Rounding Precision")
                {
                    Caption = 'Unit-Amount Rounding Precision';
                }
                field(unrealizedVAT; Rec."Unrealized VAT")
                {
                    Caption = 'Unrealized VAT';
                }
                field(vatExchangeRateAdjustment; Rec."VAT Exchange Rate Adjustment")
                {
                    Caption = 'VAT Exchange Rate Adjustment';
                }
                field(vatRoundingType; Rec."VAT Rounding Type")
                {
                    Caption = 'VAT Rounding Type';
                }
                field(vatTolerance; Rec."VAT Tolerance %")
                {
                    Caption = 'VAT Tolerance %';
                }
                field(vendorBalancesDue; Rec."Vendor Balances Due")
                {
                    Caption = 'Vendor Balances Due';
                }
            }
        }
    }
}
