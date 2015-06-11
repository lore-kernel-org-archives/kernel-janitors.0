From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Thu, 11 Jun 2015 05:35:55 +0000
Subject: [PATCH V3 4/9] staging: wilc1000: remove WILC_Uint32
Message-Id: <1434000960-16909-4-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u32 instead of WILC_Uint32.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V3: rebased on the top of staging-testing
V2: remove the spaces on the subject
    capitalize the name on the From and the Signed-off-by

 drivers/staging/wilc1000/coreconfigurator.c       |  74 +++---
 drivers/staging/wilc1000/coreconfigurator.h       |  16 +-
 drivers/staging/wilc1000/fifo_buffer.c            |  20 +-
 drivers/staging/wilc1000/fifo_buffer.h            |  22 +-
 drivers/staging/wilc1000/host_interface.c         | 266 +++++++++++-----------
 drivers/staging/wilc1000/host_interface.h         |  70 +++---
 drivers/staging/wilc1000/linux_mon.c              |   4 +-
 drivers/staging/wilc1000/linux_wlan.c             |  12 +-
 drivers/staging/wilc1000/wilc_memory.c            |  14 +-
 drivers/staging/wilc1000/wilc_memory.h            |  18 +-
 drivers/staging/wilc1000/wilc_msgqueue.c          |   6 +-
 drivers/staging/wilc1000/wilc_msgqueue.h          |   6 +-
 drivers/staging/wilc1000/wilc_oswrapper.h         |   1 -
 drivers/staging/wilc1000/wilc_platform.h          |   4 +-
 drivers/staging/wilc1000/wilc_sleep.c             |   4 +-
 drivers/staging/wilc1000/wilc_sleep.h             |   2 +-
 drivers/staging/wilc1000/wilc_strutils.c          |  14 +-
 drivers/staging/wilc1000/wilc_strutils.h          |  14 +-
 drivers/staging/wilc1000/wilc_timer.c             |   2 +-
 drivers/staging/wilc1000/wilc_timer.h             |   2 +-
 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c |  54 ++---
 drivers/staging/wilc1000/wilc_wfi_netdevice.h     |   6 +-
 drivers/staging/wilc1000/wilc_wlan.c              |   6 +-
 drivers/staging/wilc1000/wilc_wlan_cfg.c          |   2 +-
 drivers/staging/wilc1000/wilc_wlan_if.h           |   4 +-
 25 files changed, 321 insertions(+), 322 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index cc4455f..2bb513d 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -159,9 +159,9 @@ typedef struct {
 /* Extern Function Declarations                                              */
 /*****************************************************************************/
 extern WILC_Sint32 SendRawPacket(WILC_Sint8 *ps8Packet, WILC_Sint32 s32PacketLen);
-extern void NetworkInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length);
-extern void GnrlAsyncInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length);
-extern void host_int_ScanCompleteReceived(u8 *pu8Buffer, WILC_Uint32 u32Length);
+extern void NetworkInfoReceived(u8 *pu8Buffer, u32 u32Length);
+extern void GnrlAsyncInfoReceived(u8 *pu8Buffer, u32 u32Length);
+extern void host_int_ScanCompleteReceived(u8 *pu8Buffer, u32 u32Length);
 /*****************************************************************************/
 /* Global Variables                                                          */
 /*****************************************************************************/
