From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Tue, 28 May 2013 04:51:07 +0000
Subject: [Patch] Staging: winbond: Macros values enclosed in parenthesis
Message-Id: <51A434EB.9070208@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Macros with complex values enclosed in parenthesis

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/mto.h |   64 ++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff -uprN a/drivers/staging/winbond/mto.h b/drivers/staging/winbond/mto.h
--- a/drivers/staging/winbond/mto.h	2013-05-28 01:16:06.347519242 +0530
+++ b/drivers/staging/winbond/mto.h	2013-05-28 01:20:36.047507217 +0530
@@ -84,41 +84,41 @@ struct wb35_mto_params {
 #define LOCAL_IS_CONNECTED()	(adapter->sLocalPara.wConnectedSTAindex != 0)
 #define MTO_INITTXRATE_MODE	(adapter->sHwData.SoftwareSet&0x2) /* bit 1 */
 
-#define MTO_POWER_CHANGE_ENABLE()	MTO_DATA().PowerChangeEnable
-#define MTO_CCA_MODE()			MTO_DATA().CCA_Mode
-#define MTO_CCA_MODE_SETUP()		MTO_DATA().CCA_Mode_Setup
-#define MTO_PREAMBLE_TYPE()		MTO_DATA().Preamble_Type
-#define MTO_PREAMBLE_CHANGE_ENABLE()	MTO_DATA().PreambleChangeEnable
-
-#define MTO_RATE_LEVEL()		MTO_DATA().DataRateLevel
-#define MTO_OFDM_RATE_LEVEL()		MTO_DATA().OfdmRateLevel
-#define MTO_RATE_CHANGE_ENABLE()	MTO_DATA().DataRateChangeEnable
-#define MTO_FRAG_TH_LEVEL()		MTO_DATA().FragThresholdLevel
-#define MTO_FRAG_CHANGE_ENABLE()	MTO_DATA().FragThresholdChangeEnable
-#define MTO_RTS_THRESHOLD()		MTO_DATA().RTSThreshold
-#define MTO_RTS_CHANGE_ENABLE()		MTO_DATA().RTSChangeEnable
-#define MTO_RTS_THRESHOLD_SETUP()	MTO_DATA().RTSThreshold_Setup
-
-#define MTO_AVG_IDLE_SLOT()		MTO_DATA().AvgIdleSlot
-#define MTO_PR_INTERF()			MTO_DATA().Pr_Interf
-#define MTO_AVG_GAP_BTWN_INTERF()	MTO_DATA().AvgGapBtwnInterf
-
-#define MTO_CNT_ANT(x)			MTO_DATA().Cnt_Ant[(x)]
-#define MTO_SQ_ANT(x)			MTO_DATA().SQ_Ant[(x)]
-#define MTO_AGING_TIMEOUT()		MTO_DATA().aging_timeout
+#define MTO_POWER_CHANGE_ENABLE()	(MTO_DATA().PowerChangeEnable)
+#define MTO_CCA_MODE()			(MTO_DATA().CCA_Mode)
+#define MTO_CCA_MODE_SETUP()		(MTO_DATA().CCA_Mode_Setup)
+#define MTO_PREAMBLE_TYPE()		(MTO_DATA().Preamble_Type)
+#define MTO_PREAMBLE_CHANGE_ENABLE()	(MTO_DATA().PreambleChangeEnable)
+
+#define MTO_RATE_LEVEL()		(MTO_DATA().DataRateLevel)
+#define MTO_OFDM_RATE_LEVEL()		(MTO_DATA().OfdmRateLevel)
+#define MTO_RATE_CHANGE_ENABLE()	(MTO_DATA().DataRateChangeEnable)
+#define MTO_FRAG_TH_LEVEL()		(MTO_DATA().FragThresholdLevel)
+#define MTO_FRAG_CHANGE_ENABLE()	(MTO_DATA().FragThresholdChangeEnable)
+#define MTO_RTS_THRESHOLD()		(MTO_DATA().RTSThreshold)
+#define MTO_RTS_CHANGE_ENABLE()		(MTO_DATA().RTSChangeEnable)
+#define MTO_RTS_THRESHOLD_SETUP()	(MTO_DATA().RTSThreshold_Setup)
+
+#define MTO_AVG_IDLE_SLOT()		(MTO_DATA().AvgIdleSlot)
+#define MTO_PR_INTERF()			(MTO_DATA().Pr_Interf)
+#define MTO_AVG_GAP_BTWN_INTERF()	(MTO_DATA().AvgGapBtwnInterf)
+
+#define MTO_CNT_ANT(x)			(MTO_DATA().Cnt_Ant[(x)])
+#define MTO_SQ_ANT(x)			(MTO_DATA().SQ_Ant[(x)])
+#define MTO_AGING_TIMEOUT()		(MTO_DATA().aging_timeout)
 
-#define MTO_TXFLOWCOUNT()		MTO_DATA().TxFlowCount
+#define MTO_TXFLOWCOUNT()		(MTO_DATA().TxFlowCount)
 
 /* --------- DTO threshold parameters ------------- */
-#define	MTOPARA_PERIODIC_CHECK_CYCLE()		MTO_DATA().DTO_PeriodicCheckCycle
-#define	MTOPARA_RSSI_TH_FOR_ANTDIV()		MTO_DATA().DTO_RssiThForAntDiv
-#define	MTOPARA_TXCOUNT_TH_FOR_CALC_RATE()	MTO_DATA().DTO_TxCountThForCalcNewRate
-#define	MTOPARA_TXRATE_INC_TH()			MTO_DATA().DTO_TxRateIncTh
-#define	MTOPARA_TXRATE_DEC_TH()			MTO_DATA().DTO_TxRateDecTh
-#define MTOPARA_TXRATE_EQ_TH()			MTO_DATA().DTO_TxRateEqTh
-#define	MTOPARA_TXRATE_BACKOFF()		MTO_DATA().DTO_TxRateBackOff
-#define	MTOPARA_TXRETRYRATE_REDUCE()		MTO_DATA().DTO_TxRetryRateReduce
-#define MTOPARA_TXPOWER_INDEX()			MTO_DATA().DTO_TxPowerIndex
+#define MTOPARA_PERIODIC_CHECK_CYCLE()		(MTO_DATA().DTO_PeriodicCheckCycle)
+#define MTOPARA_RSSI_TH_FOR_ANTDIV()		(MTO_DATA().DTO_RssiThForAntDiv)
+#define MTOPARA_TXCOUNT_TH_FOR_CALC_RATE()	(MTO_DATA().DTO_TxCountThForCalcNewRate)
+#define MTOPARA_TXRATE_INC_TH()			(MTO_DATA().DTO_TxRateIncTh)
+#define MTOPARA_TXRATE_DEC_TH()			(MTO_DATA().DTO_TxRateDecTh)
+#define MTOPARA_TXRATE_EQ_TH()			(MTO_DATA().DTO_TxRateEqTh)
+#define MTOPARA_TXRATE_BACKOFF()		(MTO_DATA().DTO_TxRateBackOff)
+#define MTOPARA_TXRETRYRATE_REDUCE()		(MTO_DATA().DTO_TxRetryRateReduce)
+#define MTOPARA_TXPOWER_INDEX()			(MTO_DATA().DTO_TxPowerIndex)
 /* ------------------------------------------------ */
 
 
