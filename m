From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Thu, 11 Jun 2015 05:35:57 +0000
Subject: [PATCH V3 6/9] staging: wilc1000: remove WILC_Sint8
Message-Id: <1434000960-16909-6-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use s8 instead of WILC_Sint8.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V3: rebased on the top of staging-testing
V2: remove the spaces on the subject
    capitalize the name on the From and the Signed-off-by

 drivers/staging/wilc1000/coreconfigurator.c |  18 ++--
 drivers/staging/wilc1000/coreconfigurator.h |   8 +-
 drivers/staging/wilc1000/host_interface.c   | 148 ++++++++++++++--------------
 drivers/staging/wilc1000/host_interface.h   |  12 +--
 drivers/staging/wilc1000/linux_wlan.c       |   2 +-
 drivers/staging/wilc1000/wilc_oswrapper.h   |   1 -
 6 files changed, 94 insertions(+), 95 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 0a03080..f51bfa4 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -158,7 +158,7 @@ typedef struct {
 /*****************************************************************************/
 /* Extern Function Declarations                                              */
 /*****************************************************************************/
-extern WILC_Sint32 SendRawPacket(WILC_Sint8 *ps8Packet, WILC_Sint32 s32PacketLen);
+extern WILC_Sint32 SendRawPacket(s8 *ps8Packet, WILC_Sint32 s32PacketLen);
 extern void NetworkInfoReceived(u8 *pu8Buffer, u32 u32Length);
 extern void GnrlAsyncInfoReceived(u8 *pu8Buffer, u32 u32Length);
 extern void host_int_ScanCompleteReceived(u8 *pu8Buffer, u32 u32Length);
@@ -168,7 +168,7 @@ extern void host_int_ScanCompleteReceived(u8 *pu8Buffer, u32 u32Length);
 static struct semaphore SemHandleSendPkt;
 static struct semaphore SemHandlePktResp;
 
-static WILC_Sint8 *gps8ConfigPacket;
+static s8 *gps8ConfigPacket;
 
 static tstrConfigPktInfo gstrConfigPktInfo;
 
@@ -678,7 +678,7 @@ WILC_Sint32 CoreConfiguratorInit(void)
 	sema_init(&SemHandleSendPkt, 1);
 	sema_init(&SemHandlePktResp, 0);
 
-	gps8ConfigPacket = (WILC_Sint8 *)WILC_MALLOC(MAX_PACKET_BUFF_SIZE);
+	gps8ConfigPacket = (s8 *)WILC_MALLOC(MAX_PACKET_BUFF_SIZE);
 	if (gps8ConfigPacket = NULL) {
 		PRINT_ER("failed in gps8ConfigPacket allocation\n");
 		s32Error = WILC_NO_MEM;
@@ -1097,7 +1097,7 @@ WILC_Sint32 DeallocateSurveyResults(wid_site_survey_reslts_s *pstrSurveyResults)
 /*****************************************************************************/
 
 void ProcessCharWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
-		    tstrWID *pstrWID, WILC_Sint8 *ps8WidVal)
+		    tstrWID *pstrWID, s8 *ps8WidVal)
 {
 	u8 *pu8val = (u8 *)ps8WidVal;
 	u8 u8val = 0;
@@ -1151,7 +1151,7 @@ void ProcessCharWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 /*****************************************************************************/
 
 void ProcessShortWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
-		     tstrWID *pstrWID, WILC_Sint8 *ps8WidVal)
+		     tstrWID *pstrWID, s8 *ps8WidVal)
 {
 	u16 *pu16val = (u16 *)ps8WidVal;
 	u16 u16val = 0;
@@ -1206,7 +1206,7 @@ void ProcessShortWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 /*****************************************************************************/
 
 void ProcessIntWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
-		   tstrWID *pstrWID, WILC_Sint8 *ps8WidVal)
+		   tstrWID *pstrWID, s8 *ps8WidVal)
 {
 	u32 *pu32val = (u32 *)ps8WidVal;
 	u32 u32val = 0;
@@ -1551,7 +1551,7 @@ WILC_Sint32 further_process_response(u8 *resp,
 		u16 *pu16val = (u16 *)(pstrWIDresult->ps8WidVal);
 		cfg_sht = MAKE_WORD16(resp[idx], resp[idx + 1]);
 		/*Set local copy of WID*/
-		/* pstrWIDresult->ps8WidVal = (WILC_Sint8*)(WILC_Sint32)cfg_sht; */
+		/* pstrWIDresult->ps8WidVal = (s8*)(WILC_Sint32)cfg_sht; */
 		*pu16val = cfg_sht;
 		break;
 	}
@@ -1564,7 +1564,7 @@ WILC_Sint32 further_process_response(u8 *resp,
 				MAKE_WORD16(resp[idx + 2], resp[idx + 3])
 				);
 		/*Set local copy of WID*/
-		/* pstrWIDresult->ps8WidVal = (WILC_Sint8*)cfg_int; */
+		/* pstrWIDresult->ps8WidVal = (s8*)cfg_int; */
 		*pu32val = cfg_int;
 		break;
 	}