@@ -359,8 +359,8 @@ INLINE u16 extract_mac_addr(WILC_Char *str, u8 *buff)
 /* integers.                                                                  */
 INLINE void create_mac_addr(u8 *str, u8 *buff)
 {
-	WILC_Uint32 i = 0;
-	WILC_Uint32 j = 0;
+	u32 i = 0;
+	u32 j = 0;
 
 	for (i = 0; i < MAC_ADDR_LEN; i++) {
 		str[j++] = get_hex_char((u8)((buff[i] >> 4) & 0x0F));
@@ -376,7 +376,7 @@ INLINE void create_mac_addr(u8 *str, u8 *buff)
 /* inet_addr is platform independent.                                       */
 /* ips=>IP Address String in dotted decimal format                          */
 /* ipn=>Pointer to IP Address in integer format                             */
-INLINE u8 conv_ip_to_int(u8 *ips, WILC_Uint32 *ipn)
+INLINE u8 conv_ip_to_int(u8 *ips, u32 *ipn)
 {
 	u8 i   = 0;
 	u8 ipb = 0;
@@ -403,7 +403,7 @@ INLINE u8 conv_ip_to_int(u8 *ips, WILC_Uint32 *ipn)
 /* decimal string format. Alternative to std library fn inet_ntoa().      */
 /* ips=>Buffer to hold IP Address String dotted decimal format (Min 17B)  */
 /* ipn=>IP Address in integer format                                      */
-INLINE u8 conv_int_to_ip(u8 *ips, WILC_Uint32 ipn)
+INLINE u8 conv_int_to_ip(u8 *ips, u32 ipn)
 {
 	u8 i   = 0;
 	u8 ipb = 0;
@@ -442,7 +442,7 @@ INLINE u8 conv_int_to_ip(u8 *ips, WILC_Uint32 ipn)
 	return i;
 }
 
-INLINE tenuWIDtype get_wid_type(WILC_Uint32 wid_num)
+INLINE tenuWIDtype get_wid_type(u32 wid_num)
 {
 	/* Check for iconfig specific WID types first */
 	if ((wid_num = WID_BSSID) ||
@@ -486,10 +486,10 @@ INLINE u16 get_beacon_period(u8 *data)
 	return bcn_per;
 }
 
-INLINE WILC_Uint32 get_beacon_timestamp_lo(u8 *data)
+INLINE u32 get_beacon_timestamp_lo(u8 *data)
 {
-	WILC_Uint32 time_stamp = 0;
-	WILC_Uint32 index    = MAC_HDR_LEN;
+	u32 time_stamp = 0;
+	u32 index    = MAC_HDR_LEN;
 
 	time_stamp |= data[index++];
 	time_stamp |= (data[index++] << 8);
@@ -812,8 +812,8 @@ WILC_Sint32 ParseNetworkInfo(u8 *pu8MsgBuffer, tstrNetworkInfo **ppstrNetworkInf
 		u8 *pu8IEs = 0;
 		u16 u16IEsLen = 0;
 		u8 u8index = 0;
-		WILC_Uint32 u32Tsf_Lo;
-		WILC_Uint32 u32Tsf_Hi;
+		u32 u32Tsf_Lo;
+		u32 u32Tsf_Hi;
 
 		pstrNetworkInfo = (tstrNetworkInfo *)WILC_MALLOC(sizeof(tstrNetworkInfo));
 		WILC_memset((void *)(pstrNetworkInfo), 0, sizeof(tstrNetworkInfo));
@@ -924,7 +924,7 @@ WILC_Sint32 DeallocateNetworkInfo(tstrNetworkInfo *pstrNetworkInfo)
  *  @date			2 Apr 2012
  *  @version		1.0
  */
-WILC_Sint32 ParseAssocRespInfo(u8 *pu8Buffer, WILC_Uint32 u32BufferLen,
+WILC_Sint32 ParseAssocRespInfo(u8 *pu8Buffer, u32 u32BufferLen,
 			       tstrConnectRespInfo **ppstrConnectRespInfo)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
@@ -1001,17 +1001,17 @@ WILC_Sint32 DeallocateAssocRespInfo(tstrConnectRespInfo *pstrConnectRespInfo)
 #ifndef CONNECT_DIRECT
 WILC_Sint32 ParseSurveyResults(u8 ppu8RcvdSiteSurveyResults[][MAX_SURVEY_RESULT_FRAG_SIZE],
 			       wid_site_survey_reslts_s **ppstrSurveyResults,
-			       WILC_Uint32 *pu32SurveyResultsCount)
+			       u32 *pu32SurveyResultsCount)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	wid_site_survey_reslts_s *pstrSurveyResults = NULL;
-	WILC_Uint32 u32SurveyResultsCount = 0;
-	WILC_Uint32 u32SurveyBytesLength = 0;
+	u32 u32SurveyResultsCount = 0;
+	u32 u32SurveyBytesLength = 0;
 	u8 *pu8BufferPtr;
-	WILC_Uint32 u32RcvdSurveyResultsNum = 2;
+	u32 u32RcvdSurveyResultsNum = 2;
 	u8 u8ReadSurveyResFragNum;
-	WILC_Uint32 i;
-	WILC_Uint32 j;
+	u32 i;
+	u32 j;
 
 	for (i = 0; i < u32RcvdSurveyResultsNum; i++) {
 		u32SurveyBytesLength = ppu8RcvdSiteSurveyResults[i][0];
@@ -1208,8 +1208,8 @@ void ProcessShortWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 void ProcessIntWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 		   tstrWID *pstrWID, WILC_Sint8 *ps8WidVal)
 {
-	WILC_Uint32 *pu32val = (WILC_Uint32 *)ps8WidVal;
-	WILC_Uint32 u32val = 0;
+	u32 *pu32val = (u32 *)ps8WidVal;
+	u32 u32val = 0;
 	WILC_Sint32 s32PktLen = *ps32PktLen;
 	if (pstrWID = NULL) {
 		PRINT_WRN(CORECONFIG_DBG, "Can't set INT val 0x%x , NULL structure\n", u32val);
@@ -1224,7 +1224,7 @@ void ProcessIntWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 		u32val = *pu32val;
 
 		/* Length */
-		pcPacket[s32PktLen++] = sizeof(WILC_Uint32);
+		pcPacket[s32PktLen++] = sizeof(u32);
 
 		/* Value */
 		pcPacket[s32PktLen++] = (u8)(u32val & 0xFF);
@@ -1266,7 +1266,7 @@ void ProcessIntWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 void ProcessIPwid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 		  tstrWID *pstrWID, u8 *pu8ip)
 {
-	WILC_Uint32 u32val = 0;
+	u32 u32val = 0;
 	WILC_Sint32 s32PktLen = *ps32PktLen;
 
 	if (pstrWID = NULL) {
@@ -1280,7 +1280,7 @@ void ProcessIPwid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 
 	if (g_oper_mode = SET_CFG) {
 		/* Length */
-		pcPacket[s32PktLen++] = sizeof(WILC_Uint32);
+		pcPacket[s32PktLen++] = sizeof(u32);
 
 		/* Convert the IP Address String to Integer */
 		conv_ip_to_int(pu8ip, &u32val);
@@ -1521,14 +1521,14 @@ WILC_Sint32 further_process_response(u8 *resp,
 				     u16 u16WIDid,
 				     u16 cfg_len,
 				     WILC_Bool process_wid_num,
-				     WILC_Uint32 cnt,
+				     u32 cnt,
 				     tstrWID *pstrWIDresult)
 {
-	WILC_Uint32 retval = 0;
-	WILC_Uint32 idx = 0;
+	u32 retval = 0;
+	u32 idx = 0;
 	u8 cfg_chr  = 0;
 	u16 cfg_sht  = 0;
-	WILC_Uint32 cfg_int  = 0;
+	u32 cfg_int  = 0;
 	u8 cfg_str[256] = {0};
 	tenuWIDtype enuWIDtype = WID_UNDEF;
 
@@ -1558,7 +1558,7 @@ WILC_Sint32 further_process_response(u8 *resp,
 
 	case WID_INT:
 	{
-		WILC_Uint32 *pu32val = (WILC_Uint32 *)(pstrWIDresult->ps8WidVal);
+		u32 *pu32val = (u32 *)(pstrWIDresult->ps8WidVal);
 		cfg_int = MAKE_WORD32(
 				MAKE_WORD16(resp[idx], resp[idx + 1]),
 				MAKE_WORD16(resp[idx + 2], resp[idx + 3])
@@ -1694,9 +1694,9 @@ WILC_Sint32 ParseResponse(u8 *resp, tstrWID *pstrWIDcfgResult)
 	u16 cfg_len  = 0;
 	tenuWIDtype enuWIDtype = WID_UNDEF;
 	WILC_Bool num_wid_processed = WILC_FALSE;
-	WILC_Uint32 cnt = 0;
-	WILC_Uint32 idx = 0;
-	WILC_Uint32 ResCnt = 0;
+	u32 cnt = 0;
+	u32 idx = 0;
+	u32 ResCnt = 0;
 	/* Check whether the received frame is a valid response */
 	if (RESP_MSG_TYPE != resp[0]) {
 		PRINT_INFO(CORECONFIG_DBG, "Received Message format incorrect.\n");
@@ -1858,10 +1858,10 @@ WILC_Sint32 CreatePacketHeader(WILC_Char *pcpacket, WILC_Sint32 *ps32PacketLengt
  */
 
 WILC_Sint32 CreateConfigPacket(WILC_Sint8 *ps8packet, WILC_Sint32 *ps32PacketLength,
-			       tstrWID *pstrWIDs, WILC_Uint32 u32WIDsCount)
+			       tstrWID *pstrWIDs, u32 u32WIDsCount)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
-	WILC_Uint32 u32idx = 0;
+	u32 u32idx = 0;
 	*ps32PacketLength = MSG_HEADER_LEN;
 	for (u32idx = 0; u32idx < u32WIDsCount; u32idx++) {
 		switch (pstrWIDs[u32idx].enuWIDtype) {
@@ -1950,7 +1950,7 @@ WILC_Sint32 ConfigWaitResponse(WILC_Char *pcRespBuffer, WILC_Sint32 s32MaxRespBu
  */
 #ifdef SIMULATION
 WILC_Sint32 SendConfigPkt(u8 u8Mode, tstrWID *pstrWIDs,
-			  WILC_Uint32 u32WIDsCount, WILC_Bool bRespRequired, WILC_Uint32 drvHandler)
+			  u32 u32WIDsCount, WILC_Bool bRespRequired, u32 drvHandler)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	WILC_Sint32 err = WILC_SUCCESS;
@@ -2129,7 +2129,7 @@ extern wilc_wlan_oup_t *gpstrWlanOps;
  *  @version	1.0
  */
 WILC_Sint32 SendConfigPkt(u8 u8Mode, tstrWID *pstrWIDs,
-			  WILC_Uint32 u32WIDsCount, WILC_Bool bRespRequired, WILC_Uint32 drvHandler)
+			  u32 u32WIDsCount, WILC_Bool bRespRequired, u32 drvHandler)
 {
 	WILC_Sint32 counter = 0, ret = 0;
 	if (gpstrWlanOps = NULL) {
diff --git a/drivers/staging/wilc1000/coreconfigurator.h b/drivers/staging/wilc1000/coreconfigurator.h
index 640dc50..c2a6d5b 100644
--- a/drivers/staging/wilc1000/coreconfigurator.h
+++ b/drivers/staging/wilc1000/coreconfigurator.h
@@ -66,7 +66,7 @@ extern u16 g_num_total_switches;
 /* Function Macros                                                           */
 /*****************************************************************************/
 #define MAKE_WORD16(lsb, msb) ((((u16)(msb) << 8) & 0xFF00) | (lsb))
-#define MAKE_WORD32(lsw, msw) ((((WILC_Uint32)(msw) << 16) & 0xFFFF0000) | (lsw))
+#define MAKE_WORD32(lsw, msw) ((((u32)(msw) << 16) & 0xFFFF0000) | (lsw))
 
 
 /*****************************************************************************/
@@ -423,7 +423,7 @@ typedef struct {
 	u8 u8Found;
 #endif
 #ifdef WILC_P2P
-	WILC_Uint32 u32Tsf; /* time-stamp [Low only 32 bit] */
+	u32 u32Tsf; /* time-stamp [Low only 32 bit] */
 #endif
 	u8 *pu8IEs;
 	u16 u16IEsLen;
@@ -476,23 +476,23 @@ extern WILC_Sint32 CoreConfiguratorInit(void);
 extern WILC_Sint32 CoreConfiguratorDeInit(void);
 
 extern WILC_Sint32 SendConfigPkt(u8 u8Mode, tstrWID *pstrWIDs,
-				 WILC_Uint32 u32WIDsCount, WILC_Bool bRespRequired, WILC_Uint32 drvHandler);
+				 u32 u32WIDsCount, WILC_Bool bRespRequired, u32 drvHandler);
 extern WILC_Sint32 ParseNetworkInfo(u8 *pu8MsgBuffer, tstrNetworkInfo **ppstrNetworkInfo);
 extern WILC_Sint32 DeallocateNetworkInfo(tstrNetworkInfo *pstrNetworkInfo);
 
-extern WILC_Sint32 ParseAssocRespInfo(u8 *pu8Buffer, WILC_Uint32 u32BufferLen,
+extern WILC_Sint32 ParseAssocRespInfo(u8 *pu8Buffer, u32 u32BufferLen,
 				      tstrConnectRespInfo **ppstrConnectRespInfo);
 extern WILC_Sint32 DeallocateAssocRespInfo(tstrConnectRespInfo *pstrConnectRespInfo);
 
 #ifndef CONNECT_DIRECT
 extern WILC_Sint32 ParseSurveyResults(u8 ppu8RcvdSiteSurveyResults[][MAX_SURVEY_RESULT_FRAG_SIZE],
-				      wid_site_survey_reslts_s **ppstrSurveyResults, WILC_Uint32 *pu32SurveyResultsCount);
+				      wid_site_survey_reslts_s **ppstrSurveyResults, u32 *pu32SurveyResultsCount);
 extern WILC_Sint32 DeallocateSurveyResults(wid_site_survey_reslts_s *pstrSurveyResults);
 #endif
 
 extern WILC_Sint32 SendRawPacket(WILC_Sint8 *pspacket, WILC_Sint32 s32PacketLen);
-extern void NetworkInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length);
-void GnrlAsyncInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length);
-void host_int_ScanCompleteReceived(u8 *pu8Buffer, WILC_Uint32 u32Length);
+extern void NetworkInfoReceived(u8 *pu8Buffer, u32 u32Length);
+void GnrlAsyncInfoReceived(u8 *pu8Buffer, u32 u32Length);
+void host_int_ScanCompleteReceived(u8 *pu8Buffer, u32 u32Length);
 
 #endif
diff --git a/drivers/staging/wilc1000/fifo_buffer.c b/drivers/staging/wilc1000/fifo_buffer.c
index f807bfb..788398c 100644
--- a/drivers/staging/wilc1000/fifo_buffer.c
+++ b/drivers/staging/wilc1000/fifo_buffer.c
@@ -5,9 +5,9 @@
 
 
 
-WILC_Uint32 FIFO_InitBuffer(tHANDLE *hBuffer, WILC_Uint32 u32BufferLength)
+u32 FIFO_InitBuffer(tHANDLE *hBuffer, u32 u32BufferLength)
 {
-	WILC_Uint32 u32Error = 0;
+	u32 u32Error = 0;
 	tstrFifoHandler *pstrFifoHandler = WILC_MALLOC (sizeof (tstrFifoHandler));
 	if (pstrFifoHandler) {
 		WILC_memset (pstrFifoHandler, 0, sizeof (tstrFifoHandler));
@@ -27,9 +27,9 @@ WILC_Uint32 FIFO_InitBuffer(tHANDLE *hBuffer, WILC_Uint32 u32BufferLength)
 	}
 	return u32Error;
 }
-WILC_Uint32 FIFO_DeInit(tHANDLE hFifo)
+u32 FIFO_DeInit(tHANDLE hFifo)
 {
-	WILC_Uint32 u32Error = 0;
+	u32 u32Error = 0;
 	tstrFifoHandler *pstrFifoHandler = (tstrFifoHandler *) hFifo;
 	if (pstrFifoHandler) {
 		if (pstrFifoHandler->pu8Buffer)	{
@@ -45,9 +45,9 @@ WILC_Uint32 FIFO_DeInit(tHANDLE hFifo)
 	return u32Error;
 }
 
-WILC_Uint32 FIFO_ReadBytes(tHANDLE hFifo, u8 *pu8Buffer, WILC_Uint32 u32BytesToRead, WILC_Uint32 *pu32BytesRead)
+u32 FIFO_ReadBytes(tHANDLE hFifo, u8 *pu8Buffer, u32 u32BytesToRead, u32 *pu32BytesRead)
 {
-	WILC_Uint32 u32Error = 0;
+	u32 u32Error = 0;
 	tstrFifoHandler *pstrFifoHandler = (tstrFifoHandler *) hFifo;
 	if (pstrFifoHandler && pu32BytesRead) {
 		if (pstrFifoHandler->u32TotalBytes) {
@@ -66,7 +66,7 @@ WILC_Uint32 FIFO_ReadBytes(tHANDLE hFifo, u8 *pu8Buffer, WILC_Uint32 u32BytesToR
 				pstrFifoHandler->u32TotalBytes -= u32BytesToRead;
 
 			} else {
-				WILC_Uint32 u32FirstPart +				u32 u32FirstPart  					pstrFifoHandler->u32BufferLength - pstrFifoHandler->u32ReadOffset;
 				WILC_memcpy(pu8Buffer, pstrFifoHandler->pu8Buffer + pstrFifoHandler->u32ReadOffset,
 					    u32FirstPart);
@@ -86,9 +86,9 @@ WILC_Uint32 FIFO_ReadBytes(tHANDLE hFifo, u8 *pu8Buffer, WILC_Uint32 u32BytesToR
 	return u32Error;
 }
 
-WILC_Uint32 FIFO_WriteBytes(tHANDLE hFifo, u8 *pu8Buffer, WILC_Uint32 u32BytesToWrite, WILC_Bool bForceOverWrite)
+u32 FIFO_WriteBytes(tHANDLE hFifo, u8 *pu8Buffer, u32 u32BytesToWrite, WILC_Bool bForceOverWrite)
 {
-	WILC_Uint32 u32Error = 0;
+	u32 u32Error = 0;
 	tstrFifoHandler *pstrFifoHandler = (tstrFifoHandler *) hFifo;
 	if (pstrFifoHandler) {
 		if (u32BytesToWrite < pstrFifoHandler->u32BufferLength)	{
@@ -103,7 +103,7 @@ WILC_Uint32 FIFO_WriteBytes(tHANDLE hFifo, u8 *pu8Buffer, WILC_Uint32 u32BytesTo
 					pstrFifoHandler->u32TotalBytes  += u32BytesToWrite;
 
 				} else {
-					WILC_Uint32 u32FirstPart +					u32 u32FirstPart  						pstrFifoHandler->u32BufferLength - pstrFifoHandler->u32WriteOffset;
 					WILC_memcpy(pstrFifoHandler->pu8Buffer + pstrFifoHandler->u32WriteOffset, pu8Buffer,
 						    u32FirstPart);
diff --git a/drivers/staging/wilc1000/fifo_buffer.h b/drivers/staging/wilc1000/fifo_buffer.h
index 4d12050..912a333 100644
--- a/drivers/staging/wilc1000/fifo_buffer.h
+++ b/drivers/staging/wilc1000/fifo_buffer.h
@@ -6,18 +6,18 @@
 
 typedef struct {
 	u8		*pu8Buffer;
-	WILC_Uint32 u32BufferLength;
-	WILC_Uint32 u32WriteOffset;
-	WILC_Uint32 u32ReadOffset;
-	WILC_Uint32 u32TotalBytes;
+	u32 u32BufferLength;
+	u32 u32WriteOffset;
+	u32 u32ReadOffset;
+	u32 u32TotalBytes;
 	struct semaphore SemBuffer;
 } tstrFifoHandler;
 
 
-extern WILC_Uint32 FIFO_InitBuffer(tHANDLE *hBuffer,
-								   WILC_Uint32 u32BufferLength);
-extern WILC_Uint32 FIFO_DeInit(tHANDLE hFifo);
-extern WILC_Uint32 FIFO_ReadBytes(tHANDLE hFifo, u8 *pu8Buffer,
-				WILC_Uint32 u32BytesToRead, WILC_Uint32 *pu32BytesRead);
-extern WILC_Uint32 FIFO_WriteBytes(tHANDLE hFifo, u8 *pu8Buffer,
-				WILC_Uint32 u32BytesToWrite, WILC_Bool bForceOverWrite);
+extern u32 FIFO_InitBuffer(tHANDLE *hBuffer,
+								   u32 u32BufferLength);
+extern u32 FIFO_DeInit(tHANDLE hFifo);
+extern u32 FIFO_ReadBytes(tHANDLE hFifo, u8 *pu8Buffer,
+				u32 u32BytesToRead, u32 *pu32BytesRead);
+extern u32 FIFO_WriteBytes(tHANDLE hFifo, u8 *pu8Buffer,
+				u32 u32BytesToWrite, WILC_Bool bForceOverWrite);
diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 4b6265c..75effdb 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -220,7 +220,7 @@ typedef struct _tstrHostIFconnectAttr {
  */
 typedef struct _tstrRcvdGnrlAsyncInfo {
 	u8 *pu8Buffer;
-	WILC_Uint32 u32Length;
+	u32 u32Length;
 } tstrRcvdGnrlAsyncInfo;
 
 /*!
@@ -265,7 +265,7 @@ typedef struct _tstrHostIFGetChan {
 /*typedef struct _tstrScanComplete
  * {
  *      u8* pu8Buffer;
- *      WILC_Uint32 u32Length;
+ *      u32 u32Length;
  * } tstrScanComplete;*/
 
 /*!
@@ -279,13 +279,13 @@ typedef struct _tstrHostIFGetChan {
  *  @version		1.0
  */
 typedef struct _tstrHostIFSetBeacon {
-	WILC_Uint32 u32Interval;                        /*!< Beacon Interval. Period between two successive beacons on air  */
-	WILC_Uint32 u32DTIMPeriod;              /*!< DTIM Period. Indicates how many Beacon frames
+	u32 u32Interval;                        /*!< Beacon Interval. Period between two successive beacons on air  */
+	u32 u32DTIMPeriod;              /*!< DTIM Period. Indicates how many Beacon frames
 											*                              (including the current frame) appear before the next DTIM		*/
-	WILC_Uint32 u32HeadLen;                         /*!< Length of the head buffer in bytes		*/
+	u32 u32HeadLen;                         /*!< Length of the head buffer in bytes		*/
 	u8 *pu8Head;                    /*!< Pointer to the beacon's head buffer. Beacon's head	is the part
 											*              from the beacon's start till the TIM element, NOT including the TIM		*/
-	WILC_Uint32 u32TailLen;                         /*!< Length of the tail buffer in bytes	*/
+	u32 u32TailLen;                         /*!< Length of the tail buffer in bytes	*/
 	u8 *pu8Tail;                    /*!< Pointer to the beacon's tail buffer. Beacon's tail	starts just
 											*                              after the TIM inormation element	*/
 } tstrHostIFSetBeacon;
@@ -319,7 +319,7 @@ typedef struct _tstrHostIFDelBeacon {
 
 typedef struct {
 	WILC_Bool bIsEnabled;
-	WILC_Uint32 u32count;
+	u32 u32count;
 } tstrHostIFSetMulti;
 
 /*!
@@ -380,7 +380,7 @@ typedef struct _tstrTimerCb {
 typedef struct {
 
 	WILC_Bool bIsEnabled;
-	WILC_Uint32 u32Timeout;
+	u32 u32Timeout;
 } tstrHostIfPowerMgmtParam;
 
 /*!
@@ -504,7 +504,7 @@ typedef struct _tstrJoinBssParam {
 	u8 rsn_cap[2];
 	struct _tstrJoinParam *nextJoinBss;
 	#ifdef WILC_P2P
-	WILC_Uint32 tsf;
+	u32 tsf;
 	u8 u8NoaEnbaled;
 	u8 u8OppEnable;
 	u8 u8CtWindow;
@@ -570,11 +570,11 @@ static u8 gu8Chnl;
 static u8 gs8SetIP[2][4];
 static u8 gs8GetIP[2][4];
 #ifdef WILC_AP_EXTERNAL_MLME
-static WILC_Uint32 gu32InactiveTime;
+static u32 gu32InactiveTime;
 static u8 gu8DelBcn;
 #endif
 #ifndef SIMULATION
-static WILC_Uint32 gu32WidConnRstHack;
+static u32 gu32WidConnRstHack;
 #endif
 
 /*BugID_5137*/
@@ -582,9 +582,9 @@ u8 *gu8FlushedJoinReq;
 u8 *gu8FlushedInfoElemAsoc;
 u8 gu8Flushed11iMode;
 u8 gu8FlushedAuthType;
-WILC_Uint32 gu32FlushedJoinReqSize;
-WILC_Uint32 gu32FlushedInfoElemAsocSize;
-WILC_Uint32 gu8FlushedJoinReqDrvHandler;
+u32 gu32FlushedJoinReqSize;
+u32 gu32FlushedInfoElemAsocSize;
+u32 gu8FlushedJoinReqDrvHandler;
 #define REAL_JOIN_REQ 0
 #define FLUSHED_JOIN_REQ 1
 #define FLUSHED_BYTE_POS 79     /* Position the byte indicating flushing in the flushed request */
@@ -595,7 +595,7 @@ WILC_Uint32 gu8FlushedJoinReqDrvHandler;
 static void *host_int_ParseJoinBssParam(tstrNetworkInfo *ptstrNetworkInfo);
 #endif /*WILC_PARSE_SCAN_IN_HOST*/
 
-extern void chip_sleep_manually(WILC_Uint32 u32SleepTime);
+extern void chip_sleep_manually(u32 u32SleepTime);
 extern int linux_wlan_get_num_conn_ifcs(void);
 
 /**
@@ -622,7 +622,7 @@ static WILC_Sint32 Handle_SetChannel(void *drvHandler, tstrHostIFSetChan *pstrHo
 
 	PRINT_D(HOSTINF_DBG, "Setting channel\n");
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to set channel\n");
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_STATE);
@@ -655,14 +655,14 @@ static WILC_Sint32 Handle_SetWfiDrvHandler(tstrHostIfSetDrvHandler *pstrHostIfSe
 	strWID.u16WIDid = (u16)WID_SET_DRV_HANDLER;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)&(pstrHostIfSetDrvHandler->u32Address);
-	strWID.s32ValueSize = sizeof(WILC_Uint32);
+	strWID.s32ValueSize = sizeof(u32);
 
 	/*Sending Cfg*/
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 
-	if ((pstrHostIfSetDrvHandler->u32Address) = (WILC_Uint32)NULL) {
+	if ((pstrHostIfSetDrvHandler->u32Address) = (u32)NULL) {
 		up(&hSemDeinitDrvHandle);
 	}
 
@@ -700,15 +700,15 @@ static WILC_Sint32 Handle_SetOperationMode(void *drvHandler, tstrHostIfSetOperat
 	strWID.u16WIDid = (u16)WID_SET_OPERATION_MODE;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)&(pstrHostIfSetOperationMode->u32Mode);
-	strWID.s32ValueSize = sizeof(WILC_Uint32);
+	strWID.s32ValueSize = sizeof(u32);
 
 	/*Sending Cfg*/
 	PRINT_INFO(HOSTINF_DBG, "(size_t)pstrWFIDrv= %p \n", pstrWFIDrv);
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 
-	if ((pstrHostIfSetOperationMode->u32Mode) = (WILC_Uint32)NULL) {
+	if ((pstrHostIfSetOperationMode->u32Mode) = (u32)NULL) {
 		up(&hSemDeinitDrvHandle);
 	}
 
@@ -755,7 +755,7 @@ WILC_Sint32 Handle_set_IPAddress(void *drvHandler, u8 *pu8IPAddr, u8 idx)
 	strWID.ps8WidVal = (u8 *)pu8IPAddr;
 	strWID.s32ValueSize = IP_ALEN;
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 
 
@@ -799,7 +799,7 @@ WILC_Sint32 Handle_get_IPAddress(void *drvHandler, u8 *pu8IPAddr, u8 idx)
 	strWID.ps8WidVal = (u8 *)WILC_MALLOC(IP_ALEN);
 	strWID.s32ValueSize = IP_ALEN;
 
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 	PRINT_INFO(HOSTINF_DBG, "%d.%d.%d.%d\n", (u8)(strWID.ps8WidVal[0]), (u8)(strWID.ps8WidVal[1]), (u8)(strWID.ps8WidVal[2]), (u8)(strWID.ps8WidVal[3]));
 
@@ -859,7 +859,7 @@ static WILC_Sint32 Handle_SetMacAddress(void *drvHandler, tstrHostIfSetMacAddres
 	strWID.s32ValueSize = ETH_ALEN;
 	PRINT_D(GENERIC_DBG, "mac addr = :%x:%x:%x:%x:%x:%x\n", strWID.ps8WidVal[0], strWID.ps8WidVal[1], strWID.ps8WidVal[2], strWID.ps8WidVal[3], strWID.ps8WidVal[4], strWID.ps8WidVal[5]);
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to set mac address\n");
 		WILC_ERRORREPORT(s32Error, WILC_FAIL);
@@ -897,7 +897,7 @@ static WILC_Sint32 Handle_GetMacAddress(void *drvHandler, tstrHostIfGetMacAddres
 	strWID.s32ValueSize = ETH_ALEN;
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)drvHandler);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_FALSE, (u32)drvHandler);
 	if (s32Error) {
 		PRINT_ER("Failed to get mac address\n");
 		WILC_ERRORREPORT(s32Error, WILC_FAIL);
@@ -1205,7 +1205,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 		}
 		u8WidCnt++;
 	}
-	s32Error = SendConfigPkt(SET_CFG, strWIDList, u8WidCnt, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, strWIDList, u8WidCnt, WILC_FALSE, (u32)pstrWFIDrv);
 
 	if (s32Error) {
 		PRINT_ER("Error in setting CFG params\n");
@@ -1249,8 +1249,8 @@ static WILC_Sint32 Handle_Scan(void *drvHandler, tstrHostIFscanAttr *pstrHostIFs
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWIDList[5];
-	WILC_Uint32 u32WidsCount = 0;
-	WILC_Uint32 i;
+	u32 u32WidsCount = 0;
+	u32 i;
 	u8 *pu8Buffer;
 	u8 valuesize = 0;
 	u8 *pu8HdnNtwrksWidVal = NULL;
@@ -1372,7 +1372,7 @@ static WILC_Sint32 Handle_Scan(void *drvHandler, tstrHostIFscanAttr *pstrHostIFs
 		gbScanWhileConnected = WILC_FALSE;
 	}
 
-	s32Error = SendConfigPkt(SET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (u32)pstrWFIDrv);
 
 	if (s32Error) {
 		PRINT_ER("Failed to send scan paramters config packet\n");
@@ -1450,7 +1450,7 @@ static WILC_Sint32 Handle_ScanDone(void *drvHandler, tenuScanEvent enuEvent)
 		strWID.s32ValueSize = sizeof(WILC_Char);
 
 		/*Sending Cfg*/
-		s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+		s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 		if (s32Error != WILC_SUCCESS) {
 			PRINT_ER("Failed to set abort running scan\n");
 			WILC_ERRORREPORT(s32Error, WILC_FAIL);
@@ -1491,11 +1491,11 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *) drvHandler;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWIDList[8];
-	WILC_Uint32 u32WidsCount = 0, dummyval = 0;
+	u32 u32WidsCount = 0, dummyval = 0;
 	/* char passphrase[] = "12345678"; */
 	#ifndef CONNECT_DIRECT
 	WILC_Sint32 s32Err = WILC_SUCCESS;
-	WILC_Uint32 i;
+	u32 i;
 	u8 u8bssDscListIndex;
 	wid_site_survey_reslts_s *pstrSurveyResults = NULL;
 	#else
@@ -1649,7 +1649,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 		/* ////////////////////// */
 		#endif
 
-		s32Error = SendConfigPkt(SET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+		s32Error = SendConfigPkt(SET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (u32)pstrWFIDrv);
 		if (s32Error) {
 			PRINT_ER("Handle_Connect()] failed to send config packet\n");
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_STATE);
@@ -1722,19 +1722,19 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 
 	strWIDList[u32WidsCount].u16WIDid = WID_SUCCESS_FRAME_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
-	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Uint32);
+	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(dummyval));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_RECEIVED_FRAGMENT_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
-	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Uint32);
+	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(dummyval));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_FAILED_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
-	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Uint32);
+	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(dummyval));
 	u32WidsCount++;
 
@@ -1978,7 +1978,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 	/*BugID_5137*/
 	if (WILC_memcmp("DIRECT-", pstrHostIFconnectAttr->pu8ssid, 7)) {
 		memcpy(gu8FlushedJoinReq, pu8CurrByte, gu32FlushedJoinReqSize);
-		gu8FlushedJoinReqDrvHandler = (WILC_Uint32)pstrWFIDrv;
+		gu8FlushedJoinReqDrvHandler = (u32)pstrWFIDrv;
 	}
 
 	PRINT_D(GENERIC_DBG, "send HOST_IF_WAITING_CONN_RESP\n");
@@ -1990,7 +1990,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 		PRINT_D(GENERIC_DBG, "save bssid = %x:%x:%x:%x:%x:%x\n", (u8ConnectedSSID[0]), (u8ConnectedSSID[1]), (u8ConnectedSSID[2]), (u8ConnectedSSID[3]), (u8ConnectedSSID[4]), (u8ConnectedSSID[5]));
 	}
 
-	s32Error = SendConfigPkt(SET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Handle_Connect()] failed to send config packet\n");
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_STATE);
@@ -2081,7 +2081,7 @@ static WILC_Sint32 Handle_FlushConnect(void *drvHandler)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWIDList[5];
-	WILC_Uint32 u32WidsCount = 0;
+	u32 u32WidsCount = 0;
 	u8 *pu8CurrByte = NULL;
 
 
@@ -2206,7 +2206,7 @@ static WILC_Sint32 Handle_ConnectTimeout(void *drvHandler)
 
 	PRINT_D(HOSTINF_DBG, "Sending disconnect request\n");
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to send dissconect config packet\n");
 	}
@@ -2232,11 +2232,11 @@ static WILC_Sint32 Handle_ConnectTimeout(void *drvHandler)
 	WILC_memset(u8ConnectedSSID, 0, ETH_ALEN);
 	/*BugID_5213*/
 	/*Freeing flushed join request params on connect timeout*/
-	if (gu8FlushedJoinReq != NULL && gu8FlushedJoinReqDrvHandler = (WILC_Uint32)drvHandler) {
+	if (gu8FlushedJoinReq != NULL && gu8FlushedJoinReqDrvHandler = (u32)drvHandler) {
 		WILC_FREE(gu8FlushedJoinReq);
 		gu8FlushedJoinReq = NULL;
 	}
-	if (gu8FlushedInfoElemAsoc != NULL && gu8FlushedJoinReqDrvHandler = (WILC_Uint32)drvHandler) {
+	if (gu8FlushedInfoElemAsoc != NULL && gu8FlushedJoinReqDrvHandler = (u32)drvHandler) {
 		WILC_FREE(gu8FlushedInfoElemAsoc);
 		gu8FlushedInfoElemAsoc = NULL;
 	}
@@ -2255,7 +2255,7 @@ static WILC_Sint32 Handle_ConnectTimeout(void *drvHandler)
  */
 static WILC_Sint32 Handle_RcvdNtwrkInfo(void *drvHandler, tstrRcvdNetworkInfo *pstrRcvdNetworkInfo)
 {
-	WILC_Uint32 i;
+	u32 i;
 	WILC_Bool bNewNtwrkFound;
 
 
@@ -2433,7 +2433,7 @@ static WILC_Sint32 Handle_RcvdGnrlAsyncInfo(void *drvHandler, tstrRcvdGnrlAsyncI
 		PRINT_INFO(HOSTINF_DBG, "Recieved MAC status = %d with Reason = %d , Info = %d\n", u8MacStatus, u8MacStatusReasonCode, u8MacStatusAdditionalInfo);
 		if (pstrWFIDrv->enuHostIFstate = HOST_IF_WAITING_CONN_RESP) {
 			/* our station had sent Association Request frame, so here it will get the Association Response frame then parse it */
-			WILC_Uint32 u32RcvdAssocRespInfoLen;
+			u32 u32RcvdAssocRespInfoLen;
 			tstrConnectRespInfo *pstrConnectRespInfo = NULL;
 
 			PRINT_D(HOSTINF_DBG, "Recieved MAC status = %d with Reason = %d , Code = %d\n", u8MacStatus, u8MacStatusReasonCode, u8MacStatusAdditionalInfo);
@@ -2657,11 +2657,11 @@ static WILC_Sint32 Handle_RcvdGnrlAsyncInfo(void *drvHandler, tstrRcvdGnrlAsyncI
 			/*BugID_5213*/
 			/*Freeing flushed join request params on receiving*/
 			/*MAC_DISCONNECTED while connected*/
-			if (gu8FlushedJoinReq != NULL && gu8FlushedJoinReqDrvHandler = (WILC_Uint32)drvHandler) {
+			if (gu8FlushedJoinReq != NULL && gu8FlushedJoinReqDrvHandler = (u32)drvHandler) {
 				WILC_FREE(gu8FlushedJoinReq);
 				gu8FlushedJoinReq = NULL;
 			}
-			if (gu8FlushedInfoElemAsoc != NULL && gu8FlushedJoinReqDrvHandler = (WILC_Uint32)drvHandler) {
+			if (gu8FlushedInfoElemAsoc != NULL && gu8FlushedJoinReqDrvHandler = (u32)drvHandler) {
 				WILC_FREE(gu8FlushedInfoElemAsoc);
 				gu8FlushedInfoElemAsoc = NULL;
 			}
@@ -2767,7 +2767,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWIDList[3].ps8WidVal = (WILC_Sint8 *)pu8keybuf;
 
 
-			s32Error = SendConfigPkt(SET_CFG, strWIDList, 4, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, strWIDList, 4, WILC_TRUE, (u32)pstrWFIDrv);
 			WILC_FREE(pu8keybuf);
 
 
@@ -2795,7 +2795,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWID.s32ValueSize = pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8WepKeylen + 2;
 
-			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 			WILC_FREE(pu8keybuf);
 		} else if (pstrHostIFkeyAttr->u8KeyAction & REMOVEKEY)	  {
 
@@ -2807,7 +2807,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWID.ps8WidVal = s8idxarray;
 			strWID.s32ValueSize = 1;
 
-			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 		} else {
 			strWID.u16WIDid	= (u16)WID_KEY_ID;
 			strWID.enuWIDtype	= WID_CHAR;
@@ -2816,7 +2816,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 
 			PRINT_D(HOSTINF_DBG, "Setting default key index\n");
 
-			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 		}
 		up(&(pstrWFIDrv->hSemTestKeyBlock));
 		break;
@@ -2862,7 +2862,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWIDList[1].ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWIDList[1].s32ValueSize = RX_MIC_KEY_MSG_LEN;
 
-			s32Error = SendConfigPkt(SET_CFG, strWIDList, 2, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, strWIDList, 2, WILC_TRUE, (u32)pstrWFIDrv);
 
 			WILC_FREE(pu8keybuf);
 
@@ -2909,7 +2909,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWID.s32ValueSize = RX_MIC_KEY_MSG_LEN;
 
-			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 			WILC_FREE(pu8keybuf);
 
@@ -2966,7 +2966,7 @@ _WPARxGtk_end_case_:
 			strWIDList[1].ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWIDList[1].s32ValueSize = PTK_KEY_MSG_LEN + 1;
 
-			s32Error = SendConfigPkt(SET_CFG, strWIDList, 2, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, strWIDList, 2, WILC_TRUE, (u32)pstrWFIDrv);
 			WILC_FREE(pu8keybuf);
 
 			/* ////////////////////////// */
@@ -3007,7 +3007,7 @@ _WPARxGtk_end_case_:
 			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWID.s32ValueSize = PTK_KEY_MSG_LEN;
 
-			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 			WILC_FREE(pu8keybuf);
 
 			/* ////////////////////////// */
@@ -3046,7 +3046,7 @@ _WPAPtk_end_case_:
 		strWID.ps8WidVal = (WILC_Sint8 *)pu8keybuf;
 		strWID.s32ValueSize = (pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFpmkidAttr.numpmkid * PMKSA_KEY_LEN) + 1;
 
-		s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+		s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 		WILC_FREE(pu8keybuf);
 		break;
@@ -3095,7 +3095,7 @@ static void Handle_Disconnect(void *drvHandler)
 
 	WILC_memset(u8ConnectedSSID, 0, ETH_ALEN);
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)pstrWFIDrv);
 
 	if (s32Error) {
 		PRINT_ER("Failed to send dissconect config packet\n");
@@ -3159,11 +3159,11 @@ static void Handle_Disconnect(void *drvHandler)
 
 
 		/*BugID_5137*/
-		if (gu8FlushedJoinReq != NULL && gu8FlushedJoinReqDrvHandler = (WILC_Uint32)drvHandler) {
+		if (gu8FlushedJoinReq != NULL && gu8FlushedJoinReqDrvHandler = (u32)drvHandler) {
 			WILC_FREE(gu8FlushedJoinReq);
 			gu8FlushedJoinReq = NULL;
 		}
-		if (gu8FlushedInfoElemAsoc != NULL && gu8FlushedJoinReqDrvHandler = (WILC_Uint32)drvHandler) {
+		if (gu8FlushedInfoElemAsoc != NULL && gu8FlushedJoinReqDrvHandler = (u32)drvHandler) {
 			WILC_FREE(gu8FlushedInfoElemAsoc);
 			gu8FlushedInfoElemAsoc = NULL;
 		}
@@ -3208,7 +3208,7 @@ static WILC_Sint32 Switch_Log_Terminal(void *drvHandler)
 	strWID.ps8WidVal = &dummy;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 
 	if (s32Error) {
@@ -3252,7 +3252,7 @@ static WILC_Sint32 Handle_GetChnl(void *drvHandler)
 
 	PRINT_D(HOSTINF_DBG, "Getting channel value\n");
 
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	/*get the value by searching the local copy*/
 	if (s32Error) {
 		PRINT_ER("Failed to get channel number\n");
@@ -3296,7 +3296,7 @@ static void Handle_GetRssi(void *drvHandler)
 	/*Sending Cfg*/
 	PRINT_D(HOSTINF_DBG, "Getting RSSI value\n");
 
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to get RSSI value\n");
 		WILC_ERRORREPORT(s32Error, WILC_FAIL);
@@ -3327,7 +3327,7 @@ static void Handle_GetLinkspeed(void *drvHandler)
 	/*Sending Cfg*/
 	PRINT_D(HOSTINF_DBG, "Getting LINKSPEED value\n");
 
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to get LINKSPEED value\n");
 		WILC_ERRORREPORT(s32Error, WILC_FAIL);
@@ -3361,23 +3361,23 @@ WILC_Sint32 Handle_GetStatistics(void *drvHandler, tstrStatistics *pstrStatistic
 
 	strWIDList[u32WidsCount].u16WIDid = WID_SUCCESS_FRAME_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
-	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Uint32);
+	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->u32TxCount));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_RECEIVED_FRAGMENT_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
-	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Uint32);
+	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->u32RxCount));
 	u32WidsCount++;
 
 	strWIDList[u32WidsCount].u16WIDid = WID_FAILED_COUNT;
 	strWIDList[u32WidsCount].enuWIDtype = WID_INT;
-	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Uint32);
+	strWIDList[u32WidsCount].s32ValueSize = sizeof(u32);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrStatistics->u32TxFailureCount));
 	u32WidsCount++;
 
-	s32Error = SendConfigPkt(GET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (WILC_Uint32)drvHandler);
+	s32Error = SendConfigPkt(GET_CFG, strWIDList, u32WidsCount, WILC_FALSE, (u32)drvHandler);
 
 	if (s32Error) {
 		PRINT_ER("Failed to send scan paramters config packet\n");
@@ -3425,7 +3425,7 @@ static WILC_Sint32 Handle_Get_InActiveTime(void *drvHandler, tstrHostIfStaInacti
 	PRINT_D(CFG80211_DBG, "SETING STA inactive time\n");
 
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	/*get the value by searching the local copy*/
 	if (s32Error) {
 		PRINT_ER("Failed to SET incative time\n");
@@ -3436,10 +3436,10 @@ static WILC_Sint32 Handle_Get_InActiveTime(void *drvHandler, tstrHostIfStaInacti
 	strWID.u16WIDid = (u16)WID_GET_INACTIVE_TIME;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)&gu32InactiveTime;
-	strWID.s32ValueSize = sizeof(WILC_Uint32);
+	strWID.s32ValueSize = sizeof(u32);
 
 
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	/*get the value by searching the local copy*/
 	if (s32Error) {
 		PRINT_ER("Failed to get incative time\n");
@@ -3520,7 +3520,7 @@ static void Handle_AddBeacon(void *drvHandler, tstrHostIFSetBeacon *pstrSetBeaco
 
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to send add beacon config packet\n");
 		WILC_ERRORREPORT(s32Error, WILC_FAIL);
@@ -3565,7 +3565,7 @@ static void Handle_DelBeacon(void *drvHandler, tstrHostIFDelBeacon *pstrDelBeaco
 	/* TODO: build del beacon message*/
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)pstrWFIDrv);
 	if (s32Error) {
 
 		PRINT_ER("Failed to send delete beacon config packet\n");
@@ -3587,7 +3587,7 @@ static void Handle_DelBeacon(void *drvHandler, tstrHostIFDelBeacon *pstrDelBeaco
  *  @date
  *  @version	1.0
  */
-static WILC_Uint32 WILC_HostIf_PackStaParam(u8 *pu8Buffer, tstrWILC_AddStaParam *pstrStationParam)
+static u32 WILC_HostIf_PackStaParam(u8 *pu8Buffer, tstrWILC_AddStaParam *pstrStationParam)
 {
 	u8 *pu8CurrByte;
 
@@ -3662,7 +3662,7 @@ static void Handle_AddStation(void *drvHandler, tstrWILC_AddStaParam *pstrStatio
 	pu8CurrByte += WILC_HostIf_PackStaParam(pu8CurrByte, pstrStationParam);
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)pstrWFIDrv);
 	if (s32Error != WILC_SUCCESS) {
 
 		PRINT_ER("Failed to send add station config packet\n");
@@ -3718,7 +3718,7 @@ static void Handle_DelAllSta(void *drvHandler, tstrHostIFDelAllSta *pstrDelAllSt
 	}
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 
 		PRINT_ER("Failed to send add station config packe\n");
@@ -3766,7 +3766,7 @@ static void Handle_DelStation(void *drvHandler, tstrHostIFDelSta *pstrDelStaPara
 	WILC_memcpy(pu8CurrByte, pstrDelStaParam->au8MacAddr, ETH_ALEN);
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)pstrWFIDrv);
 	if (s32Error) {
 
 		PRINT_ER("Failed to send add station config packe\n");
@@ -3810,7 +3810,7 @@ static void Handle_EditStation(void *drvHandler, tstrWILC_AddStaParam *pstrStati
 	pu8CurrByte += WILC_HostIf_PackStaParam(pu8CurrByte, pstrStationParam);
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)pstrWFIDrv);
 	if (s32Error) {
 
 		PRINT_ER("Failed to send edit station config packet\n");
@@ -3887,7 +3887,7 @@ static int Handle_RemainOnChan(void *drvHandler, tstrHostIfRemainOnChan *pstrHos
 	strWID.ps8WidVal[1] = (WILC_Sint8)pstrHostIfRemainOnChan->u16Channel;
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error != WILC_SUCCESS) {
 		PRINT_ER("Failed to set remain on channel\n");
 	}
@@ -3945,7 +3945,7 @@ static int Handle_RegisterFrame(void *drvHandler, tstrHostIfRegisterFrame *pstrH
 
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to frame register config packet\n");
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_STATE);
@@ -3970,7 +3970,7 @@ static int Handle_RegisterFrame(void *drvHandler, tstrHostIfRegisterFrame *pstrH
  *  @version		1.0
  */
 #define FALSE_FRMWR_CHANNEL 100
-static WILC_Uint32 Handle_ListenStateExpired(void *drvHandler, tstrHostIfRemainOnChan *pstrHostIfRemainOnChan)
+static u32 Handle_ListenStateExpired(void *drvHandler, tstrHostIfRemainOnChan *pstrHostIfRemainOnChan)
 {
 	u8 u8remain_on_chan_flag;
 	tstrWID strWID;
@@ -3997,7 +3997,7 @@ static WILC_Uint32 Handle_ListenStateExpired(void *drvHandler, tstrHostIfRemainO
 		strWID.ps8WidVal[1] = FALSE_FRMWR_CHANNEL;
 
 		/*Sending Cfg*/
-		s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+		s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 		if (s32Error != WILC_SUCCESS) {
 			PRINT_ER("Failed to set remain on channel\n");
 			goto _done_;
@@ -4083,7 +4083,7 @@ static void Handle_PowerManagement(void *drvHandler, tstrHostIfPowerMgmtParam *s
 	PRINT_D(HOSTINF_DBG, "Handling Power Management\n");
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to send power management config packet\n");
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_STATE);
@@ -4135,7 +4135,7 @@ static void Handle_SetMulticastFilter(void *drvHandler, tstrHostIFSetMulti *strH
 		memcpy(pu8CurrByte, gau8MulticastMacAddrList, ((strHostIfSetMulti->u32count) * ETH_ALEN));
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (WILC_Uint32)drvHandler);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_FALSE, (u32)drvHandler);
 	if (s32Error) {
 		PRINT_ER("Failed to send setup multicast config packet\n");
 		WILC_ERRORREPORT(s32Error, WILC_FAIL);
@@ -4203,7 +4203,7 @@ static WILC_Sint32 Handle_AddBASession(void *drvHandler, tstrHostIfBASessionInfo
 	/* Group Buffer Timeout */
 	*ptr++ = 0;
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error)
 		PRINT_D(HOSTINF_DBG, "Couldn't open BA Session\n");
 
@@ -4227,7 +4227,7 @@ static WILC_Sint32 Handle_AddBASession(void *drvHandler, tstrHostIfBASessionInfo
 	*ptr++ = ((strHostIfBASessionInfo->u16SessionTimeout >> 16) & 0xFF);
 	/*Ack-Policy */
 	*ptr++ = 3;
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 	if (strWID.ps8WidVal != NULL)
 		WILC_FREE(strWID.ps8WidVal);
@@ -4277,7 +4277,7 @@ static WILC_Sint32 Handle_DelBASession(void *drvHandler, tstrHostIfBASessionInfo
 	/* Delba Reason */
 	*ptr++ = 32; /* Unspecific QOS reason */
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error)
 		PRINT_D(HOSTINF_DBG, "Couldn't delete BA Session\n");
 
@@ -4295,7 +4295,7 @@ static WILC_Sint32 Handle_DelBASession(void *drvHandler, tstrHostIfBASessionInfo
 	/* TID*/
 	*ptr++ = strHostIfBASessionInfo->u8Ted;
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 
 	if (strWID.ps8WidVal != NULL)
 		WILC_FREE(strWID.ps8WidVal);
@@ -4346,7 +4346,7 @@ static WILC_Sint32 Handle_DelAllRxBASessions(void *drvHandler, tstrHostIfBASessi
 	/* Delba Reason */
 	*ptr++ = 32; /* Unspecific QOS reason */
 
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error)
 		PRINT_D(HOSTINF_DBG, "Couldn't delete BA Session\n");
 
@@ -4372,7 +4372,7 @@ static WILC_Sint32 Handle_DelAllRxBASessions(void *drvHandler, tstrHostIfBASessi
  */
 static int hostIFthread(void *pvArg)
 {
-	WILC_Uint32 u32Ret;
+	u32 u32Ret;
 	tstrHostIFmsg strHostIFmsg;
 	tstrWILC_WFIDrv *pstrWFIDrv;
 
@@ -4919,7 +4919,7 @@ WILC_Sint32 host_int_add_ptk(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8Ptk, u8 u8P
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
 	tstrHostIFmsg strHostIFmsg;
 	u8 u8KeyLen = u8PtkKeylen;
-	WILC_Uint32 i;
+	u32 i;
 	if (pstrWFIDrv = NULL) {
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
 	}
@@ -5015,7 +5015,7 @@ WILC_Sint32 host_int_add_ptk(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8Ptk, u8 u8P
  *  @version		1.0
  */
 WILC_Sint32 host_int_add_rx_gtk(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8RxGtk, u8 u8GtkKeylen,
-				u8 u8KeyIdx, WILC_Uint32 u32KeyRSClen, const u8 *KeyRSC,
+				u8 u8KeyIdx, u32 u32KeyRSClen, const u8 *KeyRSC,
 				const u8 *pu8RxMic, const u8 *pu8TxMic, u8 mode, u8 u8Ciphermode)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
@@ -5187,7 +5187,7 @@ WILC_Sint32 host_int_set_pmkid_info(WILC_WFIDrvHandle hWFIDrv, tstrHostIFpmkidAt
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
 	tstrHostIFmsg strHostIFmsg;
-	WILC_Uint32 i;
+	u32 i;
 
 
 	if (pstrWFIDrv = NULL) {
@@ -5246,7 +5246,7 @@ WILC_Sint32 host_int_set_pmkid_info(WILC_WFIDrvHandle hWFIDrv, tstrHostIFpmkidAt
  *  @version		1.0
  */
 WILC_Sint32 host_int_get_pmkid_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8PmkidInfoArray,
-				    WILC_Uint32 u32PmkidInfoLen)
+				    u32 u32PmkidInfoLen)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWID;
@@ -5427,7 +5427,7 @@ WILC_Sint32 host_int_get_RSNAConfigPSKPassPhrase(WILC_WFIDrvHandle hWFIDrv,
 #ifndef CONNECT_DIRECT
 WILC_Sint32 host_int_get_site_survey_results(WILC_WFIDrvHandle hWFIDrv,
 					     u8 ppu8RcvdSiteSurveyResults[][MAX_SURVEY_RESULT_FRAG_SIZE],
-					     WILC_Uint32 u32MaxSiteSrvyFragLen)
+					     u32 u32MaxSiteSrvyFragLen)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID astrWIDList[2];
@@ -5443,7 +5443,7 @@ WILC_Sint32 host_int_get_site_survey_results(WILC_WFIDrvHandle hWFIDrv,
 	astrWIDList[1].ps8WidVal = ppu8RcvdSiteSurveyResults[1];
 	astrWIDList[1].s32ValueSize = u32MaxSiteSrvyFragLen;
 
-	s32Error = SendConfigPkt(GET_CFG, astrWIDList, 2, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, astrWIDList, 2, WILC_TRUE, (u32)pstrWFIDrv);
 
 	/*get the value by searching the local copy*/
 	if (s32Error) {
@@ -5766,7 +5766,7 @@ WILC_Sint32 host_int_disconnect_station(WILC_WFIDrvHandle hWFIDrv, u8 assoc_id)
  */
 
 WILC_Sint32 host_int_get_assoc_req_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocReqInfo,
-					WILC_Uint32 u32AssocReqInfoLen)
+					u32 u32AssocReqInfoLen)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWID;
@@ -5793,7 +5793,7 @@ WILC_Sint32 host_int_get_assoc_req_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocR
  *  @version		1.0
  */
 WILC_Sint32 host_int_get_assoc_res_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocRespInfo,
-					WILC_Uint32 u32MaxAssocRespInfoLen, WILC_Uint32 *pu32RcvdAssocRespInfoLen)
+					u32 u32MaxAssocRespInfoLen, u32 *pu32RcvdAssocRespInfoLen)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWID;
@@ -5811,7 +5811,7 @@ WILC_Sint32 host_int_get_assoc_res_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocR
 
 
 	/* Sending Configuration packet */
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Failed to send association response config packet\n");
 		*pu32RcvdAssocRespInfoLen = 0;
@@ -5843,7 +5843,7 @@ WILC_Sint32 host_int_get_assoc_res_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocR
  *  @version		1.0
  */
 WILC_Sint32 host_int_get_rx_power_level(WILC_WFIDrvHandle hWFIDrv, u8 *pu8RxPowerLevel,
-					WILC_Uint32 u32RxPowerLevelLen)
+					u32 u32RxPowerLevelLen)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID strWID;
@@ -5928,7 +5928,7 @@ WILC_Sint32 host_int_wait_msg_queue_idle(void)
 
 }
 
-WILC_Sint32 host_int_set_wfi_drv_handler(WILC_Uint32 u32address)
+WILC_Sint32 host_int_set_wfi_drv_handler(u32 u32address)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 
@@ -5956,7 +5956,7 @@ WILC_Sint32 host_int_set_wfi_drv_handler(WILC_Uint32 u32address)
 
 
 
-WILC_Sint32 host_int_set_operation_mode(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32mode)
+WILC_Sint32 host_int_set_operation_mode(WILC_WFIDrvHandle hWFIDrv, u32 u32mode)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 
@@ -6036,14 +6036,14 @@ WILC_Sint32 host_int_get_host_chnl_num(WILC_WFIDrvHandle hWFIDrv, u8 *pu8ChNo)
 /**
  *  @brief                       host_int_test_set_int_wid
  *  @details             Test function for setting wids
- *  @param[in,out]   WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32TestMemAddr
+ *  @param[in,out]   WILC_WFIDrvHandle hWFIDrv, u32 u32TestMemAddr
  *  @return              Error code indicating success/failure
  *  @note
  *  @author		zsalah
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 host_int_test_set_int_wid(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32TestMemAddr)
+WILC_Sint32 host_int_test_set_int_wid(WILC_WFIDrvHandle hWFIDrv, u32 u32TestMemAddr)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWID	strWID;
@@ -6059,10 +6059,10 @@ WILC_Sint32 host_int_test_set_int_wid(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32
 	strWID.u16WIDid = (u16)WID_MEMORY_ADDRESS;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Char *)&u32TestMemAddr;
-	strWID.s32ValueSize = sizeof(WILC_Uint32);
+	strWID.s32ValueSize = sizeof(u32);
 
 	/*Sending Cfg*/
-	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	if (s32Error) {
 		PRINT_ER("Test Function: Failed to set wid value\n");
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_STATE);
@@ -6090,7 +6090,7 @@ WILC_Sint32 host_int_test_set_int_wid(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32
  *  @date
  *  @version		1.0
  */
-WILC_Sint32 host_int_get_inactive_time(WILC_WFIDrvHandle hWFIDrv, const u8 *mac, WILC_Uint32 *pu32InactiveTime)
+WILC_Sint32 host_int_get_inactive_time(WILC_WFIDrvHandle hWFIDrv, const u8 *mac, u32 *pu32InactiveTime)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -6129,14 +6129,14 @@ WILC_Sint32 host_int_get_inactive_time(WILC_WFIDrvHandle hWFIDrv, const u8 *mac,
 /**
  *  @brief              host_int_test_get_int_wid
  *  @details    Test function for getting wids
- *  @param[in,out] WILC_WFIDrvHandle hWFIDrv, WILC_Uint32* pu32TestMemAddr
+ *  @param[in,out] WILC_WFIDrvHandle hWFIDrv, u32* pu32TestMemAddr
  *  @return             Error code indicating success/failure
  *  @note
  *  @author		zsalah
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 host_int_test_get_int_wid(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 *pu32TestMemAddr)
+WILC_Sint32 host_int_test_get_int_wid(WILC_WFIDrvHandle hWFIDrv, u32 *pu32TestMemAddr)
 {
 
 	WILC_Sint32 s32Error = WILC_SUCCESS;
@@ -6152,9 +6152,9 @@ WILC_Sint32 host_int_test_get_int_wid(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 *pu
 	strWID.u16WIDid = (u16)WID_MEMORY_ADDRESS;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)pu32TestMemAddr;
-	strWID.s32ValueSize = sizeof(WILC_Uint32);
+	strWID.s32ValueSize = sizeof(u32);
 
-	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
+	s32Error = SendConfigPkt(GET_CFG, &strWID, 1, WILC_TRUE, (u32)pstrWFIDrv);
 	/*get the value by searching the local copy*/
 	if (s32Error) {
 		PRINT_ER("Test Function: Failed to get wid value\n");
@@ -6590,9 +6590,9 @@ void host_int_send_network_info_to_host
  *  @date		8 March 2012
  *  @version		1.0
  */
-static WILC_Uint32 u32Intialized;
-static WILC_Uint32 msgQ_created;
-static WILC_Uint32 clients_count;
+static u32 u32Intialized;
+static u32 msgQ_created;
+static u32 clients_count;
 
 WILC_Sint32 host_int_init(WILC_WFIDrvHandle *phWFIDrv)
 {
@@ -6837,7 +6837,7 @@ WILC_Sint32 host_int_deinit(WILC_WFIDrvHandle hWFIDrv)
 	WILC_TimerDestroy(&(pstrWFIDrv->hRemainOnChannel), NULL);
 	#endif
 
-	host_int_set_wfi_drv_handler((WILC_Uint32)NULL);
+	host_int_set_wfi_drv_handler((u32)NULL);
 	down(&hSemDeinitDrvHandle);
 
 
@@ -6914,11 +6914,11 @@ WILC_Sint32 host_int_deinit(WILC_WFIDrvHandle hWFIDrv)
  *  @date		1 Mar 2012
  *  @version		1.0
  */
-void NetworkInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length)
+void NetworkInfoReceived(u8 *pu8Buffer, u32 u32Length)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrHostIFmsg strHostIFmsg;
-	WILC_Uint32 drvHandler;
+	u32 drvHandler;
 	tstrWILC_WFIDrv *pstrWFIDrv = NULL;
 
 	drvHandler = ((pu8Buffer[u32Length - 4]) | (pu8Buffer[u32Length - 3] << 8) | (pu8Buffer[u32Length - 2] << 16) | (pu8Buffer[u32Length - 1] << 24));
@@ -6964,11 +6964,11 @@ void NetworkInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length)
  *  @date		15 Mar 2012
  *  @version		1.0
  */
-void GnrlAsyncInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length)
+void GnrlAsyncInfoReceived(u8 *pu8Buffer, u32 u32Length)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrHostIFmsg strHostIFmsg;
-	WILC_Uint32 drvHandler;
+	u32 drvHandler;
 	tstrWILC_WFIDrv *pstrWFIDrv = NULL;
 
 	/*BugID_5348*/
@@ -7021,17 +7021,17 @@ void GnrlAsyncInfoReceived(u8 *pu8Buffer, WILC_Uint32 u32Length)
 /**
  *  @brief host_int_ScanCompleteReceived
  *  @details        Setting scan complete received notifcation in message queue
- *  @param[in]     u8* pu8Buffer, WILC_Uint32 u32Length
+ *  @param[in]     u8* pu8Buffer, u32 u32Length
  *  @return         Error code.
  *  @author
  *  @date
  *  @version	1.0
  */
-void host_int_ScanCompleteReceived(u8 *pu8Buffer, WILC_Uint32 u32Length)
+void host_int_ScanCompleteReceived(u8 *pu8Buffer, u32 u32Length)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrHostIFmsg strHostIFmsg;
-	WILC_Uint32 drvHandler;
+	u32 drvHandler;
 	tstrWILC_WFIDrv *pstrWFIDrv = NULL;
 	drvHandler = ((pu8Buffer[u32Length - 4]) | (pu8Buffer[u32Length - 3] << 8) | (pu8Buffer[u32Length - 2] << 16) | (pu8Buffer[u32Length - 1] << 24));
 	pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
@@ -7087,7 +7087,7 @@ void host_int_ScanCompleteReceived(u8 *pu8Buffer, WILC_Uint32 u32Length)
  *  @date
  *  @version		1.0
  */
-WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID, WILC_Uint32 u32duration, u16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg)
+WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, u32 u32SessionID, u32 u32duration, u16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -7136,7 +7136,7 @@ WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u3
  *  @date
  *  @version		1.0
  */
-WILC_Sint32 host_int_ListenStateExpired(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID)
+WILC_Sint32 host_int_ListenStateExpired(WILC_WFIDrvHandle hWFIDrv, u32 u32SessionID)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -7226,18 +7226,18 @@ WILC_Sint32 host_int_frame_register(WILC_WFIDrvHandle hWFIDrv, u16 u16FrameType,
 /**
  *  @brief host_int_add_beacon
  *  @details       Setting add beacon params in message queue
- *  @param[in]    WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32Interval,
- *                         WILC_Uint32 u32DTIMPeriod,WILC_Uint32 u32HeadLen, u8* pu8Head,
- *                         WILC_Uint32 u32TailLen, u8* pu8Tail
+ *  @param[in]    WILC_WFIDrvHandle hWFIDrv, u32 u32Interval,
+ *                         u32 u32DTIMPeriod,u32 u32HeadLen, u8* pu8Head,
+ *                         u32 u32TailLen, u8* pu8Tail
  *  @return         Error code.
  *  @author
  *  @date
  *  @version	1.0
  */
-WILC_Sint32 host_int_add_beacon(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32Interval,
-				WILC_Uint32 u32DTIMPeriod,
-				WILC_Uint32 u32HeadLen, u8 *pu8Head,
-				WILC_Uint32 u32TailLen, u8 *pu8Tail)
+WILC_Sint32 host_int_add_beacon(WILC_WFIDrvHandle hWFIDrv, u32 u32Interval,
+				u32 u32DTIMPeriod,
+				u32 u32HeadLen, u8 *pu8Head,
+				u32 u32TailLen, u8 *pu8Tail)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -7445,7 +7445,7 @@ WILC_Sint32 host_int_del_allstation(WILC_WFIDrvHandle hWFIDrv, u8 pu8MacAddr[][E
 	tstrHostIFmsg strHostIFmsg;
 	tstrHostIFDelAllSta *pstrDelAllStationMsg = &strHostIFmsg.uniHostIFmsgBody.strHostIFDelAllSta;
 	u8 au8Zero_Buff[ETH_ALEN] = {0};
-	WILC_Uint32 i;
+	u32 i;
 	u8 u8AssocNumb = 0;
 
 
@@ -7542,7 +7542,7 @@ WILC_Sint32 host_int_edit_station(WILC_WFIDrvHandle hWFIDrv, tstrWILC_AddStaPara
 #endif /*WILC_AP_EXTERNAL_MLME*/
 uint32_t wilc_get_chipid(uint8_t);
 
-WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, WILC_Uint32 u32Timeout)
+WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, u32 u32Timeout)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -7578,7 +7578,7 @@ WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnab
 	return s32Error;
 }
 
-WILC_Sint32 host_int_setup_multicast_filter(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, WILC_Uint32 u32count)
+WILC_Sint32 host_int_setup_multicast_filter(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, u32 u32count)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 
diff --git a/drivers/staging/wilc1000/host_interface.h b/drivers/staging/wilc1000/host_interface.h
index c6ff07a..85eb3f4 100644
--- a/drivers/staging/wilc1000/host_interface.h
+++ b/drivers/staging/wilc1000/host_interface.h
@@ -62,9 +62,9 @@
 
 #define IP_ALEN  4
 
-#define BIT2                    ((WILC_Uint32)(1 << 2))
-#define BIT1                    ((WILC_Uint32)(1 << 1))
-#define BIT0                    ((WILC_Uint32)(1 << 0))
+#define BIT2                    ((u32)(1 << 2))
+#define BIT1                    ((u32)(1 << 1))
+#define BIT0                    ((u32)(1 << 0))
 
 #define AP_MODE		0x01
 #define STATION_MODE	0x02
@@ -134,9 +134,9 @@ typedef struct {
 typedef struct _tstrStatistics {
 	u8 u8LinkSpeed;
 	WILC_Sint8 s8RSSI;
-	WILC_Uint32 u32TxCount;
-	WILC_Uint32 u32RxCount;
-	WILC_Uint32 u32TxFailureCount;
+	u32 u32TxCount;
+	u32 u32RxCount;
+	u32 u32TxFailureCount;
 
 } tstrStatistics;
 
@@ -189,7 +189,7 @@ typedef enum {
 } CURRENT_TX_RATE_T;
 
 typedef struct {
-	WILC_Uint32 u32SetCfgFlag;
+	u32 u32SetCfgFlag;
 	u8 ht_enable;
 	u8 bss_type;
 	u8 auth_type;
@@ -271,11 +271,11 @@ typedef void (*tWILCpfConnectResult)(tenuConnDisconnEvent,
 				     void *);
 
 #ifdef WILC_P2P
-typedef void (*tWILCpfRemainOnChanExpired)(void *, WILC_Uint32);  /*Remain on channel expiration callback function*/
+typedef void (*tWILCpfRemainOnChanExpired)(void *, u32);  /*Remain on channel expiration callback function*/
 typedef void (*tWILCpfRemainOnChanReady)(void *); /*Remain on channel callback function*/
 #endif
 
-/* typedef WILC_Uint32 WILC_WFIDrvHandle; */
+/* typedef u32 WILC_WFIDrvHandle; */
 typedef struct {
 	WILC_Sint32 s32Dummy;
 } *WILC_WFIDrvHandle;
@@ -292,7 +292,7 @@ typedef struct {
  */
 typedef struct _tstrRcvdNetworkInfo {
 	u8 *pu8Buffer;
-	WILC_Uint32 u32Length;
+	u32 u32Length;
 } tstrRcvdNetworkInfo;
 
 /*BugID_4156*/
@@ -316,7 +316,7 @@ typedef struct {
 	/* User specific parameter to be delivered through the Scan User Callback function */
 	void *u32UserScanPvoid;
 
-	WILC_Uint32 u32RcvdChCount;
+	u32 u32RcvdChCount;
 	tstrFoundNetworkInfo astrFoundNetworkInfo[MAX_NUM_SCANNED_NETWORKS];
 } tstrWILC_UsrScanReq;
 
@@ -336,11 +336,11 @@ typedef struct {
 } tstrWILC_UsrConnReq;
 
 typedef struct {
-	WILC_Uint32 u32Address;
+	u32 u32Address;
 } tstrHostIfSetDrvHandler;
 
 typedef struct {
-	WILC_Uint32 u32Mode;
+	u32 u32Mode;
 } tstrHostIfSetOperationMode;
 
 /*BugID_5077*/
@@ -364,11 +364,11 @@ typedef struct {
 #ifdef WILC_P2P
 typedef struct {
 	u16 u16Channel;
-	WILC_Uint32 u32duration;
+	u32 u32duration;
 	tWILCpfRemainOnChanExpired pRemainOnChanExpired;
 	tWILCpfRemainOnChanReady pRemainOnChanReady;
 	void *pVoid;
-	WILC_Uint32 u32ListenSessionID;
+	u32 u32ListenSessionID;
 } tstrHostIfRemainOnChan;
 
 typedef struct {
@@ -415,7 +415,7 @@ typedef struct {
 	/* WILC_Bool bPendingConnRequest; */
 
 	#ifndef CONNECT_DIRECT
-	WILC_Uint32 u32SurveyResultsCount;
+	u32 u32SurveyResultsCount;
 	wid_site_survey_reslts_s astrSurveyResults[MAX_NUM_SCANNED_NETWORKS];
 	#endif
 
@@ -470,7 +470,7 @@ typedef struct {
 	u8 u8AmpduParams;
 	u8 au8SuppMCsSet[16];
 	u16 u16HTExtParams;
-	WILC_Uint32 u32TxBeamformingCap;
+	u32 u32TxBeamformingCap;
 	u8 u8ASELCap;
 	u16 u16FlagsMask;               /*<! Determines which of u16FlagsSet were changed>*/
 	u16 u16FlagsSet;                /*<! Decoded according to tenuWILC_StaFlag */
@@ -593,7 +593,7 @@ WILC_Sint32 host_int_add_ptk(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8Ptk, u8 u8P
  *  @date		15 April 2013
  *  @version		1.0
  */
-WILC_Sint32 host_int_get_inactive_time(WILC_WFIDrvHandle hWFIDrv, const u8 *mac, WILC_Uint32 *pu32InactiveTime);
+WILC_Sint32 host_int_get_inactive_time(WILC_WFIDrvHandle hWFIDrv, const u8 *mac, u32 *pu32InactiveTime);
 
 /**
  *  @brief              adds Rx GTk Key
@@ -612,7 +612,7 @@ WILC_Sint32 host_int_get_inactive_time(WILC_WFIDrvHandle hWFIDrv, const u8 *mac,
  *  @version		1.0
  */
 WILC_Sint32 host_int_add_rx_gtk(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8RxGtk, u8 u8GtkKeylen,
-				u8 u8KeyIdx, WILC_Uint32 u32KeyRSClen, const u8 *KeyRSC,
+				u8 u8KeyIdx, u32 u32KeyRSClen, const u8 *KeyRSC,
 				const u8 *pu8RxMic, const u8 *pu8TxMic, u8 mode, u8 u8Ciphermode);
 
 
@@ -680,7 +680,7 @@ WILC_Sint32 host_int_set_pmkid_info(WILC_WFIDrvHandle hWFIDrv, tstrHostIFpmkidAt
  */
 
 WILC_Sint32 host_int_get_pmkid_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8PmkidInfoArray,
-				    WILC_Uint32 u32PmkidInfoLen);
+				    u32 u32PmkidInfoLen);
 
 /**
  *  @brief              sets the pass phrase
@@ -786,7 +786,7 @@ WILC_Sint32 host_int_wait_msg_queue_idle(void);
 #ifndef CONNECT_DIRECT
 WILC_Sint32 host_int_get_site_survey_results(WILC_WFIDrvHandle hWFIDrv,
 					     u8 ppu8RcvdSiteSurveyResults[][MAX_SURVEY_RESULT_FRAG_SIZE],
-					     WILC_Uint32 u32MaxSiteSrvyFragLen);
+					     u32 u32MaxSiteSrvyFragLen);
 #endif
 
 /**
@@ -910,7 +910,7 @@ WILC_Sint32 host_int_disconnect_station(WILC_WFIDrvHandle hWFIDrv, u8 assoc_id);
  */
 
 WILC_Sint32 host_int_get_assoc_req_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocReqInfo,
-					WILC_Uint32 u32AssocReqInfoLen);
+					u32 u32AssocReqInfoLen);
 /**
  *  @brief              gets a Association Response info
  *  @details
@@ -924,7 +924,7 @@ WILC_Sint32 host_int_get_assoc_req_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocR
  */
 
 WILC_Sint32 host_int_get_assoc_res_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocRespInfo,
-					WILC_Uint32 u32MaxAssocRespInfoLen, WILC_Uint32 *pu32RcvdAssocRespInfoLen);
+					u32 u32MaxAssocRespInfoLen, u32 *pu32RcvdAssocRespInfoLen);
 /**
  *  @brief              gets a Association Response info
  *  @details    Valid only in STA mode. This function gives the RSSI
@@ -941,7 +941,7 @@ WILC_Sint32 host_int_get_assoc_res_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocR
  *  @version		1.0
  */
 WILC_Sint32 host_int_get_rx_power_level(WILC_WFIDrvHandle hWFIDrv, u8 *pu8RxPowerLevel,
-					WILC_Uint32 u32RxPowerLevelLen);
+					u32 u32RxPowerLevelLen);
 
 /**
  *  @brief              sets a channel
@@ -1121,10 +1121,10 @@ WILC_Sint32 host_int_deinit(WILC_WFIDrvHandle hWFIDrv);
  *  @version		1.0 Description
  *
  */
-WILC_Sint32 host_int_add_beacon(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32Interval,
-				WILC_Uint32 u32DTIMPeriod,
-				WILC_Uint32 u32HeadLen, u8 *pu8Head,
-				WILC_Uint32 u32TailLen, u8 *pu8tail);
+WILC_Sint32 host_int_add_beacon(WILC_WFIDrvHandle hWFIDrv, u32 u32Interval,
+				u32 u32DTIMPeriod,
+				u32 u32HeadLen, u8 *pu8Head,
+				u32 u32TailLen, u8 *pu8tail);
 
 
 /*!
@@ -1202,7 +1202,7 @@ WILC_Sint32 host_int_del_station(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8MacAddr
 WILC_Sint32 host_int_edit_station(WILC_WFIDrvHandle hWFIDrv, tstrWILC_AddStaParam *pstrStaParams);
 
 /*!
- *  @fn		WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, WILC_Uint32 u32Timeout)
+ *  @fn		WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, u32 u32Timeout)
  *  @brief		Set the power management mode to enabled or disabled
  *  @details
  *  @param[in,out]	hWFIDrv		handle to the wifi driver
@@ -1216,7 +1216,7 @@ WILC_Sint32 host_int_edit_station(WILC_WFIDrvHandle hWFIDrv, tstrWILC_AddStaPara
  *  @date		24 November 2012
  *  @version		1.0 Description
  */
-WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, WILC_Uint32 u32Timeout);
+WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, u32 u32Timeout);
 /*  @param[in,out]	hWFIDrv		handle to the wifi driver
  *  @param[in]	bIsEnabled	TRUE if enabled, FALSE otherwise
  *  @param[in]	u8count		count of mac address entries in the filter table
@@ -1228,7 +1228,7 @@ WILC_Sint32 host_int_set_power_mgmt(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnab
  *  @date		24 November 2012
  *  @version		1.0 Description
  */
-WILC_Sint32 host_int_setup_multicast_filter(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, WILC_Uint32 u32count);
+WILC_Sint32 host_int_setup_multicast_filter(WILC_WFIDrvHandle hWFIDrv, WILC_Bool bIsEnabled, u32 u32count);
 /**
  *  @brief           host_int_setup_ipaddress
  *  @details       set IP address on firmware
@@ -1285,7 +1285,7 @@ WILC_Sint32 host_int_get_ipaddress(WILC_WFIDrvHandle hWFIDrv, u8 *pu8IPAddr, u8
  *  @date
  *  @version	1.0
  */
-WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID, WILC_Uint32 u32duration, u16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg);
+WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, u32 u32SessionID, u32 u32duration, u16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg);
 
 /**
  *  @brief              host_int_ListenStateExpired
@@ -1301,7 +1301,7 @@ WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u3
  *  @date
  *  @version		1.0
  */
-WILC_Sint32 host_int_ListenStateExpired(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID);
+WILC_Sint32 host_int_ListenStateExpired(WILC_WFIDrvHandle hWFIDrv, u32 u32SessionID);
 
 /**
  *  @brief           host_int_frame_register
@@ -1323,8 +1323,8 @@ WILC_Sint32 host_int_frame_register(WILC_WFIDrvHandle hWFIDrv, u16 u16FrameType,
  *  @date
  *  @version	1.0
  */
-WILC_Sint32 host_int_set_wfi_drv_handler(WILC_Uint32 u32address);
-WILC_Sint32 host_int_set_operation_mode(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32mode);
+WILC_Sint32 host_int_set_wfi_drv_handler(u32 u32address);
+WILC_Sint32 host_int_set_operation_mode(WILC_WFIDrvHandle hWFIDrv, u32 u32mode);
 
 static WILC_Sint32 Handle_ScanDone(void *drvHandler, tenuScanEvent enuEvent);
 
diff --git a/drivers/staging/wilc1000/linux_mon.c b/drivers/staging/wilc1000/linux_mon.c
index 21a5432..708e321 100644
--- a/drivers/staging/wilc1000/linux_mon.c
+++ b/drivers/staging/wilc1000/linux_mon.c
@@ -299,7 +299,7 @@ static netdev_tx_t WILC_WFI_mon_xmit(struct sk_buff *skb,
 				     struct net_device *dev)
 {
 	struct ieee80211_radiotap_header *rtap_hdr;
-	WILC_Uint32 rtap_len, i, ret = 0;
+	u32 rtap_len, i, ret = 0;
 	struct WILC_WFI_mon_priv  *mon_priv;
 
 	struct sk_buff *skb2;
@@ -526,7 +526,7 @@ struct net_device *WILC_WFI_init_mon_interface(const char *name, struct net_devi
 {
 
 
-	WILC_Uint32 ret = WILC_SUCCESS;
+	u32 ret = WILC_SUCCESS;
 	struct WILC_WFI_mon_priv *priv;
 
 	/*If monitor interface is already initialized, return it*/
diff --git a/drivers/staging/wilc1000/linux_wlan.c b/drivers/staging/wilc1000/linux_wlan.c
index 70df3a1..de576b5 100644
--- a/drivers/staging/wilc1000/linux_wlan.c
+++ b/drivers/staging/wilc1000/linux_wlan.c
@@ -561,7 +561,7 @@ static void deinit_irq(linux_wlan_t *nic)
 static void linux_wlan_msleep(uint32_t msc)
 {
 	if (msc <= 4000000) {
-		WILC_Uint32 u32Temp = msc * 1000;
+		u32 u32Temp = msc * 1000;
 		usleep_range(u32Temp, u32Temp);
 	} else {
 		msleep(msc);
@@ -634,7 +634,7 @@ static void linux_wlan_lock(void *vp)
 	}
 }
 
-static int linux_wlan_lock_timeout(void *vp, WILC_Uint32 timeout)
+static int linux_wlan_lock_timeout(void *vp, u32 timeout)
 {
 	int error = -1;
 	PRINT_D(LOCK_DBG, "Locking %p\n", vp);
@@ -1124,7 +1124,7 @@ static int linux_wlan_init_test_config(struct net_device *dev, linux_wlan_t *p_n
 		goto _fail_;
 	}
 
-	*(int *)c_val = (WILC_Uint32)pstrWFIDrv;
+	*(int *)c_val = (u32)pstrWFIDrv;
 
 	if (!g_linux_wlan->oup.wlan_cfg_set(1, WID_SET_DRV_HANDLER, c_val, 4, 0, 0))
 		goto _fail_;
@@ -1364,7 +1364,7 @@ static int linux_wlan_init_test_config(struct net_device *dev, linux_wlan_t *p_n
 		goto _fail_;
 
 	c_val[0] = 1; /* Enable N with immediate block ack. */
-	if (!g_linux_wlan->oup.wlan_cfg_set(0, WID_11N_IMMEDIATE_BA_ENABLED, c_val, 1, 1, (WILC_Uint32)pstrWFIDrv))
+	if (!g_linux_wlan->oup.wlan_cfg_set(0, WID_11N_IMMEDIATE_BA_ENABLED, c_val, 1, 1, (u32)pstrWFIDrv))
 		goto _fail_;
 
 	return 0;
@@ -2100,7 +2100,7 @@ int mac_open(struct net_device *ndev)
 	for (i = 0; i < g_linux_wlan->u8NoIfcs; i++) {
 		if (ndev = g_linux_wlan->strInterfaceInfo[i].wilc_netdev) {
 			memcpy(g_linux_wlan->strInterfaceInfo[i].aSrcAddress, mac_add, ETH_ALEN);
-			g_linux_wlan->strInterfaceInfo[i].drvHandler = (WILC_Uint32)priv->hWILCWFIDrv;
+			g_linux_wlan->strInterfaceInfo[i].drvHandler = (u32)priv->hWILCWFIDrv;
 			break;
 		}
 	}
@@ -2376,7 +2376,7 @@ int mac_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
 
 	u8 *buff = NULL;
 	WILC_Sint8 rssi;
-	WILC_Uint32 size = 0, length = 0;
+	u32 size = 0, length = 0;
 	perInterface_wlan_t *nic;
 	struct WILC_WFI_priv *priv;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
diff --git a/drivers/staging/wilc1000/wilc_memory.c b/drivers/staging/wilc1000/wilc_memory.c
index f448275..2282951 100644
--- a/drivers/staging/wilc1000/wilc_memory.c
+++ b/drivers/staging/wilc1000/wilc_memory.c
@@ -6,8 +6,8 @@
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-void *WILC_MemoryAlloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
-		       WILC_Char *pcFileName, WILC_Uint32 u32LineNo)
+void *WILC_MemoryAlloc(u32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
+		       WILC_Char *pcFileName, u32 u32LineNo)
 {
 	if (u32Size > 0) {
 		return kmalloc(u32Size, GFP_ATOMIC);
@@ -21,8 +21,8 @@ void *WILC_MemoryAlloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-void *WILC_MemoryCalloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
-			WILC_Char *pcFileName, WILC_Uint32 u32LineNo)
+void *WILC_MemoryCalloc(u32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
+			WILC_Char *pcFileName, u32 u32LineNo)
 {
 	return kcalloc(u32Size, 1, GFP_KERNEL);
 }
@@ -32,8 +32,8 @@ void *WILC_MemoryCalloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-void *WILC_MemoryRealloc(void *pvOldBlock, WILC_Uint32 u32NewSize,
-			 tstrWILC_MemoryAttrs *strAttrs, WILC_Char *pcFileName, WILC_Uint32 u32LineNo)
+void *WILC_MemoryRealloc(void *pvOldBlock, u32 u32NewSize,
+			 tstrWILC_MemoryAttrs *strAttrs, WILC_Char *pcFileName, u32 u32LineNo)
 {
 	if (u32NewSize = 0) {
 		kfree(pvOldBlock);
@@ -52,7 +52,7 @@ void *WILC_MemoryRealloc(void *pvOldBlock, WILC_Uint32 u32NewSize,
  *  @version	1.0
  */
 void WILC_MemoryFree(const void *pvBlock, tstrWILC_MemoryAttrs *strAttrs,
-		     WILC_Char *pcFileName, WILC_Uint32 u32LineNo)
+		     WILC_Char *pcFileName, u32 u32LineNo)
 {
 	kfree(pvBlock);
 }
diff --git a/drivers/staging/wilc1000/wilc_memory.h b/drivers/staging/wilc1000/wilc_memory.h
index 6f404ac..8a2be8a 100644
--- a/drivers/staging/wilc1000/wilc_memory.h
+++ b/drivers/staging/wilc1000/wilc_memory.h
@@ -41,8 +41,8 @@ typedef struct {
  *  @date	16 Aug 2010
  *  @version	1.0
  */
-void *WILC_MemoryAlloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
-		       WILC_Char *pcFileName, WILC_Uint32 u32LineNo);
+void *WILC_MemoryAlloc(u32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
+		       WILC_Char *pcFileName, u32 u32LineNo);
 
 /*!
  *  @brief	Allocates a given size of bytes and zero filling it
@@ -65,8 +65,8 @@ void *WILC_MemoryAlloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
  *  @date	16 Aug 2010
  *  @version	1.0
  */
-void *WILC_MemoryCalloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
-			WILC_Char *pcFileName, WILC_Uint32 u32LineNo);
+void *WILC_MemoryCalloc(u32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
+			WILC_Char *pcFileName, u32 u32LineNo);
 
 /*!
  *  @brief	Reallocates a given block to a new size
@@ -93,8 +93,8 @@ void *WILC_MemoryCalloc(WILC_Uint32 u32Size, tstrWILC_MemoryAttrs *strAttrs,
  *  @date	16 Aug 2010
  *  @version	1.0
  */
-void *WILC_MemoryRealloc(void *pvOldBlock, WILC_Uint32 u32NewSize,
-			 tstrWILC_MemoryAttrs *strAttrs, WILC_Char *pcFileName, WILC_Uint32 u32LineNo);
+void *WILC_MemoryRealloc(void *pvOldBlock, u32 u32NewSize,
+			 tstrWILC_MemoryAttrs *strAttrs, WILC_Char *pcFileName, u32 u32LineNo);
 
 /*!
  *  @brief	Frees given block
@@ -114,7 +114,7 @@ void *WILC_MemoryRealloc(void *pvOldBlock, WILC_Uint32 u32NewSize,
  *  @version	1.0
  */
 void WILC_MemoryFree(const void *pvBlock, tstrWILC_MemoryAttrs *strAttrs,
-			WILC_Char *pcFileName, WILC_Uint32 u32LineNo);
+			WILC_Char *pcFileName, u32 u32LineNo);
 
 /*!
  * @brief	standrad malloc wrapper with custom attributes
@@ -149,7 +149,7 @@ void WILC_MemoryFree(const void *pvBlock, tstrWILC_MemoryAttrs *strAttrs,
  */
 #define WILC_NEW_EX(__struct_type__, __n_structs__, __attrs__) \
 	((__struct_type__ *)WILC_MALLOC_EX( \
-		 sizeof(__struct_type__) * (WILC_Uint32)(__n_structs__), __attrs__))
+		 sizeof(__struct_type__) * (u32)(__n_structs__), __attrs__))
 
 /*!
  * @brief	Allocates a block (with custom attributes) of given type and number of
@@ -157,7 +157,7 @@ void WILC_MemoryFree(const void *pvBlock, tstrWILC_MemoryAttrs *strAttrs,
  */
 #define WILC_NEW_0_EX(__struct_type__, __n_structs__, __attrs__) \
 	((__struct_type__ *)WILC_CALLOC_EX( \
-		 sizeof(__struct_type__) * (WILC_Uint32)(__n_structs__), __attrs__))
+		 sizeof(__struct_type__) * (u32)(__n_structs__), __attrs__))
 
 /*!
  * @brief	Frees a block (with custom attributes), also setting the original pointer
diff --git a/drivers/staging/wilc1000/wilc_msgqueue.c b/drivers/staging/wilc1000/wilc_msgqueue.c
index ebbba8b..8531bf1 100644
--- a/drivers/staging/wilc1000/wilc_msgqueue.c
+++ b/drivers/staging/wilc1000/wilc_msgqueue.c
@@ -53,7 +53,7 @@ WILC_ErrNo WILC_MsgQueueDestroy(WILC_MsgQueueHandle *pHandle,
  *  @version		1.0
  */
 WILC_ErrNo WILC_MsgQueueSend(WILC_MsgQueueHandle *pHandle,
-			     const void *pvSendBuffer, WILC_Uint32 u32SendBufferSize,
+			     const void *pvSendBuffer, u32 u32SendBufferSize,
 			     tstrWILC_MsgQueueAttrs *pstrAttrs)
 {
 	WILC_ErrNo s32RetStatus = WILC_SUCCESS;
@@ -118,8 +118,8 @@ WILC_ErrNo WILC_MsgQueueSend(WILC_MsgQueueHandle *pHandle,
  *  @version		1.0
  */
 WILC_ErrNo WILC_MsgQueueRecv(WILC_MsgQueueHandle *pHandle,
-			     void *pvRecvBuffer, WILC_Uint32 u32RecvBufferSize,
-			     WILC_Uint32 *pu32ReceivedLength,
+			     void *pvRecvBuffer, u32 u32RecvBufferSize,
+			     u32 *pu32ReceivedLength,
 			     tstrWILC_MsgQueueAttrs *pstrAttrs)
 {
 
diff --git a/drivers/staging/wilc1000/wilc_msgqueue.h b/drivers/staging/wilc1000/wilc_msgqueue.h
index d7e4b1c..2ca02db 100644
--- a/drivers/staging/wilc1000/wilc_msgqueue.h
+++ b/drivers/staging/wilc1000/wilc_msgqueue.h
@@ -58,7 +58,7 @@ WILC_ErrNo WILC_MsgQueueCreate(WILC_MsgQueueHandle *pHandle,
  *  @version		1.0
  */
 WILC_ErrNo WILC_MsgQueueSend(WILC_MsgQueueHandle *pHandle,
-			     const void *pvSendBuffer, WILC_Uint32 u32SendBufferSize,
+			     const void *pvSendBuffer, u32 u32SendBufferSize,
 			     tstrWILC_MsgQueueAttrs *pstrAttrs);
 
 
@@ -80,8 +80,8 @@ WILC_ErrNo WILC_MsgQueueSend(WILC_MsgQueueHandle *pHandle,
  *  @version		1.0
  */
 WILC_ErrNo WILC_MsgQueueRecv(WILC_MsgQueueHandle *pHandle,
-			     void *pvRecvBuffer, WILC_Uint32 u32RecvBufferSize,
-			     WILC_Uint32 *pu32ReceivedLength,
+			     void *pvRecvBuffer, u32 u32RecvBufferSize,
+			     u32 *pu32ReceivedLength,
 			     tstrWILC_MsgQueueAttrs *pstrAttrs);
 
 
diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index 2e873b6..964e818 100644
--- a/drivers/staging/wilc1000/wilc_oswrapper.h
+++ b/drivers/staging/wilc1000/wilc_oswrapper.h
@@ -14,7 +14,6 @@
 #define WILC_OSW_INTERFACE_VER 2
 
 /* Integer Types */
-typedef unsigned int WILC_Uint32;
 typedef unsigned long long WILC_Uint64;
 typedef signed char WILC_Sint8;
 typedef signed short WILC_Sint16;
diff --git a/drivers/staging/wilc1000/wilc_platform.h b/drivers/staging/wilc1000/wilc_platform.h
index ae42bbc..e185eb3 100644
--- a/drivers/staging/wilc1000/wilc_platform.h
+++ b/drivers/staging/wilc1000/wilc_platform.h
@@ -23,7 +23,7 @@ typedef struct timer_list WILC_TimerHandle;
 /* Message Queue type is a structure */
 typedef struct __Message_struct {
 	void *pvBuffer;
-	WILC_Uint32 u32Length;
+	u32 u32Length;
 	struct __Message_struct *pstrNext;
 } Message;
 
@@ -31,7 +31,7 @@ typedef struct __MessageQueue_struct {
 	struct semaphore hSem;
 	spinlock_t strCriticalSection;
 	WILC_Bool bExiting;
-	WILC_Uint32 u32ReceiversCount;
+	u32 u32ReceiversCount;
 	Message *pstrMessageList;
 } WILC_MsgQueueHandle;
 
diff --git a/drivers/staging/wilc1000/wilc_sleep.c b/drivers/staging/wilc1000/wilc_sleep.c
index 98a079f..569b833 100644
--- a/drivers/staging/wilc1000/wilc_sleep.c
+++ b/drivers/staging/wilc1000/wilc_sleep.c
@@ -6,10 +6,10 @@
  *  @date	10 Aug 2010
  *  @version	1.0
  */
-void WILC_Sleep(WILC_Uint32 u32TimeMilliSec)
+void WILC_Sleep(u32 u32TimeMilliSec)
 {
 	if (u32TimeMilliSec <= 4000000)	{
-		WILC_Uint32 u32Temp = u32TimeMilliSec * 1000;
+		u32 u32Temp = u32TimeMilliSec * 1000;
 		usleep_range(u32Temp, u32Temp);
 	} else {
 		msleep(u32TimeMilliSec);
diff --git a/drivers/staging/wilc1000/wilc_sleep.h b/drivers/staging/wilc1000/wilc_sleep.h
index 2865c8e..261f4ed 100644
--- a/drivers/staging/wilc1000/wilc_sleep.h
+++ b/drivers/staging/wilc1000/wilc_sleep.h
@@ -12,6 +12,6 @@
  *              sleep, for accurate high resolution sleep use u32TimeMicoSec
  */
 /* TODO: remove and open-code in callers */
-void WILC_Sleep(WILC_Uint32 u32TimeMilliSec);
+void WILC_Sleep(u32 u32TimeMilliSec);
 
 #endif
diff --git a/drivers/staging/wilc1000/wilc_strutils.c b/drivers/staging/wilc1000/wilc_strutils.c
index c6af13c..52df793 100644
--- a/drivers/staging/wilc1000/wilc_strutils.c
+++ b/drivers/staging/wilc1000/wilc_strutils.c
@@ -9,7 +9,7 @@
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-WILC_Sint32 WILC_memcmp(const void *pvArg1, const void *pvArg2, WILC_Uint32 u32Count)
+WILC_Sint32 WILC_memcmp(const void *pvArg1, const void *pvArg2, u32 u32Count)
 {
 	return memcmp(pvArg1, pvArg2, u32Count);
 }
@@ -20,7 +20,7 @@ WILC_Sint32 WILC_memcmp(const void *pvArg1, const void *pvArg2, WILC_Uint32 u32C
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-void WILC_memcpy_INTERNAL(void *pvTarget, const void *pvSource, WILC_Uint32 u32Count)
+void WILC_memcpy_INTERNAL(void *pvTarget, const void *pvSource, u32 u32Count)
 {
 	memcpy(pvTarget, pvSource, u32Count);
 }
@@ -30,7 +30,7 @@ void WILC_memcpy_INTERNAL(void *pvTarget, const void *pvSource, WILC_Uint32 u32C
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-void *WILC_memset(void *pvTarget, u8 u8SetValue, WILC_Uint32 u32Count)
+void *WILC_memset(void *pvTarget, u8 u8SetValue, u32 u32Count)
 {
 	return memset(pvTarget, u8SetValue, u32Count);
 }
@@ -41,13 +41,13 @@ void *WILC_memset(void *pvTarget, u8 u8SetValue, WILC_Uint32 u32Count)
  *  @version	1.0
  */
 WILC_Char *WILC_strncpy(WILC_Char *pcTarget, const WILC_Char *pcSource,
-			WILC_Uint32 u32Count)
+			u32 u32Count)
 {
 	return strncpy(pcTarget, pcSource, u32Count);
 }
 
 WILC_Sint32 WILC_strncmp(const WILC_Char *pcStr1, const WILC_Char *pcStr2,
-			 WILC_Uint32 u32Count)
+			 u32 u32Count)
 {
 	WILC_Sint32 s32Result;
 
@@ -74,7 +74,7 @@ WILC_Sint32 WILC_strncmp(const WILC_Char *pcStr1, const WILC_Char *pcStr2,
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-WILC_Uint32 WILC_strlen(const WILC_Char *pcStr)
+u32 WILC_strlen(const WILC_Char *pcStr)
 {
-	return (WILC_Uint32)strlen(pcStr);
+	return (u32)strlen(pcStr);
 }
diff --git a/drivers/staging/wilc1000/wilc_strutils.h b/drivers/staging/wilc1000/wilc_strutils.h
index ddc54ab..6d9b400 100644
--- a/drivers/staging/wilc1000/wilc_strutils.h
+++ b/drivers/staging/wilc1000/wilc_strutils.h
@@ -22,7 +22,7 @@
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-WILC_Sint32 WILC_memcmp(const void *pvArg1, const void *pvArg2, WILC_Uint32 u32Count);
+WILC_Sint32 WILC_memcmp(const void *pvArg1, const void *pvArg2, u32 u32Count);
 
 /*!
  *  @brief	Internal implementation for memory copy
@@ -34,7 +34,7 @@ WILC_Sint32 WILC_memcmp(const void *pvArg1, const void *pvArg2, WILC_Uint32 u32C
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-void WILC_memcpy_INTERNAL(void *pvTarget, const void *pvSource, WILC_Uint32 u32Count);
+void WILC_memcpy_INTERNAL(void *pvTarget, const void *pvSource, u32 u32Count);
 
 /*!
  *  @brief	Copies the contents of a memory buffer into another
@@ -50,7 +50,7 @@ void WILC_memcpy_INTERNAL(void *pvTarget, const void *pvSource, WILC_Uint32 u32C
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-static WILC_ErrNo WILC_memcpy(void *pvTarget, const void *pvSource, WILC_Uint32 u32Count)
+static WILC_ErrNo WILC_memcpy(void *pvTarget, const void *pvSource, u32 u32Count)
 {
 	if (
 		(((u8 *)pvTarget <= (u8 *)pvSource)
@@ -78,7 +78,7 @@ static WILC_ErrNo WILC_memcpy(void *pvTarget, const void *pvSource, WILC_Uint32
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-void *WILC_memset(void *pvTarget, u8 u8SetValue, WILC_Uint32 u32Count);
+void *WILC_memset(void *pvTarget, u8 u8SetValue, u32 u32Count);
 
 /*!
  *  @brief	copies the contents of source string into the target string
@@ -93,7 +93,7 @@ void *WILC_memset(void *pvTarget, u8 u8SetValue, WILC_Uint32 u32Count);
  *  @version	1.0
  */
 WILC_Char *WILC_strncpy(WILC_Char *pcTarget, const WILC_Char *pcSource,
-			WILC_Uint32 u32Count);
+			u32 u32Count);
 
 /*!
  *  @brief	Compares two strings up to u32Count characters
@@ -114,7 +114,7 @@ WILC_Char *WILC_strncpy(WILC_Char *pcTarget, const WILC_Char *pcSource,
  *  @version	1.0
  */
 WILC_Sint32 WILC_strncmp(const WILC_Char *pcStr1, const WILC_Char *pcStr2,
-			 WILC_Uint32 u32Count);
+			 u32 u32Count);
 
 /*!
  *  @brief	gets the length of a string
@@ -125,6 +125,6 @@ WILC_Sint32 WILC_strncmp(const WILC_Char *pcStr1, const WILC_Char *pcStr2,
  *  @date	18 Aug 2010
  *  @version	1.0
  */
-WILC_Uint32 WILC_strlen(const WILC_Char *pcStr);
+u32 WILC_strlen(const WILC_Char *pcStr);
 
 #endif
diff --git a/drivers/staging/wilc1000/wilc_timer.c b/drivers/staging/wilc1000/wilc_timer.c
index 7d2e6f1..c31bf0c 100644
--- a/drivers/staging/wilc1000/wilc_timer.c
+++ b/drivers/staging/wilc1000/wilc_timer.c
@@ -23,7 +23,7 @@ WILC_ErrNo WILC_TimerDestroy(WILC_TimerHandle *pHandle,
 }
 
 
-WILC_ErrNo WILC_TimerStart(WILC_TimerHandle *pHandle, WILC_Uint32 u32Timeout,
+WILC_ErrNo WILC_TimerStart(WILC_TimerHandle *pHandle, u32 u32Timeout,
 	void *pvArg, tstrWILC_TimerAttrs *pstrAttrs)
 {
 	WILC_ErrNo s32RetStatus = WILC_FAIL;
diff --git a/drivers/staging/wilc1000/wilc_timer.h b/drivers/staging/wilc1000/wilc_timer.h
index 72b2715..72efa85 100644
--- a/drivers/staging/wilc1000/wilc_timer.h
+++ b/drivers/staging/wilc1000/wilc_timer.h
@@ -96,7 +96,7 @@ WILC_ErrNo WILC_TimerDestroy(WILC_TimerHandle *pHandle,
  *  @date	16 Aug 2010
  *  @version	1.0
  */
-WILC_ErrNo WILC_TimerStart(WILC_TimerHandle *pHandle, WILC_Uint32 u32Timeout, void *pvArg,
+WILC_ErrNo WILC_TimerStart(WILC_TimerHandle *pHandle, u32 u32Timeout, void *pvArg,
 			   tstrWILC_TimerAttrs *pstrAttrs);
 
 
diff --git a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
index a2047e3..f330876 100644
--- a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
+++ b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
@@ -31,7 +31,7 @@ extern int mac_open(struct net_device *ndev);
 extern int mac_close(struct net_device *ndev);
 
 tstrNetworkInfo astrLastScannedNtwrksShadow[MAX_NUM_SCANNED_NETWORKS_SHADOW];
-WILC_Uint32 u32LastScannedNtwrksCountShadow;
+u32 u32LastScannedNtwrksCountShadow;
 #ifdef DISABLE_PWRSAVE_AND_SCAN_DURING_IP
 WILC_TimerHandle hDuringIpTimer;
 #endif
@@ -438,7 +438,7 @@ static void CfgScanResult(tenuScanEvent enuScanEvent, tstrNetworkInfo *pstrNetwo
 						PRINT_ER("Discovered networks exceeded the max limit\n");
 					}
 				} else {
-					WILC_Uint32 i;
+					u32 i;
 					/* So this network is discovered before, we'll just update its RSSI */
 					for (i = 0; i < priv->u32RcvdChCount; i++) {
 						if (WILC_memcmp(astrLastScannedNtwrksShadow[i].au8bssid, pstrNetworkInfo->au8bssid, 6) = 0) {
@@ -509,7 +509,7 @@ static void CfgScanResult(tenuScanEvent enuScanEvent, tstrNetworkInfo *pstrNetwo
  */
 int WILC_WFI_Set_PMKSA(u8 *bssid, struct WILC_WFI_priv *priv)
 {
-	WILC_Uint32 i;
+	u32 i;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 
 
@@ -600,7 +600,7 @@ static void CfgConnectResult(tenuConnDisconnEvent enuConnDisconnEvent,
 
 		if (u16ConnectStatus = WLAN_STATUS_SUCCESS) {
 			WILC_Bool bNeedScanRefresh = WILC_FALSE;
-			WILC_Uint32 i;
+			u32 i;
 
 			PRINT_INFO(CFG80211_DBG, "Connection Successful:: BSSID: %x%x%x%x%x%x\n", pstrConnectInfo->au8bssid[0],
 				   pstrConnectInfo->au8bssid[1], pstrConnectInfo->au8bssid[2], pstrConnectInfo->au8bssid[3], pstrConnectInfo->au8bssid[4], pstrConnectInfo->au8bssid[5]);
@@ -699,7 +699,7 @@ static int WILC_WFI_CfgSetChannel(struct wiphy *wiphy,
 				  struct cfg80211_chan_def *chandef)
 {
 
-	WILC_Uint32 channelnum = 0;
+	u32 channelnum = 0;
 	struct WILC_WFI_priv *priv;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	priv = wiphy_priv(wiphy);
@@ -736,7 +736,7 @@ static int WILC_WFI_CfgSetChannel(struct wiphy *wiphy,
 static int WILC_WFI_CfgScan(struct wiphy *wiphy, struct cfg80211_scan_request *request)
 {
 	struct WILC_WFI_priv *priv;
-	WILC_Uint32 i;
+	u32 i;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	u8 au8ScanChanList[MAX_NUM_SCANNED_NETWORKS];
 	tstrHiddenNetwork strHiddenNetwork;
@@ -747,7 +747,7 @@ static int WILC_WFI_CfgScan(struct wiphy *wiphy, struct cfg80211_scan_request *r
 
 	priv->u32RcvdChCount = 0;
 
-	host_int_set_wfi_drv_handler((WILC_Uint32)priv->hWILCWFIDrv);
+	host_int_set_wfi_drv_handler((u32)priv->hWILCWFIDrv);
 
 
 	reset_shadow_found(priv);
@@ -826,7 +826,7 @@ static int WILC_WFI_CfgConnect(struct wiphy *wiphy, struct net_device *dev,
 			       struct cfg80211_connect_params *sme)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
-	WILC_Uint32 i;
+	u32 i;
 	u8 u8security = NO_ENCRYPT;
 	AUTHTYPE_T tenuAuth_type = ANY;
 	WILC_Char *pcgroup_encrypt_val = NULL;
@@ -842,7 +842,7 @@ static int WILC_WFI_CfgConnect(struct wiphy *wiphy, struct net_device *dev,
 	priv = wiphy_priv(wiphy);
 	pstrWFIDrv = (tstrWILC_WFIDrv *)(priv->hWILCWFIDrv);
 
-	host_int_set_wfi_drv_handler((WILC_Uint32)priv->hWILCWFIDrv);
+	host_int_set_wfi_drv_handler((u32)priv->hWILCWFIDrv);
 
 	PRINT_D(CFG80211_DBG, "Connecting to SSID [%s] on netdev [%p] host if [%p]\n", sme->ssid, dev, priv->hWILCWFIDrv);
 	#ifdef WILC_P2P
@@ -1131,7 +1131,7 @@ static int WILC_WFI_add_key(struct wiphy *wiphy, struct net_device *netdev, u8 k
 
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS, KeyLen = params->key_len;
-	WILC_Uint32 i;
+	u32 i;
 	struct WILC_WFI_priv *priv;
 	const u8 *pu8RxMic = NULL;
 	const u8 *pu8TxMic = NULL;
@@ -1538,7 +1538,7 @@ static int WILC_WFI_get_key(struct wiphy *wiphy, struct net_device *netdev, u8 k
 
 	struct WILC_WFI_priv *priv;
 	struct  key_params key_params;
-	WILC_Uint32 i;
+	u32 i;
 	priv = wiphy_priv(wiphy);
 
 
@@ -1641,9 +1641,9 @@ static int WILC_WFI_get_station(struct wiphy *wiphy, struct net_device *dev,
 	struct WILC_WFI_priv *priv;
 	perInterface_wlan_t *nic;
 	#ifdef WILC_AP_EXTERNAL_MLME
-	WILC_Uint32 i = 0;
-	WILC_Uint32 associatedsta = 0;
-	WILC_Uint32 inactive_time = 0;
+	u32 i = 0;
+	u32 associatedsta = 0;
+	u32 inactive_time = 0;
 	#endif
 	priv = wiphy_priv(wiphy);
 	nic = netdev_priv(dev);
@@ -1899,7 +1899,7 @@ static int WILC_WFI_set_bitrate_mask(struct wiphy *wiphy,
 static int WILC_WFI_set_pmksa(struct wiphy *wiphy, struct net_device *netdev,
 			      struct cfg80211_pmksa *pmksa)
 {
-	WILC_Uint32 i;
+	u32 i;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	u8 flag = 0;
 
@@ -1950,7 +1950,7 @@ static int WILC_WFI_del_pmksa(struct wiphy *wiphy, struct net_device *netdev,
 			      struct cfg80211_pmksa *pmksa)
 {
 
-	WILC_Uint32 i;
+	u32 i;
 	u8 flag = 0;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 
@@ -2023,10 +2023,10 @@ static int  WILC_WFI_flush_pmksa(struct wiphy *wiphy, struct net_device *netdev)
  *  @version
  */
 
-void WILC_WFI_CfgParseRxAction(u8 *buf, WILC_Uint32 len)
+void WILC_WFI_CfgParseRxAction(u8 *buf, u32 len)
 {
-	WILC_Uint32 index = 0;
-	WILC_Uint32 i = 0, j = 0;
+	u32 index = 0;
+	u32 i = 0, j = 0;
 
 	/*BugID_5460*/
 	#ifdef USE_SUPPLICANT_GO_INTENT
@@ -2119,10 +2119,10 @@ void WILC_WFI_CfgParseRxAction(u8 *buf, WILC_Uint32 len)
  *  @date	12 DEC 2012
  *  @version
  */
-void WILC_WFI_CfgParseTxAction(u8 *buf, WILC_Uint32 len, WILC_Bool bOperChan, u8 iftype)
+void WILC_WFI_CfgParseTxAction(u8 *buf, u32 len, WILC_Bool bOperChan, u8 iftype)
 {
-	WILC_Uint32 index = 0;
-	WILC_Uint32 i = 0, j = 0;
+	u32 index = 0;
+	u32 i = 0, j = 0;
 
 	u8 op_channel_attr_index = 0;
 	u8 channel_list_attr_index = 0;
@@ -2210,9 +2210,9 @@ void WILC_WFI_p2p_rx (struct net_device *dev, uint8_t *buff, uint32_t size)
 {
 
 	struct WILC_WFI_priv *priv;
-	WILC_Uint32 header, pkt_offset;
+	u32 header, pkt_offset;
 	tstrWILC_WFIDrv *pstrWFIDrv;
-	WILC_Uint32 i = 0;
+	u32 i = 0;
 	WILC_Sint32 s32Freq;
 	priv = wiphy_priv(dev->ieee80211_ptr->wiphy);
 	pstrWFIDrv = (tstrWILC_WFIDrv *)priv->hWILCWFIDrv;
@@ -2372,7 +2372,7 @@ static void WILC_WFI_RemainOnChannelReady(void *pUserVoid)
  *  @version
  */
 
-static void WILC_WFI_RemainOnChannelExpired(void *pUserVoid, WILC_Uint32 u32SessionID)
+static void WILC_WFI_RemainOnChannelExpired(void *pUserVoid, u32 u32SessionID)
 {
 	struct WILC_WFI_priv *priv;
 	priv = (struct WILC_WFI_priv *)pUserVoid;
@@ -2513,9 +2513,9 @@ int WILC_WFI_mgmt_tx(struct wiphy *wiphy,
 	struct WILC_WFI_priv *priv;
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv;
-	WILC_Uint32 i;
+	u32 i;
 	perInterface_wlan_t *nic;
-	WILC_Uint32 buf_len = len + sizeof(u8P2P_vendorspec) + sizeof(u8P2Plocalrandom);
+	u32 buf_len = len + sizeof(u8P2P_vendorspec) + sizeof(u8P2Plocalrandom);
 
 	nic = netdev_priv(wdev->netdev);
 	priv = wiphy_priv(wiphy);
diff --git a/drivers/staging/wilc1000/wilc_wfi_netdevice.h b/drivers/staging/wilc1000/wilc_wfi_netdevice.h
index d07216a2..108d453 100644
--- a/drivers/staging/wilc1000/wilc_wfi_netdevice.h
+++ b/drivers/staging/wilc1000/wilc_wfi_netdevice.h
@@ -117,9 +117,9 @@ struct sta_info {
 struct wilc_wfi_p2pListenParams {
 	struct ieee80211_channel *pstrListenChan;
 	enum nl80211_channel_type tenuChannelType;
-	WILC_Uint32 u32ListenDuration;
+	u32 u32ListenDuration;
 	WILC_Uint64 u64ListenCookie;
-	WILC_Uint32 u32ListenSessionID;
+	u32 u32ListenSessionID;
 };
 
 #endif  /*WILC_P2P*/
@@ -135,7 +135,7 @@ struct WILC_WFI_priv {
 	#endif
 
 	WILC_Bool bCfgScanning;
-	WILC_Uint32 u32RcvdChCount;
+	u32 u32RcvdChCount;
 
 
 
diff --git a/drivers/staging/wilc1000/wilc_wlan.c b/drivers/staging/wilc1000/wilc_wlan.c
index 2a015e8..a456d0d 100644
--- a/drivers/staging/wilc1000/wilc_wlan.c
+++ b/drivers/staging/wilc1000/wilc_wlan.c
@@ -852,7 +852,7 @@ INLINE void chip_wakeup(void)
 	genuChipPSstate = CHIP_WAKEDUP;
 }
 #endif
-void chip_sleep_manually(WILC_Uint32 u32SleepTime)
+void chip_sleep_manually(u32 u32SleepTime)
 {
 	if (genuChipPSstate != CHIP_WAKEDUP) {
 		/* chip is already sleeping. Do nothing */
@@ -1869,7 +1869,7 @@ static int wilc_wlan_cfg_commit(int type, uint32_t drvHandler)
 	wilc_cfg_frame_t *cfg = &p->cfg_frame;
 	int total_len = p->cfg_frame_offset + 4 + DRIVER_HANDLER_SIZE;
 	int seq_no = p->cfg_seq_no % 256;
-	int driver_handler = (WILC_Uint32)drvHandler;
+	int driver_handler = (u32)drvHandler;
 
 
 	/**
@@ -2328,7 +2328,7 @@ _fail_:
 u16 Set_machw_change_vir_if(WILC_Bool bValue)
 {
 	u16 ret;
-	WILC_Uint32 reg;
+	u32 reg;
 
 	/*Reset WILC_CHANGING_VIR_IF register to allow adding futrue keys to CE H/W*/
 	(&g_wlan)->os_func.os_enter_cs((&g_wlan)->hif_lock);
diff --git a/drivers/staging/wilc1000/wilc_wlan_cfg.c b/drivers/staging/wilc1000/wilc_wlan_cfg.c
index a627c58..d7e7e925 100644
--- a/drivers/staging/wilc1000/wilc_wlan_cfg.c
+++ b/drivers/staging/wilc1000/wilc_wlan_cfg.c
@@ -541,7 +541,7 @@ static int wilc_wlan_cfg_indicate_rx(uint8_t *frame, int size, wilc_cfg_rsp_t *r
 	uint8_t msg_id;
 	uint16_t msg_len;
 	#ifdef WILC_FULLY_HOSTING_AP
-	WILC_Uint32 *ptru32Frame;
+	u32 *ptru32Frame;
 	WILC_Bool bStatus = frame[2];
 
 	#ifdef BIG_ENDIAN
diff --git a/drivers/staging/wilc1000/wilc_wlan_if.h b/drivers/staging/wilc1000/wilc_wlan_if.h
index dd86ca7..ea0ec41 100644
--- a/drivers/staging/wilc1000/wilc_wlan_if.h
+++ b/drivers/staging/wilc1000/wilc_wlan_if.h
@@ -92,7 +92,7 @@ typedef struct {
 	void (*os_free)(void *);
 	void (*os_lock)(void *);
 	void (*os_unlock)(void *);
-	int (*os_wait)(void *, WILC_Uint32);
+	int (*os_wait)(void *, u32);
 	void (*os_signal)(void *);
 	void (*os_enter_cs)(void *);
 	void (*os_leave_cs)(void *);
@@ -238,7 +238,7 @@ typedef struct {
 #define MAX_SSID_LEN            33
 #define MAX_RATES_SUPPORTED     12
 
-#define INFINITE_SLEEP_TIME		((WILC_Uint32)0xFFFFFFFF)
+#define INFINITE_SLEEP_TIME		((u32)0xFFFFFFFF)
 
 #ifdef WILC_PARSE_SCAN_IN_HOST
 typedef enum {
-- 
1.9.1

