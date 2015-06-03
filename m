From: chaehyun lim <chaehyun.lim@gmail.com>
Date: Wed, 03 Jun 2015 04:48:53 +0000
Subject: [PATCH 2/8] staging : wilc1000 : remove WILC_Uint16
Message-Id: <1433306933-30594-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u16 in stead of WILC_Uint16.

Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/coreconfigurator.c       |  98 +++----
 drivers/staging/wilc1000/coreconfigurator.h       |  26 +-
 drivers/staging/wilc1000/host_interface.c         | 302 +++++++++++-----------
 drivers/staging/wilc1000/host_interface.h         |  56 ++--
 drivers/staging/wilc1000/linux_mon.c              |   2 +-
 drivers/staging/wilc1000/linux_wlan.c             |   2 +-
 drivers/staging/wilc1000/wilc_oswrapper.h         |   3 +-
 drivers/staging/wilc1000/wilc_time.h              |   2 +-
 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c |   8 +-
 drivers/staging/wilc1000/wilc_wfi_netdevice.h     |   2 +-
 drivers/staging/wilc1000/wilc_wlan.c              |   8 +-
 11 files changed, 254 insertions(+), 255 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 6cc5c6a..58a2e53 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -175,7 +175,7 @@ static u8 g_seqno;
 
 static WILC_Sint16 g_wid_num          = -1;
 
-static WILC_Uint16 Res_Len;
+static u16 Res_Len;
 
 static u8 g_oper_mode    = SET_CFG;
 
@@ -308,7 +308,7 @@ static tstrWID gastrWIDs[] = {
 #endif /* MAC_802_11N */
 };
 
-WILC_Uint16 g_num_total_switches = (sizeof(gastrWIDs) / sizeof(tstrWID));
+u16 g_num_total_switches = (sizeof(gastrWIDs) / sizeof(tstrWID));
 /*****************************************************************************/
 /* Static Function Declarations                                              */
 /*****************************************************************************/
@@ -339,7 +339,7 @@ INLINE u8 get_hex_char(u8 inp)
 
 /* This function extracts the MAC address held in a string in standard format */
 /* into another buffer as integers.                                           */