@@ -1857,7 +1857,7 @@ WILC_Sint32 CreatePacketHeader(WILC_Char *pcpacket, WILC_Sint32 *ps32PacketLengt
  *  @version	1.0
  */
 
-WILC_Sint32 CreateConfigPacket(WILC_Sint8 *ps8packet, WILC_Sint32 *ps32PacketLength,
+WILC_Sint32 CreateConfigPacket(s8 *ps8packet, WILC_Sint32 *ps32PacketLength,
 			       tstrWID *pstrWIDs, u32 u32WIDsCount)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
diff --git a/drivers/staging/wilc1000/coreconfigurator.h b/drivers/staging/wilc1000/coreconfigurator.h
index 6d16bba..44941cd 100644
--- a/drivers/staging/wilc1000/coreconfigurator.h
+++ b/drivers/staging/wilc1000/coreconfigurator.h
@@ -397,18 +397,18 @@ typedef struct {
 	u16 u16WIDid;
 	tenuWIDtype enuWIDtype;
 	WILC_Sint32 s32ValueSize;
-	WILC_Sint8      *ps8WidVal;
+	s8      *ps8WidVal;
 
 } tstrWID;
 
 typedef struct {
 	u8 u8Full;
 	u8 u8Index;
-	WILC_Sint8 as8RSSI[NUM_RSSI];
+	s8 as8RSSI[NUM_RSSI];
 } tstrRSSI;
 /* This structure is used to support parsing of the received 'N' message */
 typedef struct {
-	WILC_Sint8 s8rssi;
+	s8 s8rssi;
 	u16 u16CapInfo;
 	u8 au8ssid[MAX_SSID_LEN];
 	u8 u8SsidLen;
@@ -490,7 +490,7 @@ extern WILC_Sint32 ParseSurveyResults(u8 ppu8RcvdSiteSurveyResults[][MAX_SURVEY_
 extern WILC_Sint32 DeallocateSurveyResults(wid_site_survey_reslts_s *pstrSurveyResults);
 #endif
 
-extern WILC_Sint32 SendRawPacket(WILC_Sint8 *pspacket, WILC_Sint32 s32PacketLen);
+extern WILC_Sint32 SendRawPacket(s8 *pspacket, WILC_Sint32 s32PacketLen);
 extern void NetworkInfoReceived(u8 *pu8Buffer, u32 u32Length);
 void GnrlAsyncInfoReceived(u8 *pu8Buffer, u32 u32Length);
 void host_int_ScanCompleteReceived(u8 *pu8Buffer, u32 u32Length);
diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 75effdb..ce8e5b3 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -564,8 +564,8 @@ static u8 gapu8RcvdAssocResp[MAX_ASSOC_RESP_FRAME_SIZE];
 
 WILC_Bool gbScanWhileConnected = WILC_FALSE;
 
-static WILC_Sint8 gs8Rssi;
-static WILC_Sint8 gs8lnkspd;
+static s8 gs8Rssi;
+static s8 gs8lnkspd;
 static u8 gu8Chnl;
 static u8 gs8SetIP[2][4];
 static u8 gs8GetIP[2][4];
@@ -654,7 +654,7 @@ static WILC_Sint32 Handle_SetWfiDrvHandler(tstrHostIfSetDrvHandler *pstrHostIfSe
 	/*prepare configuration packet*/
 	strWID.u16WIDid = (u16)WID_SET_DRV_HANDLER;
 	strWID.enuWIDtype = WID_INT;
-	strWID.ps8WidVal = (WILC_Sint8 *)&(pstrHostIfSetDrvHandler->u32Address);
+	strWID.ps8WidVal = (s8 *)&(pstrHostIfSetDrvHandler->u32Address);
 	strWID.s32ValueSize = sizeof(u32);
 
 	/*Sending Cfg*/
@@ -699,7 +699,7 @@ static WILC_Sint32 Handle_SetOperationMode(void *drvHandler, tstrHostIfSetOperat
 	/*prepare configuration packet*/
 	strWID.u16WIDid = (u16)WID_SET_OPERATION_MODE;
 	strWID.enuWIDtype = WID_INT;
-	strWID.ps8WidVal = (WILC_Sint8 *)&(pstrHostIfSetOperationMode->u32Mode);
+	strWID.ps8WidVal = (s8 *)&(pstrHostIfSetOperationMode->u32Mode);
 	strWID.s32ValueSize = sizeof(u32);
 
 	/*Sending Cfg*/
@@ -943,7 +943,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* validate input then copy>> need to check value 4 and 5 */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.bss_type < 6) {
 			strWIDList[u8WidCnt].u16WIDid = WID_BSS_TYPE;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.bss_type;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.bss_type;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.bss_type = (u8)strHostIFCfgParamAttr->pstrCfgParamVal.bss_type;
@@ -961,7 +961,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/*validate Possible values*/
 		if ((strHostIFCfgParamAttr->pstrCfgParamVal.auth_type) = 1 || (strHostIFCfgParamAttr->pstrCfgParamVal.auth_type) = 2 || (strHostIFCfgParamAttr->pstrCfgParamVal.auth_type) = 5) {
 			strWIDList[u8WidCnt].u16WIDid = WID_AUTH_TYPE;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.auth_type;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.auth_type;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.auth_type = (u8)strHostIFCfgParamAttr->pstrCfgParamVal.auth_type;
@@ -974,7 +974,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range is 1 to 65535. */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.auth_timeout > 0 && strHostIFCfgParamAttr->pstrCfgParamVal.auth_timeout < 65536) {
 			strWIDList[u8WidCnt].u16WIDid = WID_AUTH_TIMEOUT;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.auth_timeout;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.auth_timeout;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.auth_timeout = strHostIFCfgParamAttr->pstrCfgParamVal.auth_timeout;
@@ -993,7 +993,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/*----------------------------------------------------------*/
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.power_mgmt_mode < 5) {
 			strWIDList[u8WidCnt].u16WIDid = WID_POWER_MANAGEMENT;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.power_mgmt_mode;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.power_mgmt_mode;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.power_mgmt_mode = (u8)strHostIFCfgParamAttr->pstrCfgParamVal.power_mgmt_mode;
@@ -1006,7 +1006,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range from 1 to 256 */
 		if ((strHostIFCfgParamAttr->pstrCfgParamVal.short_retry_limit > 0) && (strHostIFCfgParamAttr->pstrCfgParamVal.short_retry_limit < 256))	{
 			strWIDList[u8WidCnt].u16WIDid = WID_SHORT_RETRY_LIMIT;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.short_retry_limit;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.short_retry_limit;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.short_retry_limit = strHostIFCfgParamAttr->pstrCfgParamVal.short_retry_limit;
@@ -1019,7 +1019,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range from 1 to 256 */
 		if ((strHostIFCfgParamAttr->pstrCfgParamVal.long_retry_limit > 0) && (strHostIFCfgParamAttr->pstrCfgParamVal.long_retry_limit < 256)) {
 			strWIDList[u8WidCnt].u16WIDid = WID_LONG_RETRY_LIMIT;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.long_retry_limit;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.long_retry_limit;
 
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
@@ -1033,7 +1033,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.frag_threshold > 255 && strHostIFCfgParamAttr->pstrCfgParamVal.frag_threshold < 7937) {
 			strWIDList[u8WidCnt].u16WIDid = WID_FRAG_THRESHOLD;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.frag_threshold;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.frag_threshold;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.frag_threshold = strHostIFCfgParamAttr->pstrCfgParamVal.frag_threshold;
@@ -1046,7 +1046,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range 256 to 65535 */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.rts_threshold > 255 && strHostIFCfgParamAttr->pstrCfgParamVal.rts_threshold < 65536)	{
 			strWIDList[u8WidCnt].u16WIDid = WID_RTS_THRESHOLD;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.rts_threshold;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.rts_threshold;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.rts_threshold = strHostIFCfgParamAttr->pstrCfgParamVal.rts_threshold;
@@ -1063,7 +1063,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/*------------------------------------------------------*/
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.preamble_type < 3) {
 			strWIDList[u8WidCnt].u16WIDid = WID_PREAMBLE;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.preamble_type;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.preamble_type;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.preamble_type = strHostIFCfgParamAttr->pstrCfgParamVal.preamble_type;
@@ -1075,7 +1075,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 	if (strHostIFCfgParamAttr->pstrCfgParamVal.u32SetCfgFlag & SHORT_SLOT_ALLOWED) {
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.short_slot_allowed < 2) {
 			strWIDList[u8WidCnt].u16WIDid = WID_SHORT_SLOT_ALLOWED;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.short_slot_allowed;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.short_slot_allowed;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.short_slot_allowed = (u8)strHostIFCfgParamAttr->pstrCfgParamVal.short_slot_allowed;
@@ -1091,7 +1091,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/*Input Values: 1 for enable and 0 for disable.							*/
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.txop_prot_disabled < 2) {
 			strWIDList[u8WidCnt].u16WIDid = WID_11N_TXOP_PROT_DISABLE;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.txop_prot_disabled;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.txop_prot_disabled;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.txop_prot_disabled = (u8)strHostIFCfgParamAttr->pstrCfgParamVal.txop_prot_disabled;
@@ -1104,7 +1104,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range is 1 to 65535. */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.beacon_interval > 0 && strHostIFCfgParamAttr->pstrCfgParamVal.beacon_interval < 65536) {
 			strWIDList[u8WidCnt].u16WIDid = WID_BEACON_INTERVAL;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.beacon_interval;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.beacon_interval;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.beacon_interval = strHostIFCfgParamAttr->pstrCfgParamVal.beacon_interval;
@@ -1117,7 +1117,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range is 1 to 255. */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.dtim_period > 0 && strHostIFCfgParamAttr->pstrCfgParamVal.dtim_period < 256) {
 			strWIDList[u8WidCnt].u16WIDid = WID_DTIM_PERIOD;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.dtim_period;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.dtim_period;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.dtim_period = strHostIFCfgParamAttr->pstrCfgParamVal.dtim_period;
@@ -1134,7 +1134,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/*----------------------------------------------------------------------*/
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_enabled < 3) {
 			strWIDList[u8WidCnt].u16WIDid = WID_SITE_SURVEY;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_enabled;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_enabled;
 			strWIDList[u8WidCnt].enuWIDtype = WID_CHAR;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Char);
 			pstrWFIDrv->strCfgValues.site_survey_enabled = (u8)strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_enabled;
@@ -1147,7 +1147,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range is 1 to 65535. */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_scan_time > 0 && strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_scan_time < 65536) {
 			strWIDList[u8WidCnt].u16WIDid = WID_SITE_SURVEY_SCAN_TIME;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_scan_time;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_scan_time;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.site_survey_scan_time = strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_scan_time;
@@ -1160,7 +1160,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range is 1 to 65535. */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.active_scan_time > 0 && strHostIFCfgParamAttr->pstrCfgParamVal.active_scan_time < 65536) {
 			strWIDList[u8WidCnt].u16WIDid = WID_ACTIVE_SCAN_TIME;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.active_scan_time;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.active_scan_time;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.active_scan_time = strHostIFCfgParamAttr->pstrCfgParamVal.active_scan_time;
@@ -1173,7 +1173,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		/* range is 1 to 65535. */
 		if (strHostIFCfgParamAttr->pstrCfgParamVal.passive_scan_time > 0 && strHostIFCfgParamAttr->pstrCfgParamVal.passive_scan_time < 65536) {
 			strWIDList[u8WidCnt].u16WIDid = WID_PASSIVE_SCAN_TIME;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.passive_scan_time;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.passive_scan_time;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.passive_scan_time = strHostIFCfgParamAttr->pstrCfgParamVal.passive_scan_time;
@@ -1196,7 +1196,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		    || curr_tx_rate = MBPS_18 || curr_tx_rate = MBPS_24
 		    || curr_tx_rate = MBPS_36 || curr_tx_rate = MBPS_48 || curr_tx_rate = MBPS_54) {
 			strWIDList[u8WidCnt].u16WIDid = WID_CURRENT_TX_RATE;
-			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&curr_tx_rate;
+			strWIDList[u8WidCnt].ps8WidVal = (s8 *)&curr_tx_rate;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
 			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.curr_tx_rate = (u8)curr_tx_rate;
@@ -1334,7 +1334,7 @@ static WILC_Sint32 Handle_Scan(void *drvHandler, tstrHostIFscanAttr *pstrHostIFs
 	strWIDList[u32WidsCount].u16WIDid = WID_SCAN_TYPE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFscanAttr->u8ScanType));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrHostIFscanAttr->u8ScanType));
 	u32WidsCount++;
 
 	/*list of channels to be scanned*/
@@ -1360,7 +1360,7 @@ static WILC_Sint32 Handle_Scan(void *drvHandler, tstrHostIFscanAttr *pstrHostIFs
 	strWIDList[u32WidsCount].u16WIDid = WID_START_SCAN_REQ;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFscanAttr->u8ScanSource));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrHostIFscanAttr->u8ScanSource));
 	u32WidsCount++;
 
 	/*keep the state as is , no need to change it*/
@@ -1446,7 +1446,7 @@ static WILC_Sint32 Handle_ScanDone(void *drvHandler, tenuScanEvent enuEvent)
 		u8abort_running_scan = 1;
 		strWID.u16WIDid	= (u16)WID_ABORT_RUNNING_SCAN;
 		strWID.enuWIDtype	= WID_CHAR;
-		strWID.ps8WidVal = (WILC_Sint8 *)&u8abort_running_scan;
+		strWID.ps8WidVal = (s8 *)&u8abort_running_scan;
 		strWID.s32ValueSize = sizeof(WILC_Char);
 
 		/*Sending Cfg*/
@@ -1614,7 +1614,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 		strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_MODE;
 		strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 		strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-		strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrWFIDrv->strWILC_UsrConnReq.u8security));
+		strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrWFIDrv->strWILC_UsrConnReq.u8security));
 		u32WidsCount++;
 
 		PRINT_INFO(HOSTINF_DBG, "Encrypt Mode = %x\n", pstrWFIDrv->strWILC_UsrConnReq.u8security);
@@ -1622,7 +1622,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 		strWIDList[u32WidsCount].u16WIDid = (u16)WID_AUTH_TYPE;
 		strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 		strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-		strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
+		strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
 		u32WidsCount++;
 
 		PRINT_INFO(HOSTINF_DBG, "Authentication Type = %x\n", pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
@@ -1630,14 +1630,14 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 		 * strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_PSK;
 		 * strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 		 * strWIDList[u32WidsCount].s32ValueSize = sizeof(passphrase);
-		 * strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8*)(passphrase);
+		 * strWIDList[u32WidsCount].ps8WidVal = (s8*)(passphrase);
 		 * u32WidsCount++;
 		 */
 
 		strWIDList[u32WidsCount].u16WIDid = (u16)WID_JOIN_REQ;
 		strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 		strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-		strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)&u8bssDscListIndex;
