@BAT001-01
  Feature: BAT001 Batch Process

  Description:
  	Batch Process

  Background:
  	Given I am up top

  Scenario: Batch Process

   When I run the "clearCacheJob" job in the "KFS-SYS" jobstream  
    And I run the "receivingPaymentRequestJob" job in the "KFS-PURAP" jobstream
    And I run the "approveLineItemReceivingJob" job in the "KFS-PURAP" jobstream
    And I run the "pdpExtractCanceledChecksJob" job in the "KFS-PDP" jobstream
    And I run the "processPdpCancelsAndPaidJob" job in the "KFS-PDP" jobstream
    And I run the "autoApprovePaymentRequestsJob" job in the "KFS-PURAP" jobstream
    And I run the "purchasingPreDisbursementExtractJob" job in the "KFS-PURAP" jobstream
    And I run the "disbursementVoucherPreDisbursementProcessorExtractJob" job in the "KFS-FP" jobstream
    And I run the "pdpNightlyLoadPaymentsJob" job in the "KFS-PDP" jobstream
    And I run the "processShippingInvoiceJob" job in the "KFS-PDP" jobstream
    And I run the "pdpLoadPaymentsJob" job in the "KFS-PDP" jobstream
    And I run the "pdpDailyReportJob" job in the "KFS-PDP" jobstream
    
  When I am on the "Maintenance" system tab
    And I am logged in as "kfs-test-sec51"
  When I click the "Format Checks/ACH" link
    And I click the "Begin Format" button  
    And I click the "Continue" button if the "There are no payments that match your selection for format process." message is not displayed
   
 When I verify that an ".xml" file starting with "pdp_check" exists in "staging/pdp/paymentExtract" of the KFS working directory

   And I run the "pdpExtractAchPaymentsJob" job in the "KFS-PDP" jobstream
   And I run the "pdpSendAchAdviceNotificationsJob" job in the "KFS-PDP" jobstream
   And I run the "pdpExtractGlTransactionsStepJob" job in the "KFS-PDP" jobstream
   And I run the "pdpClearPendingTransactionsJob" job in the "KFS-PDP" jobstream
   # And I run the "payeeMasterExtractJob" job in the "KUALI-TAX" jobstream
   And I run the "documentCreationJob" job in the "KFS-FP" jobstream
   And I run the "checkReconciliationJob" job in the "KUALI-CR" jobstream
   And I run the "crGlTransactionJob" job in the "KUALI-CR" jobstream
   And I run the "checkReconciliationJob" job in the "KUALI-CR" jobstream
   # And I run the "procurementCardHolderJob" job in the "KFS-FP" jobstream
   # And I run the "procurementCardDocumentJob" job in the "KFS-FP" jobstream
   # And I run the "electronicInvoiceExtractJob" job in the "KFS-PURAP" jobstream
   # And I run the "eCustomsDailyJob" job in the "KFS-VND" jobstream
   # And I run the "laborEncumbranceAdjustmentJob" job in the "KFS-LD" jobstream
   # And I run the "calculateEreJob" job in the "KFS-LD" jobstream
   # And I run the "laborNightlyOutJob" job in the "KFS-LD" jobstream
   # And I run the "laborScrubberJob" job in the "KFS-LD" jobstream
   # And I run the "laborPosterJob" job in the "KFS-LD" jobstream
   # And I run the "laborBalancingJob" job in the "KFS-LD" jobstream
   # And I run the "ereSweepJob" job in the "KFS-LD" jobstream
   # And I run the "laborScrubberJob" job in the "KFS-LD" jobstream
   # And I run the "laborPosterJob" job in the "KFS-LD" jobstream
   # And I run the "laborBalancingJob" job in the "KFS-LD" jobstream
   # And I run the "laborFeedJob" job in the "KFS-LD" jobstream
   # And I run the "clearLaborPendingEntriesJob" job in the "KFS-LD" jobstream
   And I run the "nightlyOutJob" job in the "KFS-GL" jobstream
   # And I run the "enterpriseFeedJob" job in the "KFS-GL" jobstream
   # And I run the "collectorJob" job in the "KFS-GL" jobstream
   And I run the "scrubberJob" job in the "KFS-GL" jobstream
   And I run the "posterJob" job in the "KFS-GL" jobstream
   And I run the "posterBalancingJob" job in the "KFS-GL" jobstream
   And I run the "clearPendingEntriesJob" job in the "KFS-GL" jobstream
   # And I run the "cabExtractJob" job in the "KFS-CAB" jobstream