-INLINE WILC_Uint16 extract_mac_addr(WILC_Char *str, u8 *buff)
+INLINE u16 extract_mac_addr(WILC_Char *str, u8 *buff)
 {
 	*buff = 0;
 	while (*str != '\0') {
@@ -475,9 +475,9 @@ INLINE tenuWIDtype get_wid_type(WILC_Uint32 wid_num)
 
 /* This function extracts the beacon period field from the beacon or probe   */
 /* response frame.                                                           */
-INLINE WILC_Uint16 get_beacon_period(u8 *data)
+INLINE u16 get_beacon_period(u8 *data)
 {
-	WILC_Uint16 bcn_per = 0;
+	u16 bcn_per = 0;
 
 	bcn_per  = data[0];
 	bcn_per |= (data[1] << 8);
@@ -604,10 +604,10 @@ INLINE void get_ssid(u8 *data, u8 *ssid, u8 *p_ssid_len)
 
 /* This function extracts the capability info field from the beacon or probe */
 /* response frame.                                                           */
-INLINE WILC_Uint16 get_cap_info(u8 *data)
+INLINE u16 get_cap_info(u8 *data)
 {
-	WILC_Uint16 cap_info = 0;
-	WILC_Uint16 index    = MAC_HDR_LEN;
+	u16 cap_info = 0;
+	u16 index    = MAC_HDR_LEN;
 	tenuFrmSubtype st = BEACON;
 
 	st = get_sub_type(data);
@@ -625,9 +625,9 @@ INLINE WILC_Uint16 get_cap_info(u8 *data)
 
 /* This function extracts the capability info field from the Association */
 /* response frame.                                                                       */
-INLINE WILC_Uint16 get_assoc_resp_cap_info(u8 *data)
+INLINE u16 get_assoc_resp_cap_info(u8 *data)
 {
-	WILC_Uint16 cap_info = 0;
+	u16 cap_info = 0;
 
 	cap_info  = data[0];
 	cap_info |= (data[1] << 8);
@@ -637,9 +637,9 @@ INLINE WILC_Uint16 get_assoc_resp_cap_info(u8 *data)
 
 /* This funcion extracts the association status code from the incoming       */
 /* association response frame and returns association status code            */
-INLINE WILC_Uint16 get_asoc_status(u8 *data)
+INLINE u16 get_asoc_status(u8 *data)
 {
-	WILC_Uint16 asoc_status = 0;
+	u16 asoc_status = 0;
 
 	asoc_status = data[3];
 	asoc_status = (asoc_status << 8) | data[2];
@@ -649,9 +649,9 @@ INLINE WILC_Uint16 get_asoc_status(u8 *data)
 
 /* This function extracts association ID from the incoming association       */
 /* response frame							                                     */
-INLINE WILC_Uint16 get_asoc_id(u8 *data)
+INLINE u16 get_asoc_id(u8 *data)
 {
-	WILC_Uint16 asoc_id = 0;
+	u16 asoc_id = 0;
 
 	asoc_id  = data[4];
 	asoc_id |= (data[5] << 8);
@@ -699,9 +699,9 @@ _fail_:
 	return s32Error;
 }
 
-u8 *get_tim_elm(u8 *pu8msa, WILC_Uint16 u16RxLen, WILC_Uint16 u16TagParamOffset)
+u8 *get_tim_elm(u8 *pu8msa, u16 u16RxLen, u16 u16TagParamOffset)
 {
-	WILC_Uint16 u16index = 0;
+	u16 u16index = 0;
 
 	/*************************************************************************/
 	/*                       Beacon Frame - Frame Body                       */
@@ -729,9 +729,9 @@ u8 *get_tim_elm(u8 *pu8msa, WILC_Uint16 u16RxLen, WILC_Uint16 u16TagParamOffset)
 
 /* This function gets the current channel information from
  * the 802.11n beacon/probe response frame */
-u8 get_current_channel_802_11n(u8 *pu8msa, WILC_Uint16 u16RxLen)
+u8 get_current_channel_802_11n(u8 *pu8msa, u16 u16RxLen)
 {
-	WILC_Uint16 index;
+	u16 index;
 
 	index = TAG_PARAM_OFFSET;
 	while (index < (u16RxLen - FCS_LEN)) {
@@ -748,7 +748,7 @@ u8 get_current_channel_802_11n(u8 *pu8msa, WILC_Uint16 u16RxLen)
 	return 0;  /* no MIB here */
 }
 
-u8 get_current_channel(u8 *pu8msa, WILC_Uint16 u16RxLen)
+u8 get_current_channel(u8 *pu8msa, u16 u16RxLen)
 {
 #ifdef PHY_802_11n
 #ifdef FIVE_GHZ_BAND
@@ -782,10 +782,10 @@ WILC_Sint32 ParseNetworkInfo(u8 *pu8MsgBuffer, tstrNetworkInfo **ppstrNetworkInf
 	tstrNetworkInfo *pstrNetworkInfo = WILC_NULL;
 	u8 u8MsgType = 0;
 	u8 u8MsgID = 0;
-	WILC_Uint16 u16MsgLen = 0;
+	u16 u16MsgLen = 0;
 
-	WILC_Uint16 u16WidID = (WILC_Uint16)WID_NIL;
-	WILC_Uint16 u16WidLen  = 0;
+	u16 u16WidID = (u16)WID_NIL;
+	u16 u16WidLen  = 0;
 	u8  *pu8WidVal = 0;
 
 	u8MsgType = pu8MsgBuffer[0];
@@ -814,10 +814,10 @@ WILC_Sint32 ParseNetworkInfo(u8 *pu8MsgBuffer, tstrNetworkInfo **ppstrNetworkInf
 	/* parse the WID value of the WID "WID_NEWORK_INFO" */
 	{
 		u8  *pu8msa = 0;
-		WILC_Uint16 u16RxLen = 0;
+		u16 u16RxLen = 0;
 		u8 *pu8TimElm = 0;
 		u8 *pu8IEs = 0;
-		WILC_Uint16 u16IEsLen = 0;
+		u16 u16IEsLen = 0;
 		u8 u8index = 0;
 		WILC_Uint32 u32Tsf_Lo;
 		WILC_Uint32 u32Tsf_Hi;
@@ -936,15 +936,15 @@ WILC_Sint32 ParseAssocRespInfo(u8 *pu8Buffer, WILC_Uint32 u32BufferLen,
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrConnectRespInfo *pstrConnectRespInfo = WILC_NULL;
-	WILC_Uint16 u16AssocRespLen = 0;
+	u16 u16AssocRespLen = 0;
 	u8 *pu8IEs = 0;
-	WILC_Uint16 u16IEsLen = 0;
+	u16 u16IEsLen = 0;
 
 	pstrConnectRespInfo = (tstrConnectRespInfo *)WILC_MALLOC(sizeof(tstrConnectRespInfo));
 	WILC_memset((void *)(pstrConnectRespInfo), 0, sizeof(tstrConnectRespInfo));
 
 	/* u16AssocRespLen = pu8Buffer[0]; */
-	u16AssocRespLen = (WILC_Uint16)u32BufferLen;
+	u16AssocRespLen = (u16)u32BufferLen;
 
 	/* get the status code */
 	pstrConnectRespInfo->u16ConnectStatus = get_asoc_status(pu8Buffer);
@@ -1160,8 +1160,8 @@ void ProcessCharWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 void ProcessShortWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 		     tstrWID *pstrWID, WILC_Sint8 *ps8WidVal)
 {
-	WILC_Uint16 *pu16val = (WILC_Uint16 *)ps8WidVal;
-	WILC_Uint16 u16val = 0;
+	u16 *pu16val = (u16 *)ps8WidVal;
+	u16 u16val = 0;
 	WILC_Sint32 s32PktLen = *ps32PktLen;
 	if (pstrWID = NULL) {
 		PRINT_WRN(CORECONFIG_DBG, "Can't set SHORT val 0x%x ,NULL structure\n", u16val);
@@ -1176,7 +1176,7 @@ void ProcessShortWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 		u16val = *pu16val;
 
 		/* Length */
-		pcPacket[s32PktLen++] = sizeof(WILC_Uint16);
+		pcPacket[s32PktLen++] = sizeof(u16);
 
 		/* Value */
 		pcPacket[s32PktLen++] = (u8)(u16val & 0xFF);
@@ -1331,8 +1331,8 @@ void ProcessIPwid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 void ProcessStrWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 		   tstrWID *pstrWID, u8 *pu8val, WILC_Sint32 s32ValueSize)
 {
-	WILC_Uint16 u16MsgLen = 0;
-	WILC_Uint16 idx    = 0;
+	u16 u16MsgLen = 0;
+	u16 idx    = 0;
 	WILC_Sint32 s32PktLen = *ps32PktLen;
 	if (pstrWID = NULL) {
 		PRINT_WRN(CORECONFIG_DBG, "Can't set STR val, NULL structure\n");
@@ -1346,7 +1346,7 @@ void ProcessStrWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 	if (g_oper_mode = SET_CFG) {
 		/* Message Length */
 		/* u16MsgLen = WILC_strlen(pu8val); */
-		u16MsgLen = (WILC_Uint16)s32ValueSize;
+		u16MsgLen = (u16)s32ValueSize;
 
 		/* Length */
 		pcPacket[s32PktLen++] = (u8)u16MsgLen;
@@ -1388,7 +1388,7 @@ void ProcessStrWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 void ProcessAdrWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 		   tstrWID *pstrWID, u8 *pu8val)
 {
-	WILC_Uint16 u16MsgLen = 0;
+	u16 u16MsgLen = 0;
 	WILC_Sint32 s32PktLen = *ps32PktLen;
 
 	if (pstrWID = NULL) {
@@ -1454,8 +1454,8 @@ void ProcessBinWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 {
 	/* WILC_ERROR("processing Binary WIDs is not supported \n"); */
 
-	WILC_Uint16 u16MsgLen = 0;
-	WILC_Uint16 idx    = 0;
+	u16 u16MsgLen = 0;
+	u16 idx    = 0;
 	WILC_Sint32 s32PktLen = *ps32PktLen;
 	u8 u8checksum = 0;
 
@@ -1470,7 +1470,7 @@ void ProcessBinWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 
 	if (g_oper_mode = SET_CFG) {
 		/* Message Length */
-		u16MsgLen = (WILC_Uint16)s32ValueSize;
+		u16MsgLen = (u16)s32ValueSize;
 
 		/* Length */
 		/* pcPacket[s32PktLen++] = (u8)u16MsgLen; */
@@ -1525,8 +1525,8 @@ void ProcessBinWid(WILC_Char *pcPacket, WILC_Sint32 *ps32PktLen,
 /*****************************************************************************/
 
 WILC_Sint32 further_process_response(u8 *resp,
-				     WILC_Uint16 u16WIDid,
-				     WILC_Uint16 cfg_len,
+				     u16 u16WIDid,
+				     u16 cfg_len,
 				     WILC_Bool process_wid_num,
 				     WILC_Uint32 cnt,
 				     tstrWID *pstrWIDresult)
@@ -1534,7 +1534,7 @@ WILC_Sint32 further_process_response(u8 *resp,
 	WILC_Uint32 retval = 0;
 	WILC_Uint32 idx = 0;
 	u8 cfg_chr  = 0;
-	WILC_Uint16 cfg_sht  = 0;
+	u16 cfg_sht  = 0;
 	WILC_Uint32 cfg_int  = 0;
 	u8 cfg_str[256] = {0};
 	tenuWIDtype enuWIDtype = WID_UNDEF;
@@ -1555,7 +1555,7 @@ WILC_Sint32 further_process_response(u8 *resp,
 
 	case WID_SHORT:
 	{
-		WILC_Uint16 *pu16val = (WILC_Uint16 *)(pstrWIDresult->ps8WidVal);
+		u16 *pu16val = (u16 *)(pstrWIDresult->ps8WidVal);
 		cfg_sht = MAKE_WORD16(resp[idx], resp[idx + 1]);
 		/*Set local copy of WID*/
 		/* pstrWIDresult->ps8WidVal = (WILC_Sint8*)(WILC_Sint32)cfg_sht; */
@@ -1696,9 +1696,9 @@ WILC_Sint32 further_process_response(u8 *resp,
 
 WILC_Sint32 ParseResponse(u8 *resp, tstrWID *pstrWIDcfgResult)
 {
-	WILC_Uint16 u16RespLen = 0;
-	WILC_Uint16 u16WIDid  = 0;
-	WILC_Uint16 cfg_len  = 0;
+	u16 u16RespLen = 0;
+	u16 u16WIDid  = 0;
+	u16 cfg_len  = 0;
 	tenuWIDtype enuWIDtype = WID_UNDEF;
 	WILC_Bool num_wid_processed = WILC_FALSE;
 	WILC_Uint32 cnt = 0;
@@ -1720,7 +1720,7 @@ WILC_Sint32 ParseResponse(u8 *resp, tstrWID *pstrWIDcfgResult)
 		/* Incase of Bin Type Wid, the length is given by two byte field      */
 		enuWIDtype = get_wid_type(u16WIDid);
 		if (WID_BIN_DATA = enuWIDtype) {
-			cfg_len |= ((WILC_Uint16)resp[idx + 3] << 8) & 0xFF00;
+			cfg_len |= ((u16)resp[idx + 3] << 8) & 0xFF00;
 			idx++;
 		}
 		idx += 3;
@@ -1770,8 +1770,8 @@ WILC_Sint32 ParseResponse(u8 *resp, tstrWID *pstrWIDcfgResult)
 WILC_Sint32 ParseWriteResponse(u8 *pu8RespBuffer)
 {
 	WILC_Sint32 s32Error = WILC_FAIL;
-	WILC_Uint16 u16RespLen   = 0;
-	WILC_Uint16 u16WIDtype = (WILC_Uint16)WID_NIL;
+	u16 u16RespLen   = 0;
+	u16 u16WIDtype = (u16)WID_NIL;
 
 	/* Check whether the received frame is a valid response */
 	if (RESP_MSG_TYPE != pu8RespBuffer[0]) {
@@ -1813,8 +1813,8 @@ WILC_Sint32 ParseWriteResponse(u8 *pu8RespBuffer)
 WILC_Sint32 CreatePacketHeader(WILC_Char *pcpacket, WILC_Sint32 *ps32PacketLength)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
-	WILC_Uint16 u16MsgLen = (WILC_Uint16)(*ps32PacketLength);
-	WILC_Uint16 u16MsgInd = 0;
+	u16 u16MsgLen = (u16)(*ps32PacketLength);
+	u16 u16MsgInd = 0;
 
 	/* The format of the message is:                                         */
 	/* +-------------------------------------------------------------------+ */
diff --git a/drivers/staging/wilc1000/coreconfigurator.h b/drivers/staging/wilc1000/coreconfigurator.h
index 73cdbef..9644d61 100644
--- a/drivers/staging/wilc1000/coreconfigurator.h
+++ b/drivers/staging/wilc1000/coreconfigurator.h
@@ -31,7 +31,7 @@
 #define NUM_11N_HUT_SWITCHES    0
 #endif /* MAC_802_11N */
 
-extern WILC_Uint16 g_num_total_switches;
+extern u16 g_num_total_switches;
 
 #define MAC_HDR_LEN             24          /* No Address4 - non-ESS         */
 #define MAX_SSID_LEN            33
@@ -65,7 +65,7 @@ extern WILC_Uint16 g_num_total_switches;
 /*****************************************************************************/
 /* Function Macros                                                           */
 /*****************************************************************************/
-#define MAKE_WORD16(lsb, msb) ((((WILC_Uint16)(msb) << 8) & 0xFF00) | (lsb))
+#define MAKE_WORD16(lsb, msb) ((((u16)(msb) << 8) & 0xFF00) | (lsb))
 #define MAKE_WORD32(lsw, msw) ((((WILC_Uint32)(msw) << 16) & 0xFFFF0000) | (lsw))
 
 
@@ -394,7 +394,7 @@ typedef enum {
 } tenuConnectSts;
 
 typedef struct {
-	WILC_Uint16 u16WIDid;
+	u16 u16WIDid;
 	tenuWIDtype enuWIDtype;
 	WILC_Sint32 s32ValueSize;
 	WILC_Sint8      *ps8WidVal;
@@ -409,11 +409,11 @@ typedef struct {
 /* This structure is used to support parsing of the received 'N' message */
 typedef struct {
 	WILC_Sint8 s8rssi;
-	WILC_Uint16 u16CapInfo;
+	u16 u16CapInfo;
 	u8 au8ssid[MAX_SSID_LEN];
 	u8 u8SsidLen;
 	u8 au8bssid[6];
-	WILC_Uint16 u16BeaconPeriod;
+	u16 u16BeaconPeriod;
 	u8 u8DtimPeriod;
 	u8 u8channel;
 	unsigned long u32TimeRcvdInScanCached; /* of type unsigned long to be accepted by the linux kernel macro time_after() */
@@ -426,7 +426,7 @@ typedef struct {
 	WILC_Uint32 u32Tsf; /* time-stamp [Low only 32 bit] */
 #endif
 	u8 *pu8IEs;
-	WILC_Uint16 u16IEsLen;
+	u16 u16IEsLen;
 	void *pJoinParams;
 	tstrRSSI strRssi;
 	WILC_Uint64 u64Tsf; /* time-stamp [Low and High 64 bit] */
@@ -434,11 +434,11 @@ typedef struct {
 
 /* This structure is used to support parsing of the received Association Response frame */
 typedef struct {
-	WILC_Uint16 u16capability;
-	WILC_Uint16 u16ConnectStatus;
-	WILC_Uint16 u16AssocID;
+	u16 u16capability;
+	u16 u16ConnectStatus;
+	u16 u16AssocID;
 	u8 *pu8RespIEs;
-	WILC_Uint16 u16RespIEsLen;
+	u16 u16RespIEsLen;
 } tstrConnectRespInfo;
 
 
@@ -447,14 +447,14 @@ typedef struct {
 	u8 *pu8ReqIEs;
 	size_t ReqIEsLen;
 	u8 *pu8RespIEs;
-	WILC_Uint16 u16RespIEsLen;
-	WILC_Uint16 u16ConnectStatus;
+	u16 u16RespIEsLen;
+	u16 u16ConnectStatus;
 } tstrConnectInfo;
 
 
 
 typedef struct {
-	WILC_Uint16 u16reason;
+	u16 u16reason;
 	u8 *ie;
 	size_t ie_len;
 } tstrDisconnectNotifInfo;
diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 8973d24..74045c3 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -19,46 +19,46 @@ extern u8 g_wilc_initialized;
 /*****************************************************************************/
 
 /* Message types of the Host IF Message Queue*/
-#define HOST_IF_MSG_SCAN					((WILC_Uint16)0)
-#define HOST_IF_MSG_CONNECT					((WILC_Uint16)1)
-#define HOST_IF_MSG_RCVD_GNRL_ASYNC_INFO	((WILC_Uint16)2)
-#define HOST_IF_MSG_KEY						((WILC_Uint16)3)
-#define HOST_IF_MSG_RCVD_NTWRK_INFO			((WILC_Uint16)4)
-#define HOST_IF_MSG_RCVD_SCAN_COMPLETE		((WILC_Uint16)5)
-#define HOST_IF_MSG_CFG_PARAMS				((WILC_Uint16)6)
-#define HOST_IF_MSG_SET_CHANNEL				((WILC_Uint16)7)
-#define HOST_IF_MSG_DISCONNECT				((WILC_Uint16)8)
-#define HOST_IF_MSG_GET_RSSI				((WILC_Uint16)9)
-#define HOST_IF_MSG_GET_CHNL				((WILC_Uint16)10)
-#define HOST_IF_MSG_ADD_BEACON				((WILC_Uint16)11)
-#define HOST_IF_MSG_DEL_BEACON				((WILC_Uint16)12)
-#define HOST_IF_MSG_ADD_STATION				((WILC_Uint16)13)
-#define HOST_IF_MSG_DEL_STATION				((WILC_Uint16)14)
-#define HOST_IF_MSG_EDIT_STATION			((WILC_Uint16)15)
-#define HOST_IF_MSG_SCAN_TIMER_FIRED			((WILC_Uint16)16)
-#define HOST_IF_MSG_CONNECT_TIMER_FIRED		((WILC_Uint16)17)
-#define HOST_IF_MSG_POWER_MGMT				((WILC_Uint16)18)
-#define HOST_IF_MSG_GET_INACTIVETIME			((WILC_Uint16)19)
-#define HOST_IF_MSG_REMAIN_ON_CHAN			((WILC_Uint16)20)
-#define  HOST_IF_MSG_REGISTER_FRAME			((WILC_Uint16)21)
-#define HOST_IF_MSG_LISTEN_TIMER_FIRED     ((WILC_Uint16)22)
-#define HOST_IF_MSG_GET_LINKSPEED				((WILC_Uint16)23)
-#define HOST_IF_MSG_SET_WFIDRV_HANDLER		((WILC_Uint16)24)
-#define HOST_IF_MSG_SET_MAC_ADDRESS		((WILC_Uint16)25)
-#define HOST_IF_MSG_GET_MAC_ADDRESS		((WILC_Uint16)26)
-#define HOST_IF_MSG_SET_OPERATION_MODE		((WILC_Uint16)27)
-#define HOST_IF_MSG_SET_IPADDRESS			((WILC_Uint16)28)
-#define HOST_IF_MSG_GET_IPADDRESS			((WILC_Uint16)29)
-#define HOST_IF_MSG_FLUSH_CONNECT			((WILC_Uint16)30)
-#define HOST_IF_MSG_GET_STATISTICS				((WILC_Uint16)31)
-#define HOST_IF_MSG_SET_MULTICAST_FILTER		((WILC_Uint16)32)
-#define HOST_IF_MSG_ADD_BA_SESSION		((WILC_Uint16)33)
-#define HOST_IF_MSG_DEL_BA_SESSION		((WILC_Uint16)34)
-#define HOST_IF_MSG_Q_IDLE		((WILC_Uint16)35)
-#define HOST_IF_MSG_DEL_ALL_STA  ((WILC_Uint16)36)
-#define HOST_IF_MSG_DEL_ALL_RX_BA_SESSIONS		((WILC_Uint16)34)
-
-#define HOST_IF_MSG_EXIT					((WILC_Uint16)100)
+#define HOST_IF_MSG_SCAN					((u16)0)
+#define HOST_IF_MSG_CONNECT					((u16)1)
+#define HOST_IF_MSG_RCVD_GNRL_ASYNC_INFO	((u16)2)
+#define HOST_IF_MSG_KEY						((u16)3)
+#define HOST_IF_MSG_RCVD_NTWRK_INFO			((u16)4)
+#define HOST_IF_MSG_RCVD_SCAN_COMPLETE		((u16)5)
+#define HOST_IF_MSG_CFG_PARAMS				((u16)6)
+#define HOST_IF_MSG_SET_CHANNEL				((u16)7)
+#define HOST_IF_MSG_DISCONNECT				((u16)8)
+#define HOST_IF_MSG_GET_RSSI				((u16)9)
+#define HOST_IF_MSG_GET_CHNL				((u16)10)
+#define HOST_IF_MSG_ADD_BEACON				((u16)11)
+#define HOST_IF_MSG_DEL_BEACON				((u16)12)
+#define HOST_IF_MSG_ADD_STATION				((u16)13)
+#define HOST_IF_MSG_DEL_STATION				((u16)14)
+#define HOST_IF_MSG_EDIT_STATION			((u16)15)
+#define HOST_IF_MSG_SCAN_TIMER_FIRED			((u16)16)
+#define HOST_IF_MSG_CONNECT_TIMER_FIRED		((u16)17)
+#define HOST_IF_MSG_POWER_MGMT				((u16)18)
+#define HOST_IF_MSG_GET_INACTIVETIME			((u16)19)
+#define HOST_IF_MSG_REMAIN_ON_CHAN			((u16)20)
+#define  HOST_IF_MSG_REGISTER_FRAME			((u16)21)
+#define HOST_IF_MSG_LISTEN_TIMER_FIRED     ((u16)22)
+#define HOST_IF_MSG_GET_LINKSPEED				((u16)23)
+#define HOST_IF_MSG_SET_WFIDRV_HANDLER		((u16)24)
+#define HOST_IF_MSG_SET_MAC_ADDRESS		((u16)25)
+#define HOST_IF_MSG_GET_MAC_ADDRESS		((u16)26)
+#define HOST_IF_MSG_SET_OPERATION_MODE		((u16)27)
+#define HOST_IF_MSG_SET_IPADDRESS			((u16)28)
+#define HOST_IF_MSG_GET_IPADDRESS			((u16)29)
+#define HOST_IF_MSG_FLUSH_CONNECT			((u16)30)
+#define HOST_IF_MSG_GET_STATISTICS				((u16)31)
+#define HOST_IF_MSG_SET_MULTICAST_FILTER		((u16)32)
+#define HOST_IF_MSG_ADD_BA_SESSION		((u16)33)
+#define HOST_IF_MSG_DEL_BA_SESSION		((u16)34)
+#define HOST_IF_MSG_Q_IDLE		((u16)35)
+#define HOST_IF_MSG_DEL_ALL_STA  ((u16)36)
+#define HOST_IF_MSG_DEL_ALL_RX_BA_SESSIONS		((u16)34)
+
+#define HOST_IF_MSG_EXIT					((u16)100)
 
 #define HOST_IF_SCAN_TIMEOUT		4000
 #define HOST_IF_CONNECT_TIMEOUT	9500
@@ -468,7 +468,7 @@ typedef union _tuniHostIFmsgBody {
  *  @version		1.0
  */
 typedef struct _tstrHostIFmsg {
-	WILC_Uint16 u16MsgId;                                           /*!< Message ID */
+	u16 u16MsgId;                                           /*!< Message ID */
 	tuniHostIFmsgBody uniHostIFmsgBody;             /*!< Message body */
 	void *drvHandler;
 } tstrHostIFmsg;
@@ -487,8 +487,8 @@ typedef struct _tstrWidJoinReqExt {
 typedef struct _tstrJoinBssParam {
 	BSSTYPE_T bss_type;
 	u8 dtim_period;
-	WILC_Uint16 beacon_period;
-	WILC_Uint16 cap_info;
+	u16 beacon_period;
+	u16 cap_info;
 	u8 au8bssid[6];
 	WILC_Char ssid[MAX_SSID_LEN];
 	u8 ssidLen;
@@ -615,7 +615,7 @@ static WILC_Sint32 Handle_SetChannel(void *drvHandler, tstrHostIFSetChan *pstrHo
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_CURRENT_CHANNEL;
+	strWID.u16WIDid = (u16)WID_CURRENT_CHANNEL;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = (WILC_Char *)&(pstrHostIFSetChan->u8SetChan);
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -652,7 +652,7 @@ static WILC_Sint32 Handle_SetWfiDrvHandler(tstrHostIfSetDrvHandler *pstrHostIfSe
 
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_SET_DRV_HANDLER;
+	strWID.u16WIDid = (u16)WID_SET_DRV_HANDLER;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)&(pstrHostIfSetDrvHandler->u32Address);
 	strWID.s32ValueSize = sizeof(WILC_Uint32);
@@ -697,7 +697,7 @@ static WILC_Sint32 Handle_SetOperationMode(void *drvHandler, tstrHostIfSetOperat
 
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_SET_OPERATION_MODE;
+	strWID.u16WIDid = (u16)WID_SET_OPERATION_MODE;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)&(pstrHostIfSetOperationMode->u32Mode);
 	strWID.s32ValueSize = sizeof(WILC_Uint32);
@@ -750,7 +750,7 @@ WILC_Sint32 Handle_set_IPAddress(void *drvHandler, u8 *pu8IPAddr, u8 idx)
 	WILC_memcpy(gs8SetIP[idx], pu8IPAddr, IP_ALEN);
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_IP_ADDRESS;
+	strWID.u16WIDid = (u16)WID_IP_ADDRESS;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = (u8 *)pu8IPAddr;
 	strWID.s32ValueSize = IP_ALEN;
@@ -794,7 +794,7 @@ WILC_Sint32 Handle_get_IPAddress(void *drvHandler, u8 *pu8IPAddr, u8 idx)
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_IP_ADDRESS;
+	strWID.u16WIDid = (u16)WID_IP_ADDRESS;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = (u8 *)WILC_MALLOC(IP_ALEN);
 	strWID.s32ValueSize = IP_ALEN;
@@ -853,7 +853,7 @@ static WILC_Sint32 Handle_SetMacAddress(void *drvHandler, tstrHostIfSetMacAddres
 	WILC_memcpy(mac_buf, pstrHostIfSetMacAddress->u8MacAddress, ETH_ALEN);
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_MAC_ADDR;
+	strWID.u16WIDid = (u16)WID_MAC_ADDR;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = mac_buf;
 	strWID.s32ValueSize = ETH_ALEN;
@@ -891,7 +891,7 @@ static WILC_Sint32 Handle_GetMacAddress(void *drvHandler, tstrHostIfGetMacAddres
 	tstrWID	strWID;
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_MAC_ADDR;
+	strWID.u16WIDid = (u16)WID_MAC_ADDR;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = pstrHostIfGetMacAddress->u8MacAddress;
 	strWID.s32ValueSize = ETH_ALEN;
@@ -976,7 +976,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_AUTH_TIMEOUT;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.auth_timeout;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.auth_timeout = strHostIFCfgParamAttr->pstrCfgParamVal.auth_timeout;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1008,7 +1008,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_SHORT_RETRY_LIMIT;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.short_retry_limit;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.short_retry_limit = strHostIFCfgParamAttr->pstrCfgParamVal.short_retry_limit;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1022,7 +1022,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.long_retry_limit;
 
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.long_retry_limit = strHostIFCfgParamAttr->pstrCfgParamVal.long_retry_limit;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1035,7 +1035,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_FRAG_THRESHOLD;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.frag_threshold;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.frag_threshold = strHostIFCfgParamAttr->pstrCfgParamVal.frag_threshold;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1048,7 +1048,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_RTS_THRESHOLD;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.rts_threshold;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.rts_threshold = strHostIFCfgParamAttr->pstrCfgParamVal.rts_threshold;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1106,7 +1106,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_BEACON_INTERVAL;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.beacon_interval;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.beacon_interval = strHostIFCfgParamAttr->pstrCfgParamVal.beacon_interval;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1149,7 +1149,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_SITE_SURVEY_SCAN_TIME;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_scan_time;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.site_survey_scan_time = strHostIFCfgParamAttr->pstrCfgParamVal.site_survey_scan_time;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1162,7 +1162,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_ACTIVE_SCAN_TIME;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.active_scan_time;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.active_scan_time = strHostIFCfgParamAttr->pstrCfgParamVal.active_scan_time;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1175,7 +1175,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_PASSIVE_SCAN_TIME;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&strHostIFCfgParamAttr->pstrCfgParamVal.passive_scan_time;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.passive_scan_time = strHostIFCfgParamAttr->pstrCfgParamVal.passive_scan_time;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1198,7 +1198,7 @@ static WILC_Sint32 Handle_CfgParam(void *drvHandler, tstrHostIFCfgParamAttr *str
 			strWIDList[u8WidCnt].u16WIDid = WID_CURRENT_TX_RATE;
 			strWIDList[u8WidCnt].ps8WidVal = (WILC_Sint8 *)&curr_tx_rate;
 			strWIDList[u8WidCnt].enuWIDtype = WID_SHORT;
-			strWIDList[u8WidCnt].s32ValueSize = sizeof(WILC_Uint16);
+			strWIDList[u8WidCnt].s32ValueSize = sizeof(u16);
 			pstrWFIDrv->strCfgValues.curr_tx_rate = (u8)curr_tx_rate;
 		} else {
 			WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
@@ -1291,7 +1291,7 @@ static WILC_Sint32 Handle_Scan(void *drvHandler, tstrHostIFscanAttr *pstrHostIFs
 	pstrWFIDrv->strWILC_UsrScanReq.u32RcvdChCount = 0;
 
 	/*BugID_4189*/
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_SSID_PROBE_REQ;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_SSID_PROBE_REQ;
 	strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 
 	for (i = 0; i < pstrHostIFscanAttr->strHiddenNetwork.u8ssidnum; i++) {
@@ -1444,7 +1444,7 @@ static WILC_Sint32 Handle_ScanDone(void *drvHandler, tenuScanEvent enuEvent)
 	if (enuEvent = SCAN_EVENT_ABORTED) {
 		PRINT_D(GENERIC_DBG, "Abort running scan\n");
 		u8abort_running_scan = 1;
-		strWID.u16WIDid	= (WILC_Uint16)WID_ABORT_RUNNING_SCAN;
+		strWID.u16WIDid	= (u16)WID_ABORT_RUNNING_SCAN;
 		strWID.enuWIDtype	= WID_CHAR;
 		strWID.ps8WidVal = (WILC_Sint8 *)&u8abort_running_scan;
 		strWID.s32ValueSize = sizeof(WILC_Char);
@@ -1611,7 +1611,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 			strWIDList[u32WidsCount].s32ValueSize = pstrWFIDrv->strWILC_UsrConnReq.ConnReqIEsLen;
 			u32WidsCount++;
 		}
-		strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_11I_MODE;
+		strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_MODE;
 		strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 		strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
 		strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrWFIDrv->strWILC_UsrConnReq.u8security));
@@ -1619,7 +1619,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 
 		PRINT_INFO(HOSTINF_DBG, "Encrypt Mode = %x\n", pstrWFIDrv->strWILC_UsrConnReq.u8security);
 
-		strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_AUTH_TYPE;
+		strWIDList[u32WidsCount].u16WIDid = (u16)WID_AUTH_TYPE;
 		strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 		strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
 		strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
@@ -1627,14 +1627,14 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 
 		PRINT_INFO(HOSTINF_DBG, "Authentication Type = %x\n", pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
 		/*
-		 * strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_11I_PSK;
+		 * strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_PSK;
 		 * strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 		 * strWIDList[u32WidsCount].s32ValueSize = sizeof(passphrase);
 		 * strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8*)(passphrase);
 		 * u32WidsCount++;
 		 */
 
-		strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_JOIN_REQ;
+		strWIDList[u32WidsCount].u16WIDid = (u16)WID_JOIN_REQ;
 		strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 		strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
 		strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)&u8bssDscListIndex;
@@ -1757,7 +1757,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 			       gu32FlushedInfoElemAsocSize);
 		}
 	}
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_11I_MODE;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_MODE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(pstrWFIDrv->strWILC_UsrConnReq.u8security));
@@ -1770,7 +1770,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 	PRINT_INFO(HOSTINF_DBG, "Encrypt Mode = %x\n", pstrWFIDrv->strWILC_UsrConnReq.u8security);
 
 
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_AUTH_TYPE;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_AUTH_TYPE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
@@ -1782,7 +1782,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 
 	PRINT_INFO(HOSTINF_DBG, "Authentication Type = %x\n", pstrWFIDrv->strWILC_UsrConnReq.tenuAuth_type);
 	/*
-	 * strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_11I_PSK;
+	 * strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_PSK;
 	 * strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 	 * strWIDList[u32WidsCount].s32ValueSize = sizeof(passphrase);
 	 * strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8*)(passphrase);
@@ -1794,7 +1794,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 
 
 #ifndef WILC_PARSE_SCAN_IN_HOST
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_JOIN_REQ_EXTENDED;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_JOIN_REQ_EXTENDED;
 	strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 	strWIDList[u32WidsCount].s32ValueSize = MAX_SSID_LEN + 7;
 	strWIDList[u32WidsCount].ps8WidVal = WILC_MALLOC(strWIDList[u32WidsCount].s32ValueSize);
@@ -1826,7 +1826,7 @@ static WILC_Sint32 Handle_Connect(void *drvHandler, tstrHostIFconnectAttr *pstrH
 
 	#else
 
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_JOIN_REQ_EXTENDED;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_JOIN_REQ_EXTENDED;
 	strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 
 	/*Sending NoA attributes during connection*/
@@ -2092,7 +2092,7 @@ static WILC_Sint32 Handle_FlushConnect(void *drvHandler)
 	strWIDList[u32WidsCount].s32ValueSize = gu32FlushedInfoElemAsocSize;
 	u32WidsCount++;
 
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_11I_MODE;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_11I_MODE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&(gu8Flushed11iMode));
@@ -2100,7 +2100,7 @@ static WILC_Sint32 Handle_FlushConnect(void *drvHandler)
 
 
 
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_AUTH_TYPE;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_AUTH_TYPE;
 	strWIDList[u32WidsCount].enuWIDtype = WID_CHAR;
 	strWIDList[u32WidsCount].s32ValueSize = sizeof(WILC_Char);
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)(&gu8FlushedAuthType);
@@ -2108,7 +2108,7 @@ static WILC_Sint32 Handle_FlushConnect(void *drvHandler)
 
 
 	#ifdef WILC_PARSE_SCAN_IN_HOST
-	strWIDList[u32WidsCount].u16WIDid = (WILC_Uint16)WID_JOIN_REQ_EXTENDED;
+	strWIDList[u32WidsCount].u16WIDid = (u16)WID_JOIN_REQ_EXTENDED;
 	strWIDList[u32WidsCount].enuWIDtype = WID_STR;
 	strWIDList[u32WidsCount].s32ValueSize = gu32FlushedJoinReqSize;
 	strWIDList[u32WidsCount].ps8WidVal = (WILC_Sint8 *)gu8FlushedJoinReq;
@@ -2149,7 +2149,7 @@ static WILC_Sint32 Handle_ConnectTimeout(void *drvHandler)
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrConnectInfo strConnectInfo;
 	tstrWID strWID;
-	WILC_Uint16 u16DummyReasonCode = 0;
+	u16 u16DummyReasonCode = 0;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *) drvHandler;
 
 	if (pstrWFIDrv = NULL)	{
@@ -2199,7 +2199,7 @@ static WILC_Sint32 Handle_ConnectTimeout(void *drvHandler)
 
 	/* Here we will notify our firmware also with the Connection failure {through sending to it Cfg packet carrying
 	 *   WID_DISCONNECT} */
-	strWID.u16WIDid = (WILC_Uint16)WID_DISCONNECT;
+	strWID.u16WIDid = (u16)WID_DISCONNECT;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = (WILC_Sint8 *)&u16DummyReasonCode;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -2382,8 +2382,8 @@ static WILC_Sint32 Handle_RcvdGnrlAsyncInfo(void *drvHandler, tstrRcvdGnrlAsyncI
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	u8 u8MsgType = 0;
 	u8 u8MsgID = 0;
-	WILC_Uint16 u16MsgLen = 0;
-	WILC_Uint16 u16WidID = (WILC_Uint16)WID_NIL;
+	u16 u16MsgLen = 0;
+	u16 u16WidID = (u16)WID_NIL;
 	u8 u8WidLen  = 0;
 	u8 u8MacStatus;
 	u8 u8MacStatusReasonCode;
@@ -2730,7 +2730,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 
 			PRINT_D(HOSTINF_DBG, "Handling WEP key\n");
 			PRINT_D(GENERIC_DBG, "ID Hostint is %d\n", (pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx));
-			strWIDList[0].u16WIDid = (WILC_Uint16)WID_11I_MODE;
+			strWIDList[0].u16WIDid = (u16)WID_11I_MODE;
 			strWIDList[0].enuWIDtype = WID_CHAR;
 			strWIDList[0].s32ValueSize = sizeof(WILC_Char);
 			strWIDList[0].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8mode));
@@ -2740,7 +2740,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			strWIDList[1].s32ValueSize = sizeof(WILC_Char);
 			strWIDList[1].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.tenuAuth_type));
 
-			strWIDList[2].u16WIDid	= (WILC_Uint16)WID_KEY_ID;
+			strWIDList[2].u16WIDid	= (u16)WID_KEY_ID;
 			strWIDList[2].enuWIDtype	= WID_CHAR;
 
 			strWIDList[2].ps8WidVal	= (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx));
@@ -2761,7 +2761,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 
 			WILC_FREE(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.pu8WepKey);
 
-			strWIDList[3].u16WIDid = (WILC_Uint16)WID_WEP_KEY_VALUE;
+			strWIDList[3].u16WIDid = (u16)WID_WEP_KEY_VALUE;
 			strWIDList[3].enuWIDtype = WID_STR;
 			strWIDList[3].s32ValueSize = pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8WepKeylen;
 			strWIDList[3].ps8WidVal = (WILC_Sint8 *)pu8keybuf;
@@ -2790,7 +2790,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 
 			WILC_FREE(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.pu8WepKey);
 
-			strWID.u16WIDid	= (WILC_Uint16)WID_ADD_WEP_KEY;
+			strWID.u16WIDid	= (u16)WID_ADD_WEP_KEY;
 			strWID.enuWIDtype	= WID_STR;
 			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWID.s32ValueSize = pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8WepKeylen + 2;
@@ -2800,7 +2800,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 		} else if (pstrHostIFkeyAttr->u8KeyAction & REMOVEKEY)	  {
 
 			PRINT_D(HOSTINF_DBG, "Removing key\n");
-			strWID.u16WIDid	= (WILC_Uint16)WID_REMOVE_WEP_KEY;
+			strWID.u16WIDid	= (u16)WID_REMOVE_WEP_KEY;
 			strWID.enuWIDtype	= WID_STR;
 
 			s8idxarray[0] = (WILC_Sint8)pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx;
@@ -2809,7 +2809,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 
 			s32Error = SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)pstrWFIDrv);
 		} else {
-			strWID.u16WIDid	= (WILC_Uint16)WID_KEY_ID;
+			strWID.u16WIDid	= (u16)WID_KEY_ID;
 			strWID.enuWIDtype	= WID_CHAR;
 			strWID.ps8WidVal	= (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwepAttr.u8Wepidx));
 			strWID.s32ValueSize = sizeof(WILC_Char);
@@ -2852,12 +2852,12 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			WILC_memcpy(pu8keybuf + 16, pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.pu8key,
 				    pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Keylen);
 			/* pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Ciphermode =  0X51; */
-			strWIDList[0].u16WIDid = (WILC_Uint16)WID_11I_MODE;
+			strWIDList[0].u16WIDid = (u16)WID_11I_MODE;
 			strWIDList[0].enuWIDtype = WID_CHAR;
 			strWIDList[0].s32ValueSize = sizeof(WILC_Char);
 			strWIDList[0].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Ciphermode));
 
-			strWIDList[1].u16WIDid	= (WILC_Uint16)WID_ADD_RX_GTK;
+			strWIDList[1].u16WIDid	= (u16)WID_ADD_RX_GTK;
 			strWIDList[1].enuWIDtype	= WID_STR;
 			strWIDList[1].ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWIDList[1].s32ValueSize = RX_MIC_KEY_MSG_LEN;
@@ -2904,7 +2904,7 @@ static int Handle_Key(void *drvHandler, tstrHostIFkeyAttr *pstrHostIFkeyAttr)
 			WILC_memcpy(pu8keybuf + 16, pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.pu8key,
 				    pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Keylen);
 
-			strWID.u16WIDid	= (WILC_Uint16)WID_ADD_RX_GTK;
+			strWID.u16WIDid	= (u16)WID_ADD_RX_GTK;
 			strWID.enuWIDtype	= WID_STR;
 			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWID.s32ValueSize = RX_MIC_KEY_MSG_LEN;
@@ -2956,12 +2956,12 @@ _WPARxGtk_end_case_:
 				    pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Keylen);
 
 
-			strWIDList[0].u16WIDid = (WILC_Uint16)WID_11I_MODE;
+			strWIDList[0].u16WIDid = (u16)WID_11I_MODE;
 			strWIDList[0].enuWIDtype = WID_CHAR;
 			strWIDList[0].s32ValueSize = sizeof(WILC_Char);
 			strWIDList[0].ps8WidVal = (WILC_Sint8 *)(&(pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Ciphermode));
 
-			strWIDList[1].u16WIDid	= (WILC_Uint16)WID_ADD_PTK;
+			strWIDList[1].u16WIDid	= (u16)WID_ADD_PTK;
 			strWIDList[1].enuWIDtype	= WID_STR;
 			strWIDList[1].ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWIDList[1].s32ValueSize = PTK_KEY_MSG_LEN + 1;
@@ -3002,7 +3002,7 @@ _WPARxGtk_end_case_:
 				    pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFwpaAttr.u8Keylen);
 
 
-			strWID.u16WIDid	= (WILC_Uint16)WID_ADD_PTK;
+			strWID.u16WIDid	= (u16)WID_ADD_PTK;
 			strWID.enuWIDtype	= WID_STR;
 			strWID.ps8WidVal	= (WILC_Sint8 *)pu8keybuf;
 			strWID.s32ValueSize = PTK_KEY_MSG_LEN;
@@ -3041,7 +3041,7 @@ _WPAPtk_end_case_:
 			WILC_memcpy(pu8keybuf + ((PMKSA_KEY_LEN * i) + ETH_ALEN + 1), pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFpmkidAttr.pmkidlist[i].pmkid, PMKID_LEN);
 		}
 
-		strWID.u16WIDid	= (WILC_Uint16)WID_PMKID_INFO;
+		strWID.u16WIDid	= (u16)WID_PMKID_INFO;
 		strWID.enuWIDtype = WID_STR;
 		strWID.ps8WidVal = (WILC_Sint8 *)pu8keybuf;
 		strWID.s32ValueSize = (pstrHostIFkeyAttr->uniHostIFkeyAttr.strHostIFpmkidAttr.numpmkid * PMKSA_KEY_LEN) + 1;
@@ -3074,11 +3074,11 @@ static void Handle_Disconnect(void *drvHandler)
 	tstrWID strWID;
 
 	WILC_Sint32 s32Error = WILC_SUCCESS;
-	WILC_Uint16 u16DummyReasonCode = 0;
+	u16 u16DummyReasonCode = 0;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
 
-	strWID.u16WIDid = (WILC_Uint16)WID_DISCONNECT;
+	strWID.u16WIDid = (u16)WID_DISCONNECT;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = (WILC_Sint8 *)&u16DummyReasonCode;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -3203,7 +3203,7 @@ static WILC_Sint32 Switch_Log_Terminal(void *drvHandler)
 	static char dummy = 9;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
-	strWID.u16WIDid = (WILC_Uint16)WID_LOGTerminal_Switch;
+	strWID.u16WIDid = (u16)WID_LOGTerminal_Switch;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = &dummy;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -3245,7 +3245,7 @@ static WILC_Sint32 Handle_GetChnl(void *drvHandler)
 	tstrWID	strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
-	strWID.u16WIDid = (WILC_Uint16)WID_CURRENT_CHANNEL;
+	strWID.u16WIDid = (u16)WID_CURRENT_CHANNEL;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = (WILC_Sint8 *)&gu8Chnl;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -3288,7 +3288,7 @@ static void Handle_GetRssi(void *drvHandler)
 	tstrWID strWID;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
-	strWID.u16WIDid = (WILC_Uint16)WID_RSSI;
+	strWID.u16WIDid = (u16)WID_RSSI;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = &gs8Rssi;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -3320,7 +3320,7 @@ static void Handle_GetLinkspeed(void *drvHandler)
 
 	gs8lnkspd = 0;
 
-	strWID.u16WIDid = (WILC_Uint16)WID_LINKSPEED;
+	strWID.u16WIDid = (u16)WID_LINKSPEED;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = &gs8lnkspd;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -3412,7 +3412,7 @@ static WILC_Sint32 Handle_Get_InActiveTime(void *drvHandler, tstrHostIfStaInacti
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
 
-	strWID.u16WIDid = (WILC_Uint16)WID_SET_STA_MAC_INACTIVE_TIME;
+	strWID.u16WIDid = (u16)WID_SET_STA_MAC_INACTIVE_TIME;
 	strWID.enuWIDtype = WID_STR;
 	strWID.s32ValueSize = ETH_ALEN;
 	strWID.ps8WidVal = (u8 *)WILC_MALLOC(strWID.s32ValueSize);
@@ -3433,7 +3433,7 @@ static WILC_Sint32 Handle_Get_InActiveTime(void *drvHandler, tstrHostIfStaInacti
 	}
 
 
-	strWID.u16WIDid = (WILC_Uint16)WID_GET_INACTIVE_TIME;
+	strWID.u16WIDid = (u16)WID_GET_INACTIVE_TIME;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)&gu32InactiveTime;
 	strWID.s32ValueSize = sizeof(WILC_Uint32);
@@ -3480,7 +3480,7 @@ static void Handle_AddBeacon(void *drvHandler, tstrHostIFSetBeacon *pstrSetBeaco
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 	PRINT_D(HOSTINF_DBG, "Adding BEACON\n");
 
-	strWID.u16WIDid = (WILC_Uint16)WID_ADD_BEACON;
+	strWID.u16WIDid = (u16)WID_ADD_BEACON;
 	strWID.enuWIDtype = WID_BIN;
 	strWID.s32ValueSize = pstrSetBeaconParam->u32HeadLen + pstrSetBeaconParam->u32TailLen + 16;
 	strWID.ps8WidVal = WILC_MALLOC(strWID.s32ValueSize);
@@ -3550,7 +3550,7 @@ static void Handle_DelBeacon(void *drvHandler, tstrHostIFDelBeacon *pstrDelBeaco
 	tstrWID strWID;
 	u8 *pu8CurrByte;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
-	strWID.u16WIDid = (WILC_Uint16)WID_DEL_BEACON;
+	strWID.u16WIDid = (u16)WID_DEL_BEACON;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.s32ValueSize = sizeof(WILC_Char);
 	strWID.ps8WidVal = &gu8DelBcn;
@@ -3649,7 +3649,7 @@ static void Handle_AddStation(void *drvHandler, tstrWILC_AddStaParam *pstrStatio
 	u8 *pu8CurrByte;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 	PRINT_D(HOSTINF_DBG, "Handling add station\n");
-	strWID.u16WIDid = (WILC_Uint16)WID_ADD_STA;
+	strWID.u16WIDid = (u16)WID_ADD_STA;
 	strWID.enuWIDtype = WID_BIN;
 	strWID.s32ValueSize = WILC_ADD_STA_LENGTH + pstrStationParam->u8NumRates;
 
@@ -3693,7 +3693,7 @@ static void Handle_DelAllSta(void *drvHandler, tstrHostIFDelAllSta *pstrDelAllSt
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 	u8 i;
 	UWORD8 au8Zero_Buff[6] = {0};
-	strWID.u16WIDid = (WILC_Uint16)WID_DEL_ALL_STA;
+	strWID.u16WIDid = (u16)WID_DEL_ALL_STA;
 	strWID.enuWIDtype = WID_STR;
 	strWID.s32ValueSize = (pstrDelAllStaParam->u8Num_AssocSta * ETH_ALEN) + 1;
 
@@ -3750,7 +3750,7 @@ static void Handle_DelStation(void *drvHandler, tstrHostIFDelSta *pstrDelStaPara
 	u8 *pu8CurrByte;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
-	strWID.u16WIDid = (WILC_Uint16)WID_REMOVE_STA;
+	strWID.u16WIDid = (u16)WID_REMOVE_STA;
 	strWID.enuWIDtype = WID_BIN;
 	strWID.s32ValueSize = ETH_ALEN;
 
@@ -3796,7 +3796,7 @@ static void Handle_EditStation(void *drvHandler, tstrWILC_AddStaParam *pstrStati
 	u8 *pu8CurrByte;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 
-	strWID.u16WIDid = (WILC_Uint16)WID_EDIT_STA;
+	strWID.u16WIDid = (u16)WID_EDIT_STA;
 	strWID.enuWIDtype = WID_BIN;
 	strWID.s32ValueSize = WILC_ADD_STA_LENGTH + pstrStationParam->u8NumRates;
 
@@ -3874,7 +3874,7 @@ static int Handle_RemainOnChan(void *drvHandler, tstrHostIfRemainOnChan *pstrHos
 	PRINT_D(HOSTINF_DBG, "Setting channel :%d\n", pstrHostIfRemainOnChan->u16Channel);
 
 	u8remain_on_chan_flag = WILC_TRUE;
-	strWID.u16WIDid	= (WILC_Uint16)WID_REMAIN_ON_CHAN;
+	strWID.u16WIDid	= (u16)WID_REMAIN_ON_CHAN;
 	strWID.enuWIDtype	= WID_STR;
 	strWID.s32ValueSize = 2;
 	strWID.ps8WidVal = (WILC_Sint8 *)WILC_MALLOC(strWID.s32ValueSize);
@@ -3927,9 +3927,9 @@ static int Handle_RegisterFrame(void *drvHandler, tstrHostIfRegisterFrame *pstrH
 	PRINT_D(HOSTINF_DBG, "Handling frame register Flag : %d FrameType: %d\n", pstrHostIfRegisterFrame->bReg, pstrHostIfRegisterFrame->u16FrameType);
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_REGISTER_FRAME;
+	strWID.u16WIDid = (u16)WID_REGISTER_FRAME;
 	strWID.enuWIDtype = WID_STR;
-	strWID.ps8WidVal = WILC_MALLOC(sizeof(WILC_Uint16) + 2);
+	strWID.ps8WidVal = WILC_MALLOC(sizeof(u16) + 2);
 	if (strWID.ps8WidVal = NULL) {
 		WILC_ERRORREPORT(s32Error, WILC_NO_MEM);
 	}
@@ -3938,10 +3938,10 @@ static int Handle_RegisterFrame(void *drvHandler, tstrHostIfRegisterFrame *pstrH
 
 	*pu8CurrByte++ = pstrHostIfRegisterFrame->bReg;
 	*pu8CurrByte++ = pstrHostIfRegisterFrame->u8Regid;
-	WILC_memcpy(pu8CurrByte, &(pstrHostIfRegisterFrame->u16FrameType), sizeof(WILC_Uint16));
+	WILC_memcpy(pu8CurrByte, &(pstrHostIfRegisterFrame->u16FrameType), sizeof(u16));
 
 
-	strWID.s32ValueSize = sizeof(WILC_Uint16) + 2;
+	strWID.s32ValueSize = sizeof(u16) + 2;
 
 
 	/*Sending Cfg*/
@@ -3984,7 +3984,7 @@ static WILC_Uint32 Handle_ListenStateExpired(void *drvHandler, tstrHostIfRemainO
 	/*This is to handle duplicate expiry messages (listen timer fired and supplicant called cancel_remain_on_channel())*/
 	if (P2P_LISTEN_STATE) {
 		u8remain_on_chan_flag = WILC_FALSE;
-		strWID.u16WIDid	= (WILC_Uint16)WID_REMAIN_ON_CHAN;
+		strWID.u16WIDid	= (u16)WID_REMAIN_ON_CHAN;
 		strWID.enuWIDtype	= WID_STR;
 		strWID.s32ValueSize = 2;
 		strWID.ps8WidVal = WILC_MALLOC(strWID.s32ValueSize);
@@ -4069,7 +4069,7 @@ static void Handle_PowerManagement(void *drvHandler, tstrHostIfPowerMgmtParam *s
 	tstrWID strWID;
 	WILC_Sint8 s8PowerMode;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
-	strWID.u16WIDid = (WILC_Uint16)WID_POWER_MANAGEMENT;
+	strWID.u16WIDid = (u16)WID_POWER_MANAGEMENT;
 
 	if (strPowerMgmtParam->bIsEnabled = WILC_TRUE)	{
 		s8PowerMode = MIN_FAST_PS;
@@ -4112,7 +4112,7 @@ static void Handle_SetMulticastFilter(void *drvHandler, tstrHostIFSetMulti *strH
 
 	PRINT_D(HOSTINF_DBG, "Setup Multicast Filter\n");
 
-	strWID.u16WIDid = (WILC_Uint16)WID_SETUP_MULTICAST_FILTER;
+	strWID.u16WIDid = (u16)WID_SETUP_MULTICAST_FILTER;
 	strWID.enuWIDtype = WID_BIN;
 	strWID.s32ValueSize = sizeof(tstrHostIFSetMulti) + ((strHostIfSetMulti->u32count) * ETH_ALEN);
 	strWID.ps8WidVal = WILC_MALLOC(strWID.s32ValueSize);
@@ -4175,7 +4175,7 @@ static WILC_Sint32 Handle_AddBASession(void *drvHandler, tstrHostIfBASessionInfo
 		strHostIfBASessionInfo->u16SessionTimeout,
 		strHostIfBASessionInfo->u8Ted);
 
-	strWID.u16WIDid = (WILC_Uint16)WID_11E_P_ACTION_REQ;
+	strWID.u16WIDid = (u16)WID_11E_P_ACTION_REQ;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = (u8 *)WILC_MALLOC(BLOCK_ACK_REQ_SIZE);
 	strWID.s32ValueSize = BLOCK_ACK_REQ_SIZE;
@@ -4208,7 +4208,7 @@ static WILC_Sint32 Handle_AddBASession(void *drvHandler, tstrHostIfBASessionInfo
 		PRINT_D(HOSTINF_DBG, "Couldn't open BA Session\n");
 
 
-	strWID.u16WIDid = (WILC_Uint16)WID_11E_P_ACTION_REQ;
+	strWID.u16WIDid = (u16)WID_11E_P_ACTION_REQ;
 	strWID.enuWIDtype = WID_STR;
 	strWID.s32ValueSize = 15;
 	ptr = strWID.ps8WidVal;
@@ -4260,7 +4260,7 @@ static WILC_Sint32 Handle_DelBASession(void *drvHandler, tstrHostIfBASessionInfo
 		strHostIfBASessionInfo->au8Bssid[2],
 		strHostIfBASessionInfo->u8Ted);
 
-	strWID.u16WIDid = (WILC_Uint16)WID_11E_P_ACTION_REQ;
+	strWID.u16WIDid = (u16)WID_11E_P_ACTION_REQ;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = (u8 *)WILC_MALLOC(BLOCK_ACK_REQ_SIZE);
 	strWID.s32ValueSize = BLOCK_ACK_REQ_SIZE;
@@ -4282,7 +4282,7 @@ static WILC_Sint32 Handle_DelBASession(void *drvHandler, tstrHostIfBASessionInfo
 		PRINT_D(HOSTINF_DBG, "Couldn't delete BA Session\n");
 
 
-	strWID.u16WIDid = (WILC_Uint16)WID_11E_P_ACTION_REQ;
+	strWID.u16WIDid = (u16)WID_11E_P_ACTION_REQ;
 	strWID.enuWIDtype = WID_STR;
 	strWID.s32ValueSize = 15;
 	ptr = strWID.ps8WidVal;
@@ -4330,7 +4330,7 @@ static WILC_Sint32 Handle_DelAllRxBASessions(void *drvHandler, tstrHostIfBASessi
 		strHostIfBASessionInfo->au8Bssid[2],
 		strHostIfBASessionInfo->u8Ted);
 
-	strWID.u16WIDid = (WILC_Uint16)WID_DEL_ALL_RX_BA;
+	strWID.u16WIDid = (u16)WID_DEL_ALL_RX_BA;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = (u8 *)WILC_MALLOC(BLOCK_ACK_REQ_SIZE);
 	strWID.s32ValueSize = BLOCK_ACK_REQ_SIZE;
@@ -4643,7 +4643,7 @@ WILC_Sint32 host_int_remove_key(WILC_WFIDrvHandle hWFIDrv, const u8 *pu8StaAddre
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid	= (WILC_Uint16)WID_REMOVE_KEY;
+	strWID.u16WIDid	= (u16)WID_REMOVE_KEY;
 	strWID.enuWIDtype	= WID_STR;
 	strWID.ps8WidVal	= (WILC_Sint8 *)pu8StaAddress;
 	strWID.s32ValueSize = 6;
@@ -5255,7 +5255,7 @@ WILC_Sint32 host_int_get_pmkid_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8PmkidInfoA
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid	= (WILC_Uint16)WID_PMKID_INFO;
+	strWID.u16WIDid	= (u16)WID_PMKID_INFO;
 	strWID.enuWIDtype	= WID_STR;
 	strWID.s32ValueSize = u32PmkidInfoLen;
 	strWID.ps8WidVal = pu8PmkidInfoArray;
@@ -5287,7 +5287,7 @@ WILC_Sint32 host_int_set_RSNAConfigPSKPassPhrase(WILC_WFIDrvHandle hWFIDrv, u8 *
 	/* u8 u8Psklength = WILC_strlen(pu8PassPhrase); */
 	/*validating psk length*/
 	if ((u8Psklength > 7) && (u8Psklength < 65)) {
-		strWID.u16WIDid	= (WILC_Uint16)WID_11I_PSK;
+		strWID.u16WIDid	= (u16)WID_11I_PSK;
 		strWID.enuWIDtype	= WID_STR;
 		strWID.ps8WidVal	= pu8PassPhrase;
 		strWID.s32ValueSize = u8Psklength;
@@ -5388,7 +5388,7 @@ WILC_Sint32 host_int_get_RSNAConfigPSKPassPhrase(WILC_WFIDrvHandle hWFIDrv,
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid	= (WILC_Uint16)WID_11I_PSK;
+	strWID.u16WIDid	= (u16)WID_11I_PSK;
 	strWID.enuWIDtype	= WID_STR;
 	strWID.s32ValueSize = u8Psklength;
 	strWID.ps8WidVal	= pu8PassPhrase;
@@ -5436,12 +5436,12 @@ WILC_Sint32 host_int_get_site_survey_results(WILC_WFIDrvHandle hWFIDrv,
 	tstrWID astrWIDList[2];
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
 
-	astrWIDList[0].u16WIDid = (WILC_Uint16)WID_SITE_SURVEY_RESULTS;
+	astrWIDList[0].u16WIDid = (u16)WID_SITE_SURVEY_RESULTS;
 	astrWIDList[0].enuWIDtype = WID_STR;
 	astrWIDList[0].ps8WidVal = ppu8RcvdSiteSurveyResults[0];
 	astrWIDList[0].s32ValueSize = u32MaxSiteSrvyFragLen;
 
-	astrWIDList[1].u16WIDid = (WILC_Uint16)WID_SITE_SURVEY_RESULTS;
+	astrWIDList[1].u16WIDid = (u16)WID_SITE_SURVEY_RESULTS;
 	astrWIDList[1].enuWIDtype = WID_STR;
 	astrWIDList[1].ps8WidVal = ppu8RcvdSiteSurveyResults[1];
 	astrWIDList[1].s32ValueSize = u32MaxSiteSrvyFragLen;
@@ -5484,7 +5484,7 @@ WILC_Sint32 host_int_set_start_scan_req(WILC_WFIDrvHandle hWFIDrv, u8 scanSource
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid = (WILC_Uint16)WID_START_SCAN_REQ;
+	strWID.u16WIDid = (u16)WID_START_SCAN_REQ;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = (WILC_Sint8 *)&scanSource;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -5514,7 +5514,7 @@ WILC_Sint32 host_int_get_start_scan_req(WILC_WFIDrvHandle hWFIDrv, u8 *pu8ScanSo
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid = (WILC_Uint16)WID_START_SCAN_REQ;
+	strWID.u16WIDid = (u16)WID_START_SCAN_REQ;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = (WILC_Sint8 *)pu8ScanSource;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -5679,7 +5679,7 @@ WILC_Sint32 host_int_flush_join_req(WILC_WFIDrvHandle hWFIDrv)
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 host_int_disconnect(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16ReasonCode)
+WILC_Sint32 host_int_disconnect(WILC_WFIDrvHandle hWFIDrv, u16 u16ReasonCode)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrHostIFmsg strHostIFmsg;
@@ -5734,7 +5734,7 @@ WILC_Sint32 host_int_disconnect_station(WILC_WFIDrvHandle hWFIDrv, u8 assoc_id)
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid = (WILC_Uint16)WID_DISCONNECT;
+	strWID.u16WIDid = (u16)WID_DISCONNECT;
 	strWID.enuWIDtype = WID_CHAR;
 	strWID.ps8WidVal = (WILC_Sint8 *)&assoc_id;
 	strWID.s32ValueSize = sizeof(WILC_Char);
@@ -5775,7 +5775,7 @@ WILC_Sint32 host_int_get_assoc_req_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocR
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid = (WILC_Uint16)WID_ASSOC_REQ_INFO;
+	strWID.u16WIDid = (u16)WID_ASSOC_REQ_INFO;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = pu8AssocReqInfo;
 	strWID.s32ValueSize = u32AssocReqInfoLen;
@@ -5807,7 +5807,7 @@ WILC_Sint32 host_int_get_assoc_res_info(WILC_WFIDrvHandle hWFIDrv, u8 *pu8AssocR
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
 	}
 
-	strWID.u16WIDid = (WILC_Uint16)WID_ASSOC_RES_INFO;
+	strWID.u16WIDid = (u16)WID_ASSOC_RES_INFO;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = pu8AssocRespInfo;
 	strWID.s32ValueSize = u32MaxAssocRespInfoLen;
@@ -5852,7 +5852,7 @@ WILC_Sint32 host_int_get_rx_power_level(WILC_WFIDrvHandle hWFIDrv, u8 *pu8RxPowe
 	tstrWID strWID;
 	/* tstrWILC_WFIDrv * pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv; */
 
-	strWID.u16WIDid = (WILC_Uint16)WID_RX_POWER_LEVEL;
+	strWID.u16WIDid = (u16)WID_RX_POWER_LEVEL;
 	strWID.enuWIDtype = WID_STR;
 	strWID.ps8WidVal = pu8RxPowerLevel;
 	strWID.s32ValueSize = u32RxPowerLevelLen;
@@ -6059,7 +6059,7 @@ WILC_Sint32 host_int_test_set_int_wid(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32
 	}
 
 	/*prepare configuration packet*/
-	strWID.u16WIDid = (WILC_Uint16)WID_MEMORY_ADDRESS;
+	strWID.u16WIDid = (u16)WID_MEMORY_ADDRESS;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Char *)&u32TestMemAddr;
 	strWID.s32ValueSize = sizeof(WILC_Uint32);
@@ -6152,7 +6152,7 @@ WILC_Sint32 host_int_test_get_int_wid(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 *pu
 		WILC_ERRORREPORT(s32Error, WILC_INVALID_ARGUMENT);
 	}
 
-	strWID.u16WIDid = (WILC_Uint16)WID_MEMORY_ADDRESS;
+	strWID.u16WIDid = (u16)WID_MEMORY_ADDRESS;
 	strWID.enuWIDtype = WID_INT;
 	strWID.ps8WidVal = (WILC_Sint8 *)pu32TestMemAddr;
 	strWID.s32ValueSize = sizeof(WILC_Uint32);
@@ -6416,7 +6416,7 @@ WILC_Sint32 hif_set_cfg(WILC_WFIDrvHandle hWFIDrv, tstrCfgParamVal *pstrCfgParam
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint16 *pu16WID_Value)
+WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, u16 u16WID, u16 *pu16WID_Value)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -6431,11 +6431,11 @@ WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint
 	switch (u16WID)	{
 
 	case WID_BSS_TYPE:
-		*pu16WID_Value = (WILC_Uint16)pstrWFIDrv->strCfgValues.bss_type;
+		*pu16WID_Value = (u16)pstrWFIDrv->strCfgValues.bss_type;
 		break;
 
 	case WID_AUTH_TYPE:
-		*pu16WID_Value = (WILC_Uint16)pstrWFIDrv->strCfgValues.auth_type;
+		*pu16WID_Value = (u16)pstrWFIDrv->strCfgValues.auth_type;
 		break;
 
 	case WID_AUTH_TIMEOUT:
@@ -6443,7 +6443,7 @@ WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint
 		break;
 
 	case WID_POWER_MANAGEMENT:
-		*pu16WID_Value = (WILC_Uint16)pstrWFIDrv->strCfgValues.power_mgmt_mode;
+		*pu16WID_Value = (u16)pstrWFIDrv->strCfgValues.power_mgmt_mode;
 		break;
 
 	case WID_SHORT_RETRY_LIMIT:
@@ -6463,15 +6463,15 @@ WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint
 		break;
 
 	case WID_PREAMBLE:
-		*pu16WID_Value = (WILC_Uint16)pstrWFIDrv->strCfgValues.preamble_type;
+		*pu16WID_Value = (u16)pstrWFIDrv->strCfgValues.preamble_type;
 		break;
 
 	case WID_SHORT_SLOT_ALLOWED:
-		*pu16WID_Value = (WILC_Uint16) pstrWFIDrv->strCfgValues.short_slot_allowed;
+		*pu16WID_Value = (u16) pstrWFIDrv->strCfgValues.short_slot_allowed;
 		break;
 
 	case WID_11N_TXOP_PROT_DISABLE:
-		*pu16WID_Value = (WILC_Uint16)pstrWFIDrv->strCfgValues.txop_prot_disabled;
+		*pu16WID_Value = (u16)pstrWFIDrv->strCfgValues.txop_prot_disabled;
 		break;
 
 	case WID_BEACON_INTERVAL:
@@ -6479,11 +6479,11 @@ WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint
 		break;
 
 	case WID_DTIM_PERIOD:
-		*pu16WID_Value = (WILC_Uint16)pstrWFIDrv->strCfgValues.dtim_period;
+		*pu16WID_Value = (u16)pstrWFIDrv->strCfgValues.dtim_period;
 		break;
 
 	case WID_SITE_SURVEY:
-		*pu16WID_Value = (WILC_Uint16)pstrWFIDrv->strCfgValues.site_survey_enabled;
+		*pu16WID_Value = (u16)pstrWFIDrv->strCfgValues.site_survey_enabled;
 		break;
 
 	case WID_SITE_SURVEY_SCAN_TIME:
@@ -6534,7 +6534,7 @@ WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint
  *  @version		1.0
  */
 void host_int_send_join_leave_info_to_host
-	(WILC_Uint16 assocId, u8 *stationAddr, WILC_Bool joining)
+	(u16 assocId, u8 *stationAddr, WILC_Bool joining)
 {
 }
 /**
@@ -6581,7 +6581,7 @@ void GetPeriodicRSSI(void *pvArg)
 
 
 void host_int_send_network_info_to_host
-	(u8 *macStartAddress, WILC_Uint16 u16RxFrameLen, WILC_Sint8 s8Rssi)
+	(u8 *macStartAddress, u16 u16RxFrameLen, WILC_Sint8 s8Rssi)
 {
 }
 /**
@@ -7120,7 +7120,7 @@ void host_int_ScanCompleteReceived(u8 *pu8Buffer, WILC_Uint32 u32Length)
  *  @date
  *  @version		1.0
  */
-WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID, WILC_Uint32 u32duration, WILC_Uint16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg)
+WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID, WILC_Uint32 u32duration, u16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -7207,7 +7207,7 @@ WILC_Sint32 host_int_ListenStateExpired(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u
  *  @author
  *  @date
  *  @version		1.0*/
-WILC_Sint32 host_int_frame_register(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16FrameType, WILC_Bool bReg)
+WILC_Sint32 host_int_frame_register(WILC_WFIDrvHandle hWFIDrv, u16 u16FrameType, WILC_Bool bReg)
 {
 	WILC_Sint32 s32Error = WILC_SUCCESS;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)hWFIDrv;
@@ -7662,11 +7662,11 @@ static void *host_int_ParseJoinBssParam(tstrNetworkInfo *ptstrNetworkInfo)
 {
 	tstrJoinBssParam *pNewJoinBssParam = NULL;
 	u8 *pu8IEs;
-	WILC_Uint16 u16IEsLen;
-	WILC_Uint16 index = 0;
+	u16 u16IEsLen;
+	u16 index = 0;
 	u8 suppRatesNo = 0;
 	u8 extSuppRatesNo;
-	WILC_Uint16 jumpOffset;
+	u16 jumpOffset;
 	u8 pcipherCount;
 	u8 authCount;
 	u8 pcipherTotalCount = 0;
@@ -7754,7 +7754,7 @@ static void *host_int_ParseJoinBssParam(tstrNetworkInfo *ptstrNetworkInfo)
 				 (pu8IEs[index + 2] = 0x50) && (pu8IEs[index + 3] = 0x6f) &&
 				 (pu8IEs[index + 4] = 0x9a) && /* OUI */
 				 (pu8IEs[index + 5] = 0x09) && (pu8IEs[index + 6] = 0x0c)) { /* OUI Type     */
-				WILC_Uint16 u16P2P_count;
+				u16 u16P2P_count;
 				pNewJoinBssParam->tsf = ptstrNetworkInfo->u32Tsf;
 				pNewJoinBssParam->u8NoaEnbaled = 1;
 				pNewJoinBssParam->u8Index = pu8IEs[index + 9];
@@ -7790,7 +7790,7 @@ static void *host_int_ParseJoinBssParam(tstrNetworkInfo *ptstrNetworkInfo)
 				 ((pu8IEs[index] = WPA_IE) && (pu8IEs[index + 2] = 0x00) &&
 				  (pu8IEs[index + 3] = 0x50) && (pu8IEs[index + 4] = 0xF2) &&
 				  (pu8IEs[index + 5] = 0x01)))	{
-				WILC_Uint16 rsnIndex = index;
+				u16 rsnIndex = index;
 				/*PRINT_D(HOSTINF_DBG,"RSN IE Length:%d\n",pu8IEs[rsnIndex+1]);
 				 * for(i=0; i<pu8IEs[rsnIndex+1]; i++)
 				 * {
diff --git a/drivers/staging/wilc1000/host_interface.h b/drivers/staging/wilc1000/host_interface.h
index 07bb218..b9ab5a7 100644
--- a/drivers/staging/wilc1000/host_interface.h
+++ b/drivers/staging/wilc1000/host_interface.h
@@ -126,7 +126,7 @@ typedef enum {WID_CHAR  = 0,
 	      WID_UNDEF = 7} WID_TYPE_T;
 #endif
 typedef struct {
-	WILC_Uint16 cfg_wid;
+	u16 cfg_wid;
 	WID_TYPE_T cfg_type;
 	WILC_Sint8     *pu8Para;
 } cfg_param_t;
@@ -193,22 +193,22 @@ typedef struct {
 	u8 ht_enable;
 	u8 bss_type;
 	u8 auth_type;
-	WILC_Uint16 auth_timeout;
+	u16 auth_timeout;
 	u8 power_mgmt_mode;
-	WILC_Uint16 short_retry_limit;
-	WILC_Uint16 long_retry_limit;
-	WILC_Uint16 frag_threshold;
-	WILC_Uint16 rts_threshold;
-	WILC_Uint16 preamble_type;
+	u16 short_retry_limit;
+	u16 long_retry_limit;
+	u16 frag_threshold;
+	u16 rts_threshold;
+	u16 preamble_type;
 	u8 short_slot_allowed;
 	u8 txop_prot_disabled;
-	WILC_Uint16 beacon_interval;
-	WILC_Uint16 dtim_period;
+	u16 beacon_interval;
+	u16 dtim_period;
 	SITE_SURVEY_T site_survey_enabled;
-	WILC_Uint16 site_survey_scan_time;
+	u16 site_survey_scan_time;
 	u8 scan_source;
-	WILC_Uint16 active_scan_time;
-	WILC_Uint16 passive_scan_time;
+	u16 active_scan_time;
+	u16 passive_scan_time;
 	CURRENT_TX_RATE_T curr_tx_rate;
 
 } tstrCfgParamVal;
@@ -357,13 +357,13 @@ typedef struct {
 typedef struct {
 	u8 au8Bssid[ETH_ALEN];
 	u8 u8Ted;
-	WILC_Uint16 u16BufferSize;
-	WILC_Uint16 u16SessionTimeout;
+	u16 u16BufferSize;
+	u16 u16SessionTimeout;
 } tstrHostIfBASessionInfo;
 
 #ifdef WILC_P2P
 typedef struct {
-	WILC_Uint16 u16Channel;
+	u16 u16Channel;
 	WILC_Uint32 u32duration;
 	tWILCpfRemainOnChanExpired pRemainOnChanExpired;
 	tWILCpfRemainOnChanReady pRemainOnChanReady;
@@ -374,7 +374,7 @@ typedef struct {
 typedef struct {
 
 	WILC_Bool bReg;
-	WILC_Uint16 u16FrameType;
+	u16 u16FrameType;
 	u8 u8Regid;
 
 
@@ -462,21 +462,21 @@ typedef enum {
 
 typedef struct {
 	u8 au8BSSID[ETH_ALEN];
-	WILC_Uint16 u16AssocID;
+	u16 u16AssocID;
 	u8 u8NumRates;
 	u8 *pu8Rates;
 	WILC_Bool bIsHTSupported;
-	WILC_Uint16 u16HTCapInfo;
+	u16 u16HTCapInfo;
 	u8 u8AmpduParams;
 	u8 au8SuppMCsSet[16];
-	WILC_Uint16 u16HTExtParams;
+	u16 u16HTExtParams;
 	WILC_Uint32 u32TxBeamformingCap;
 	u8 u8ASELCap;
-	WILC_Uint16 u16FlagsMask;               /*<! Determines which of u16FlagsSet were changed>*/
-	WILC_Uint16 u16FlagsSet;                /*<! Decoded according to tenuWILC_StaFlag */
+	u16 u16FlagsMask;               /*<! Determines which of u16FlagsSet were changed>*/
+	u16 u16FlagsSet;                /*<! Decoded according to tenuWILC_StaFlag */
 } tstrWILC_AddStaParam;
 
-/* extern void CfgDisconnected(void* pUserVoid, WILC_Uint16 u16reason, u8 * ie, size_t ie_len); */
+/* extern void CfgDisconnected(void* pUserVoid, u16 u16reason, u8 * ie, size_t ie_len); */
 
 /*****************************************************************************/
 /*																			 */
@@ -869,7 +869,7 @@ WILC_Sint32 host_int_flush_join_req(WILC_WFIDrvHandle hWFIDrv);
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 host_int_disconnect(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16ReasonCode);
+WILC_Sint32 host_int_disconnect(WILC_WFIDrvHandle hWFIDrv, u16 u16ReasonCode);
 
 /**
  *  @brief              disconnects a sta
@@ -1038,7 +1038,7 @@ WILC_Sint32 hif_set_cfg(WILC_WFIDrvHandle hWFIDrv, tstrCfgParamVal *pstrCfgParam
  *  @date		8 March 2012
  *  @version		1.0
  */
-WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint16 *pu16WID_Value);
+WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, u16 u16WID, u16 *pu16WID_Value);
 /*****************************************************************************/
 /*							Notification Functions							 */
 /*****************************************************************************/
@@ -1058,7 +1058,7 @@ WILC_Sint32 hif_get_cfg(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16WID, WILC_Uint
  *  @version		1.0
  */
 void host_int_send_join_leave_info_to_host
-	(WILC_Uint16 assocId, u8 *stationAddr, WILC_Bool joining);
+	(u16 assocId, u8 *stationAddr, WILC_Bool joining);
 
 /**
  *  @brief              notifies host with stations found in scan
@@ -1074,7 +1074,7 @@ void host_int_send_join_leave_info_to_host
  *  @version		1.0
  */
 void host_int_send_network_info_to_host
-	(u8 *macStartAddress, WILC_Uint16 u16RxFrameLen, WILC_Sint8 s8Rssi);
+	(u8 *macStartAddress, u16 u16RxFrameLen, WILC_Sint8 s8Rssi);
 
 /**
  *  @brief              host interface initialization function
@@ -1285,7 +1285,7 @@ WILC_Sint32 host_int_get_ipaddress(WILC_WFIDrvHandle hWFIDrv, u8 *pu8IPAddr, u8
  *  @date
  *  @version	1.0
  */
-WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID, WILC_Uint32 u32duration, WILC_Uint16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg);
+WILC_Sint32 host_int_remain_on_channel(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u32SessionID, WILC_Uint32 u32duration, u16 chan, tWILCpfRemainOnChanExpired RemainOnChanExpired, tWILCpfRemainOnChanReady RemainOnChanReady, void *pvUserArg);
 
 /**
  *  @brief              host_int_ListenStateExpired
@@ -1312,7 +1312,7 @@ WILC_Sint32 host_int_ListenStateExpired(WILC_WFIDrvHandle hWFIDrv, WILC_Uint32 u
  *  @date
  *  @version	1.0
  */
-WILC_Sint32 host_int_frame_register(WILC_WFIDrvHandle hWFIDrv, WILC_Uint16 u16FrameType, WILC_Bool bReg);
+WILC_Sint32 host_int_frame_register(WILC_WFIDrvHandle hWFIDrv, u16 u16FrameType, WILC_Bool bReg);
 #endif
 /**
  *  @brief           host_int_set_wfi_drv_handler
diff --git a/drivers/staging/wilc1000/linux_mon.c b/drivers/staging/wilc1000/linux_mon.c
index 171683c..6f8e747 100644
--- a/drivers/staging/wilc1000/linux_mon.c
+++ b/drivers/staging/wilc1000/linux_mon.c
@@ -421,7 +421,7 @@ void WILC_mgm_HOSTAPD_ACK(void *priv, WILC_Bool bStatus)
 	u8 *buf =  pv_data->buff;
 
 	/* len of the original frame without the added pointer at the tail */
-	WILC_Uint16 u16len = (pv_data->size) - sizeof(struct tx_complete_mon_data *);
+	u16 u16len = (pv_data->size) - sizeof(struct tx_complete_mon_data *);
 
 
 	/*if(bStatus = 1){
diff --git a/drivers/staging/wilc1000/linux_wlan.c b/drivers/staging/wilc1000/linux_wlan.c
index 7af95e8..3f133d4 100644
--- a/drivers/staging/wilc1000/linux_wlan.c
+++ b/drivers/staging/wilc1000/linux_wlan.c
@@ -67,7 +67,7 @@ unsigned char mac_add[] = {0x00, 0x80, 0xC2, 0x5E, 0xa2, 0xb2};
 #ifdef DISABLE_PWRSAVE_AND_SCAN_DURING_IP
 extern WILC_Bool g_obtainingIP;
 #endif
-extern WILC_Uint16 Set_machw_change_vir_if(WILC_Bool bValue);
+extern u16 Set_machw_change_vir_if(WILC_Bool bValue);
 extern void resolve_disconnect_aberration(void *drvHandler);
 extern u8 gau8MulticastMacAddrList[WILC_MULTICAST_TABLE_SIZE][ETH_ALEN];
 void wilc1000_wlan_deinit(linux_wlan_t *nic);
diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index 92bfd41..c287657 100644
--- a/drivers/staging/wilc1000/wilc_oswrapper.h
+++ b/drivers/staging/wilc1000/wilc_oswrapper.h
@@ -14,7 +14,6 @@
 #define WILC_OSW_INTERFACE_VER 2
 
 /* Integer Types */
-typedef unsigned short WILC_Uint16;
 typedef unsigned int WILC_Uint32;
 typedef unsigned long long WILC_Uint64;
 typedef signed char WILC_Sint8;
@@ -34,7 +33,7 @@ typedef enum {
 
 /* Character types */
 typedef char WILC_Char;
-typedef WILC_Uint16 WILC_WideChar;
+typedef u16 WILC_WideChar;
 
 #define WILC_OS_INFINITY (~((WILC_Uint32)0))
 #define WILC_NULL ((void *)0)
diff --git a/drivers/staging/wilc1000/wilc_time.h b/drivers/staging/wilc1000/wilc_time.h
index 7e1a5c7..945b93d 100644
--- a/drivers/staging/wilc1000/wilc_time.h
+++ b/drivers/staging/wilc1000/wilc_time.h
@@ -28,7 +28,7 @@ typedef struct {
 
 typedef struct {
 	/*!< current year */
-	WILC_Uint16	u16Year;
+	u16	u16Year;
 	/*!< current month */
 	u8	u8Month;
 	/*!< current day */
diff --git a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
index f4ccc09..99f946f 100644
--- a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
+++ b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
@@ -25,7 +25,7 @@
 extern void linux_wlan_free(void *vp);
 extern int linux_wlan_get_firmware(perInterface_wlan_t *p_nic);
 extern void linux_wlan_unlock(void *vp);
-extern WILC_Uint16 Set_machw_change_vir_if(WILC_Bool bValue);
+extern u16 Set_machw_change_vir_if(WILC_Bool bValue);
 
 extern int mac_open(struct net_device *ndev);
 extern int mac_close(struct net_device *ndev);
@@ -605,7 +605,7 @@ static void CfgConnectResult(tenuConnDisconnEvent enuConnDisconnEvent,
 
 	if (enuConnDisconnEvent = CONN_DISCONN_EVENT_CONN_RESP) {
 		/*Initialization*/
-		WILC_Uint16 u16ConnectStatus = WLAN_STATUS_SUCCESS;
+		u16 u16ConnectStatus = WLAN_STATUS_SUCCESS;
 
 		u16ConnectStatus = pstrConnectInfo->u16ConnectStatus;
 
@@ -2832,7 +2832,7 @@ int WILC_WFI_mgmt_tx(struct wiphy *wiphy,
 			/*Save the current channel after we tune to it*/
 			u8CurrChannel = chan->hw_value;
 		} else if (ieee80211_is_action(mgmt->frame_control))   {
-			PRINT_D(GENERIC_DBG, "ACTION FRAME:%x\n", (WILC_Uint16)mgmt->frame_control);
+			PRINT_D(GENERIC_DBG, "ACTION FRAME:%x\n", (u16)mgmt->frame_control);
 
 
 			/*BugID_4847*/
@@ -3187,7 +3187,7 @@ static int WILC_WFI_change_virt_intf(struct wiphy *wiphy, struct net_device *dev
 	/* struct WILC_WFI_mon_priv* mon_priv; */
 	perInterface_wlan_t *nic;
 	u8 interface_type;
-	WILC_Uint16 TID = 0;
+	u16 TID = 0;
 	#ifdef WILC_P2P
 	u8 i;
 	#endif
diff --git a/drivers/staging/wilc1000/wilc_wfi_netdevice.h b/drivers/staging/wilc1000/wilc_wfi_netdevice.h
index 55c943e..e45b436 100644
--- a/drivers/staging/wilc1000/wilc_wfi_netdevice.h
+++ b/drivers/staging/wilc1000/wilc_wfi_netdevice.h
@@ -183,7 +183,7 @@ struct WILC_WFI_priv {
 };
 
 typedef struct {
-	WILC_Uint16 frame_type;
+	u16 frame_type;
 	WILC_Bool reg;
 
 } struct_frame_reg;
diff --git a/drivers/staging/wilc1000/wilc_wlan.c b/drivers/staging/wilc1000/wilc_wlan.c
index 5704b54..26b76be 100644
--- a/drivers/staging/wilc1000/wilc_wlan.c
+++ b/drivers/staging/wilc1000/wilc_wlan.c
@@ -27,7 +27,7 @@ extern void WILC_WFI_mgmt_rx(uint8_t *buff, uint32_t size);
 extern void frmw_to_linux(uint8_t *buff, uint32_t size);
 int sdio_xfer_cnt(void);
 uint32_t wilc_get_chipid(uint8_t update);
-WILC_Uint16 Set_machw_change_vir_if(WILC_Bool bValue);
+u16 Set_machw_change_vir_if(WILC_Bool bValue);
 
 /* static uint32_t vmm_table[WILC_VMM_TBL_SIZE]; */
 /* static uint32_t vmm_table_rbk[WILC_VMM_TBL_SIZE]; */
@@ -2396,9 +2396,9 @@ _fail_:
 }
 
 #define BIT31 (1 << 31)
-WILC_Uint16 Set_machw_change_vir_if(WILC_Bool bValue)
+u16 Set_machw_change_vir_if(WILC_Bool bValue)
 {
-	WILC_Uint16 ret;
+	u16 ret;
 	WILC_Uint32 reg;
 
 	/*Reset WILC_CHANGING_VIR_IF register to allow adding futrue keys to CE H/W*/
@@ -2425,7 +2425,7 @@ WILC_Uint16 Set_machw_change_vir_if(WILC_Bool bValue)
 }
 
 #ifdef WILC_FULLY_HOSTING_AP
-wilc_wlan_dev_t *Get_wlan_context(WILC_Uint16 *pu16size)
+wilc_wlan_dev_t *Get_wlan_context(u16 *pu16size)
 {
 	*pu16size = sizeof(wilc_wlan_dev_t);
 	return &g_wlan;
-- 
1.9.1