+		strWIDList[u32WidsCount].ps8WidVal = (s8 *)&u8bssDscListIndex;
 		u32WidsCount++;
 
 		#ifndef SIMULATION
@@ -1723,19 +1723,19 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 	strWIDList[u32WidsCount].u16WIDid = WID_SUCCESS_FRAME_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(dummyval));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(dummyval));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_RECEIVED_FRAGMENT_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(dummyval));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(dummyval));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_FAILED_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(dummyval));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(dummyval));
 	u32WidsCount++;
 
 	/* if((gWFiDrvHandle->strWILC_UsrConnReq.pu8ConnReqIEs != NULL) && */
@@ -1760,7 +1760,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 	strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_MODE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrWFIDrv->strWILC_UsrConnReq.u8security));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrWFIDrv->strWILC_UsrConnReq.u8security));
 	u32WidsCount++;
 
 	/*BugID_5137*/
@@ -1773,7 +1773,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 	strWIDList[u32WidsCount].u16WIDid = (u16)WID_AUTH_TYPE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
 	u32WidsCount++;
 
 	/*BugID_5137*/
@@ -1785,7 +1785,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 	 * strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_PSK;
 	 * strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 	 * strWIDList[u32WidsCount].s32ValueSize = sizeof(passphrase);
-	 * strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8*)(passphrase);
+	 * strWIDList[u32WidsCount].ps8WidVal = (s8*)(passphrase);
 	 * u32WidsCount++;
 	 */
 
@@ -2095,7 +2095,7 @@ static WILC_Sint32 Handle_FlushConnect(void *drvHandler)
 	strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_MODE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(gu8Flushed11iMode));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(gu8Flushed11iMode));
 	u32WidsCount++;
 
 
@@ -2103,7 +2103,7 @@ static WILC_Sint32 Handle_FlushConnect(void *drvHandler)
 	strWIDList[u32WidsCount].u16WIDid = (u16)WID_AUTH_TYPE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&gu8FlushedAuthType);
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&gu8FlushedAuthType);
 	u32WidsCount++;
 
 
@@ -2111,7 +2111,7 @@ static WILC_Sint32 Handle_FlushConnect(void *drvHandler)
 	strWIDList[u32WidsCount].u16WIDid = (u16)WID_JOIN_REQ_EXTENDED;
 	strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 	strWIDList[u32WidsCount].s32ValueSize = gu32FlushedJoinReqSize;
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)gu8FlushedJoinReq;
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)gu8FlushedJoinReq;
 	pu8CurrByte = strWIDList[u32WidsCount].ps8WidVal;
 
 	pu8CurrByte += FLUSHED_BYTE_POS;
@@ -2201,7 +2201,7 @@ static WILC_Sint32 Handle_ConnectTimeout(void *drvHandler)
 	 *   WID_DISCONNECT} */
 	strWID.u16WIDid = (u16)WID_DISCONNECT;
 	strWID.enuWIDtype = WID_CHAR;
-	strWID.ps8WidVal = (WILC_Sint8 *)&u16DummyReasonCode;
+	strWID.ps8WidVal = (s8 *)&u16DummyReasonCode;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 
 	PRINT_D(HOSTINF_DBG, "Sending disconnect request\n");
@@ -2715,8 +2715,8 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 	#endif
 	u8 i;
 	u8 *pu8keybuf;
-	WILC_Sint8 s8idxarray[1];
-	WILC_Sint8 ret = 0;
+	s8 s8idxarray[1];
+	s8 ret = 0;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
 
@@ -2733,17 +2733,17 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWIDList[0].u16WIDid = (u16)WID_11I_MODE;
 			strWIDList[0].enuWIDtype = WID_CHAR;
 			strWIDList[0].s32ValueSize = sizeof(WILC_Char);
-			strWIDList[0].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8mode));
+			strWIDList[0].ps8WidVal = (s8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8mode));
 
 			strWIDList[1].u16WIDid     = WID_AUTH_TYPE;
 			strWIDList[1].enuWIDtype  = WID_CHAR;
 			strWIDList[1].s32ValueSize = sizeof(WILC_Char);
-			strWIDList[1].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.tenuAuth_type));
+			strWIDList[1].ps8WidVal = (s8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.tenuAuth_type));
 
 			strWIDList[2].u16WIDid	= (u16)WID_KEY_ID;
 			strWIDList[2].enuWIDtype	= WID_CHAR;
 
-			strWIDList[2].ps8WidVal	= (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx));
+			strWIDList[2].ps8WidVal	= (s8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx));
 			strWIDList[2].s32ValueSize = sizeof(WILC_Char);
 
 
@@ -2764,7 +2764,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWIDList[3].u16WIDid = (u16)WID_WEP_KEY_VALUE;
 			strWIDList[3].enuWIDtype = WID_STR;
 			strWIDList[3].s32ValueSize = pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8WepKeylen;
-			strWIDList[3].ps8WidVal = (WILC_Sint8 *)pu8keybuf;
+			strWIDList[3].ps8WidVal = (s8 *)pu8keybuf;
 
 
 			s32Error = SendConfigPkt(SET_CFG, strWIDList, 4, WILC_TRUE, (u32)pstrWFIDrv);
@@ -2792,7 +2792,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 
 			strWID.u16WIDid	= (u16)WID_ADD_WEP_KEY;
 			strWID.enuWIDtype	= WID_STR;
-			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
+			strWID.ps8WidVal	= (s8 *)pu8keybuf;
 			strWID.s32ValueSize = pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8WepKeylen + 2;
 
 			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
@@ -2803,7 +2803,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWID.u16WIDid	= (u16)WID_REMOVE_WEP_KEY;
 			strWID.enuWIDtype	= WID_STR;
 
-			s8idxarray[0] = (WILC_Sint8)pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx;
+			s8idxarray[0] = (s8)pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx;
 			strWID.ps8WidVal = s8idxarray;
 			strWID.s32ValueSize = 1;
 
@@ -2811,7 +2811,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 		} else {
 			strWID.u16WIDid	= (u16)WID_KEY_ID;
 			strWID.enuWIDtype	= WID_CHAR;
-			strWID.ps8WidVal	= (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx));
+			strWID.ps8WidVal	= (s8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx));
 			strWID.s32ValueSize = sizeof(WILC_Char);
 
 			PRINT_D(HOSTINF_DBG, "Setting default key index\n");
@@ -2855,11 +2855,11 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWIDList[0].u16WIDid = (u16)WID_11I_MODE;
 			strWIDList[0].enuWIDtype = WID_CHAR;
 			strWIDList[0].s32ValueSize = sizeof(WILC_Char);
-			strWIDList[0].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Ciphermode));
+			strWIDList[0].ps8WidVal = (s8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Ciphermode));
 
 			strWIDList[1].u16WIDid	= (u16)WID_ADD_RX_GTK;
 			strWIDList[1].enuWIDtype	= WID_STR;
-			strWIDList[1].ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
+			strWIDList[1].ps8WidVal	= (s8 *)pu8keybuf;
 			strWIDList[1].s32ValueSize = RX_MIC_KEY_MSG_LEN;
 
 			s32Error = SendConfigPkt(SET_CFG, strWIDList, 2, WILC_TRUE, (u32)pstrWFIDrv);
@@ -2906,7 +2906,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 
 			strWID.u16WIDid	= (u16)WID_ADD_RX_GTK;
 			strWID.enuWIDtype	= WID_STR;
-			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
+			strWID.ps8WidVal	= (s8 *)pu8keybuf;
 			strWID.s32ValueSize = RX_MIC_KEY_MSG_LEN;
 
 			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
@@ -2959,11 +2959,11 @@ _WPARxGtk_end_case_:
 			strWIDList[0].u16WIDid = (u16)WID_11I_MODE;
 			strWIDList[0].enuWIDtype = WID_CHAR;
 			strWIDList[0].s32ValueSize = sizeof(WILC_Char);
-			strWIDList[0].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Ciphermode));
+			strWIDList[0].ps8WidVal = (s8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Ciphermode));
 
 			strWIDList[1].u16WIDid	= (u16)WID_ADD_PTK;
 			strWIDList[1].enuWIDtype	= WID_STR;
-			strWIDList[1].ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
+			strWIDList[1].ps8WidVal	= (s8 *)pu8keybuf;
 			strWIDList[1].s32ValueSize = PTK_KEY_MSG_LEN + 1;
 
 			s32Error = SendConfigPkt(SET_CFG, strWIDList, 2, WILC_TRUE, (u32)pstrWFIDrv);
@@ -3004,7 +3004,7 @@ _WPARxGtk_end_case_:
 
 			strWID.u16WIDid	= (u16)WID_ADD_PTK;
 			strWID.enuWIDtype	= WID_STR;
-			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
+			strWID.ps8WidVal	= (s8 *)pu8keybuf;
 			strWID.s32ValueSize = PTK_KEY_MSG_LEN;
 
 			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
@@ -3043,7 +3043,7 @@ _WPAPtk_end_case_:
 
 		strWID.u16WIDid	= (u16)WID_PMKID_INFO;
 		strWID.enuWIDtype = WID_STR;
-		strWID.ps8WidVal = (WILC_Sint8 *)pu8keybuf;
+		strWID.ps8WidVal = (s8 *)pu8keybuf;
 		strWID.s32ValueSize = (pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFpmkidAttr.numpmkid * PMKSA_KEY_LEN) + 1;
 
 		s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
@@ -3080,7 +3080,7 @@ static void Handle_Disconnect(void *drvHandler)
 
 	strWID.u16WIDid = (u16)WID_DISCONNECT;
 	strWID.enuWIDtype = WID_CHAR;
-	strWID.ps8WidVal = (WILC_Sint8 *)&u16DummyReasonCode;
+	strWID.ps8WidVal = (s8 *)&u16DummyReasonCode;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 
 
@@ -3247,7 +3247,7 @@ static WILC_Sint32 Handle_GetChnl(void *drvHandler)
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 	strWID.u16WIDid = (u16)WID_CURRENT_CHANNEL;
 	strWID.enuWIDtype = WID_CHAR;
-	strWID.ps8WidVal = (WILC_Sint8 *)&gu8Chnl;
+	strWID.ps8WidVal = (s8 *)&gu8Chnl;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 
 	PRINT_D(HOSTINF_DBG, "Getting channel value\n");
@@ -3350,31 +3350,31 @@ WILC_Sint32 Handle_GetStatistics(void *drvHandler, tstrStatistics *pstrStatistic
 	strWIDList[u32WidsCount].u16WIDid = WID_LINKSPEED;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->u8LinkSpeed));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrStatistics->u8LinkSpeed));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_RSSI;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->s8RSSI));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrStatistics->s8RSSI));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_SUCCESS_FRAME_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->u32TxCount));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrStatistics->u32TxCount));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_RECEIVED_FRAGMENT_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->u32RxCount));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrStatistics->u32RxCount));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_FAILED_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
-	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->u32TxFailureCount));
+	strWIDList[u32WidsCount].ps8WidVal = (s8 *)(&(pstrStatistics->u32TxFailureCount));
 	u32WidsCount++;
 
 	s32Error = SendConfigPkt(GET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (u32)drvHandler);
@@ -3435,7 +3435,7 @@ static WILC_Sint32 Handle_Get_InActiveTime(void *drvHandler, tstrHostIfStaInacti
 
 	strWID.u16WIDid = (u16)WID_GET_INACTIVE_TIME;
 	strWID.enuWIDtype = WID_INT;
-	strWID.ps8WidVal = (WILC_Sint8 *)&gu32InactiveTime;
+	strWID.ps8WidVal = (s8 *)&gu32InactiveTime;
 	strWID.s32ValueSize = sizeof(u32);
 
 
@@ -3877,14 +3877,14 @@ static int Handle_RemainOnChan(void *drvHandler, tstrHostIfRemainOnChan *pstrHos
 	strWID.u16WIDid	= (u16)WID_REMAIN_ON_CHAN;
 	strWID.enuWIDtype	= WID_STR;
 	strWID.s32ValueSize = 2;
-	strWID.ps8WidVal = (WILC_Sint8 *)WILC_MALLOC(strWID.s32ValueSize);
+	strWID.ps8WidVal = (s8 *)WILC_MALLOC(strWID.s32ValueSize);
 
 	if (strWID.ps8WidVal = NULL) {
 		WILC_ERRORREPORT(s32Error, WILC_NO_MEM);
 	}
 
 	strWID.ps8WidVal[0] = u8remain_on_chan_flag;
-	strWID.ps8WidVal[1] = (WILC_Sint8)pstrHostIfRemainOnChan->u16Channel;
+	strWID.ps8WidVal[1] = (s8)pstrHostIfRemainOnChan->u16Channel;
 
 	/*Sending Cfg*/
 	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
@@ -4067,7 +4067,7 @@ static void Handle_PowerManagement(void *drvHandler, tstrHostIfPowerMgmtParam *s
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWID;
-	WILC_Sint8 s8PowerMode;
+	s8 s8PowerMode;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 	strWID.u16WIDid = (u16)WID_POWER_MANAGEMENT;
 
@@ -4642,7 +4642,7 @@ WILC_Sint32 host_int_remove_key(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8StaAddre
 
 	strWID.u16WIDid	= (u16)WID_REMOVE_KEY;
 	strWID.enuWIDtype	= WID_STR;
-	strWID.ps8WidVal	= (WILC_Sint8 *)pu8StaAddress;
+	strWID.ps8WidVal	= (s8 *)pu8StaAddress;
 	strWID.s32ValueSize = 6;
 
 	return s32Error;
@@ -5483,7 +5483,7 @@ WILC_Sint32 host_int_set_start_scan_req(WILC_WFIDrvHandle hWFIDrv, u8 scanSource
 
 	strWID.u16WIDid = (u16)WID_START_SCAN_REQ;
 	strWID.enuWIDtype = WID_CHAR;
-	strWID.ps8WidVal = (WILC_Sint8 *)&scanSource;
+	strWID.ps8WidVal = (s8 *)&scanSource;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 
 	return s32Error;
@@ -5513,7 +5513,7 @@ WILC_Sint32 host_int_get_start_scan_req(WILC_WFIDrvHandle hWFIDrv, u8 *pu8ScanSo
 
 	strWID.u16WIDid = (u16)WID_START_SCAN_REQ;
 	strWID.enuWIDtype = WID_CHAR;
-	strWID.ps8WidVal = (WILC_Sint8 *)pu8ScanSource;
+	strWID.ps8WidVal = (s8 *)pu8ScanSource;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 
 	return s32Error;
@@ -5733,7 +5733,7 @@ WILC_Sint32 host_int_disconnect_station(WILC_WFIDrvHandle hWFIDrv, u8 assoc_id)
 
 	strWID.u16WIDid = (u16)WID_DISCONNECT;
 	strWID.enuWIDtype = WID_CHAR;
-	strWID.ps8WidVal = (WILC_Sint8 *)&assoc_id;
+	strWID.ps8WidVal = (s8 *)&assoc_id;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 
 	return s32Error;
@@ -6151,7 +6151,7 @@ WILC_Sint32 host_int_test_get_int_wid(WILC_WFIDrvHandle hWFIDrv, u32 *pu32TestMe
 
 	strWID.u16WIDid = (u16)WID_MEMORY_ADDRESS;
 	strWID.enuWIDtype = WID_INT;
-	strWID.ps8WidVal = (WILC_Sint8 *)pu32TestMemAddr;
+	strWID.ps8WidVal = (s8 *)pu32TestMemAddr;
 	strWID.s32ValueSize = sizeof(u32);
 
 	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
@@ -6185,7 +6185,7 @@ WILC_Sint32 host_int_test_get_int_wid(WILC_WFIDrvHandle hWFIDrv, u32 *pu32TestMe
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 host_int_get_rssi(WILC_WFIDrvHandle hWFIDrv, WILC_Sint8 *ps8Rssi)
+WILC_Sint32 host_int_get_rssi(WILC_WFIDrvHandle hWFIDrv, s8 *ps8Rssi)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrHostIFmsg strHostIFmsg;
@@ -6220,7 +6220,7 @@ WILC_Sint32 host_int_get_rssi(WILC_WFIDrvHandle hWFIDrv, WILC_Sint8 *ps8Rssi)
 	return s32Error;
 }
 
-WILC_Sint32 host_int_get_link_speed(WILC_WFIDrvHandle hWFIDrv, WILC_Sint8 *ps8lnkspd)
+WILC_Sint32 host_int_get_link_speed(WILC_WFIDrvHandle hWFIDrv, s8 *ps8lnkspd)
 {
 	tstrHostIFmsg strHostIFmsg;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
@@ -6578,7 +6578,7 @@ void GetPeriodicRSSI(void *pvArg)
 
 
 void host_int_send_network_info_to_host
-	(u8 *macStartAddress, u16 u16RxFrameLen, WILC_Sint8 s8Rssi)
+	(u8 *macStartAddress, u16 u16RxFrameLen, s8 s8Rssi)
 {
 }
 /**
diff --git a/drivers/staging/wilc1000/host_interface.h b/drivers/staging/wilc1000/host_interface.h
index a75efbf..1f107d0 100644
--- a/drivers/staging/wilc1000/host_interface.h
+++ b/drivers/staging/wilc1000/host_interface.h
@@ -128,12 +128,12 @@ typedef enum {WID_CHAR  = 0,
 typedef struct {
 	u16 cfg_wid;
 	WID_TYPE_T cfg_type;
-	WILC_Sint8     *pu8Para;
+	s8     *pu8Para;
 } cfg_param_t;
 
 typedef struct _tstrStatistics {
 	u8 u8LinkSpeed;
-	WILC_Sint8 s8RSSI;
+	s8 s8RSSI;
 	u32 u32TxCount;
 	u32 u32RxCount;
 	u32 u32TxFailureCount;
@@ -237,7 +237,7 @@ typedef enum {
 
 typedef struct {
 	u8 au8bssid[6];
-	WILC_Sint8 s8rssi;
+	s8 s8rssi;
 } tstrFoundNetworkInfo;
 
 typedef enum {SCAN_EVENT_NETWORK_FOUND  = 0,
@@ -989,8 +989,8 @@ WILC_Sint32 host_int_get_host_chnl_num(WILC_WFIDrvHandle hWFIDrv, u8 *pu8ChNo);
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 host_int_get_rssi(WILC_WFIDrvHandle hWFIDrv, WILC_Sint8 *ps8Rssi);
-WILC_Sint32 host_int_get_link_speed(WILC_WFIDrvHandle hWFIDrv, WILC_Sint8 *ps8lnkspd);
+WILC_Sint32 host_int_get_rssi(WILC_WFIDrvHandle hWFIDrv, s8 *ps8Rssi);
+WILC_Sint32 host_int_get_link_speed(WILC_WFIDrvHandle hWFIDrv, s8 *ps8lnkspd);
 /**
  *  @brief              scans a set of channels
  *  @details
@@ -1074,7 +1074,7 @@ void host_int_send_join_leave_info_to_host
  *  @version		1.0
  */
 void host_int_send_network_info_to_host
-	(u8 *macStartAddress, u16 u16RxFrameLen, WILC_Sint8 s8Rssi);
+	(u8 *macStartAddress, u16 u16RxFrameLen, s8 s8Rssi);
 
 /**
  *  @brief              host interface initialization function
diff --git a/drivers/staging/wilc1000/linux_wlan.c b/drivers/staging/wilc1000/linux_wlan.c
index de576b5..6b8001d 100644
--- a/drivers/staging/wilc1000/linux_wlan.c
+++ b/drivers/staging/wilc1000/linux_wlan.c
@@ -2375,7 +2375,7 @@ int mac_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
 {
 
 	u8 *buff = NULL;
-	WILC_Sint8 rssi;
+	s8 rssi;
 	u32 size = 0, length = 0;
 	perInterface_wlan_t *nic;
 	struct WILC_WFI_priv *priv;
diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index 3af48da..7e84475 100644
--- a/drivers/staging/wilc1000/wilc_oswrapper.h
+++ b/drivers/staging/wilc1000/wilc_oswrapper.h
@@ -14,7 +14,6 @@
 #define WILC_OSW_INTERFACE_VER 2
 
 /* Integer Types */
-typedef signed char WILC_Sint8;
 typedef signed short WILC_Sint16;
 typedef signed int WILC_Sint32;
 typedef signed long long WILC_Sint64;
-- 
1.9.1

