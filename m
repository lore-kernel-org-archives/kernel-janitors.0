From: Marcos Souza <marcos.mage@gmail.com>
Date: Fri, 04 Nov 2011 10:10:56 +0000
Subject: [PATCH 3/4] drivers/staging/vt6656/iocmd.h: Removed ttype.h and some
Message-Id: <CAGkUK2tYVKSawyp47bs2d8U1D=EKzBk216RLP-OC5P0e=VcNjw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

I forgot to sent these patches, so I'm sending now

Removed comments about functions/veriables static and stuff like these.

Signed-off-by: Marcos paulo de Souza <marcos.mage@gmail.com>
---
 drivers/staging/vt6656/iocmd.h |   99 ++++++++++++++----------------------=
----
 1 files changed, 35 insertions(+), 64 deletions(-)

diff --git a/drivers/staging/vt6656/iocmd.h b/drivers/staging/vt6656/iocmd.h
index 22710ce..95ea2ce 100644
--- a/drivers/staging/vt6656/iocmd.h
+++ b/drivers/staging/vt6656/iocmd.h
@@ -29,11 +29,7 @@
 #ifndef __IOCMD_H__
 #define __IOCMD_H__

-#include "ttype.h"
-
-/*---------------------  Export Definitions -------------------------*/
-
-// ioctl Command code
+/* ioctl Command code */
 #define MAGIC_CODE	                 0x3142
 #define IOCTL_CMD_TEST	            (SIOCDEVPRIVATE + 0)
 #define IOCTL_CMD_SET			    (SIOCDEVPRIVATE + 1)
@@ -92,9 +88,9 @@ typedef enum tagWZONETYPE {
 #define WEP_104BIT_LEN         13
 #define WEP_232BIT_LEN         16

-// Ioctl interface structure
-// Command structure
-//
+/* Ioctl interface structure
+*  Command structure
+*/
 #pragma pack(1)
 typedef struct tagSCmdRequest {
 	u8 name[16];
@@ -103,9 +99,7 @@ typedef struct tagSCmdRequest {
 	u16     wCmdCode;
 } SCmdRequest, *PSCmdRequest;

-//
-// Scan
-//
+/* Scan */

 typedef struct tagSCmdScan {

@@ -113,9 +107,7 @@ typedef struct tagSCmdScan {

 } SCmdScan, *PSCmdScan;

-//
-// BSS Join
-//
+/* BSS Join */

 typedef struct tagSCmdBSSJoin {

@@ -123,18 +115,16 @@ typedef struct tagSCmdBSSJoin {
     u16     wBBPType;
     u8	    ssid[SSID_MAXLEN + 2];
     u32	    uChannel;
-    BOOL    bPSEnable;
-    BOOL    bShareKeyAuth;
+    int    bPSEnable;
+    int    bShareKeyAuth;

 } SCmdBSSJoin, *PSCmdBSSJoin;

-//
-// Zonetype Setting
-//
+/* Zonetype Setting */

 typedef struct tagSCmdZoneTypeSet {

- BOOL       bWrite;
+ int       bWrite;
  WZONETYPE  ZoneType;

 } SCmdZoneTypeSet, *PSCmdZoneTypeSet;
@@ -144,7 +134,7 @@ typedef struct tagSWPAResult {
 	u8 proto;
 	u8 key_mgmt;
 	u8 eap_type;
-         BOOL authenticated;
+	int authenticated;
 } SWPAResult, *PSWPAResult;

 typedef struct tagSCmdStartAP {
@@ -154,17 +144,17 @@ typedef struct tagSCmdStartAP {
     u8	    ssid[SSID_MAXLEN + 2];
 	u32 uChannel;
 	u32 uBeaconInt;
-    BOOL    bShareKeyAuth;
+    int    bShareKeyAuth;
     u8      byBasicRate;

 } SCmdStartAP, *PSCmdStartAP;

 typedef struct tagSCmdSetWEP {

-    BOOL    bEnableWep;
+    int    bEnableWep;
     u8      byKeyIndex;
     u8      abyWepKey[WEP_NKEYS][WEP_KEYMAXLEN];
-    BOOL    bWepKeyAvailable[WEP_NKEYS];
+    int    bWepKeyAvailable[WEP_NKEYS];
     u32     auWepKeyLength[WEP_NKEYS];

 } SCmdSetWEP, *PSCmdSetWEP;
@@ -177,7 +167,7 @@ typedef struct tagSBSSIDItem {
     u16	    wBeaconInterval;
     u16	    wCapInfo;
     u8      byNetType;
-    BOOL    bWEPOn;
+    int    bWEPOn;
     u32     uRSSI;

 } SBSSIDItem;
@@ -191,19 +181,19 @@ typedef struct tagSBSSIDList {


 typedef struct tagSNodeItem {
-    // STA info
+    /* STA info */
     u16            wAID;
     u8             abyMACAddr[6];
     u16            wTxDataRate;
     u16            wInActiveCount;
     u16            wEnQueueCnt;
     u16            wFlags;
-    BOOL           bPWBitOn;
+    int           bPWBitOn;
     u8             byKeyIndex;
     u16            wWepKeyLength;
     u8            abyWepKey[WEP_KEYMAXLEN];
-    // Auto rate fallback vars
-    BOOL           bIsInFallback;
+	/* Auto rate fallback vars */
+	int           bIsInFallback;
     u32            uTxFailures;
     u32            uTxAttempts;
     u16            wFailureRatio;
@@ -221,7 +211,7 @@ typedef struct tagSNodeList {

 typedef struct tagSCmdLinkStatus {

-    BOOL    bLink;
+	int    bLink;
 	u16	    wBSSType;
 	u8      byState;
     u8      abyBSSID[BSSID_LEN];
@@ -231,9 +221,8 @@ typedef struct tagSCmdLinkStatus {

 } SCmdLinkStatus, *PSCmdLinkStatus;

-//
-// 802.11 counter
-//
+/* 802.11 counter */
+
 typedef struct tagSDot11MIBCount {
     u32 TransmittedFragmentCount;
     u32 MulticastTransmittedFrameCount;
@@ -249,15 +238,11 @@ typedef struct tagSDot11MIBCount {
     u32 FCSErrorCount;
 } SDot11MIBCount, *PSDot11MIBCount;

+/* statistic counter */

-
-//
-// statistic counter
-//
 typedef struct tagSStatMIBCount {
-    //
-    // ISR status count
-    //
+
+    /* ISR status count */
     u32   dwIsrTx0OK;
     u32   dwIsrTx1OK;
     u32   dwIsrBeaconTxOK;
@@ -267,12 +252,10 @@ typedef struct tagSStatMIBCount {
     u32   dwIsrUnrecoverableError;
     u32   dwIsrSoftInterrupt;
     u32   dwIsrRxNoBuf;
-    /////////////////////////////////////

-	u32 dwIsrUnknown; /* unknown interrupt count */
+	u32 dwIsrUnknown; /* unknown interrupt count */

-    // RSR status count
-    //
+    /* RSR status count */
     u32   dwRsrFrmAlgnErr;
     u32   dwRsrErr;
     u32   dwRsrCRCErr;
@@ -293,10 +276,10 @@ typedef struct tagSStatMIBCount {
     u32   dwRsrBroadcast;
     u32   dwRsrMulticast;
     u32   dwRsrDirected;
-    // 64-bit OID
+    /* 64-bit OID */
     u32   ullRsrOK;

-    // for some optional OIDs (64 bits) and DMI support
+    /* for some optional OIDs (64 bits) and DMI support */
     u32   ullRxBroadcastBytes;
     u32   ullRxMulticastBytes;
     u32   ullRxDirectedBytes;
@@ -312,8 +295,7 @@ typedef struct tagSStatMIBCount {
     u32   dwRsrRxFrmLen512_1023;
     u32   dwRsrRxFrmLen1024_1518;

-    // TSR0,1 status count
-    //
+	/* TSR0,1 status count */
 	u32 dwTsrTotalRetry[2];        /* total collision retry count */
 	u32 dwTsrOnceRetry[2];         /* this packet had one collision */
 	u32 dwTsrMoreThanOnceRetry[2]; /* this packet had many collisions */
@@ -332,7 +314,7 @@ typedef struct tagSStatMIBCount {
     u32   dwTsrMulticast[2];
     u32   dwTsrDirected[2];

-    // RD/TD count
+    /* RD/TD count */
     u32   dwCntRxFrmLength;
     u32   dwCntTxBufLength;

@@ -348,7 +330,7 @@ typedef struct tagSStatMIBCount {
 	/* 64-bit OID */
 	u32   ullTsrOK[2];

-    // for some optional OIDs (64 bits) and DMI support
+    /* for some optional OIDs (64 bits) and DMI support */
     u32   ullTxBroadcastFrames[2];
     u32   ullTxMulticastFrames[2];
     u32   ullTxDirectedFrames[2];
@@ -363,11 +345,8 @@ typedef struct tagSCmdValue {

 } SCmdValue,  *PSCmdValue;

-//
-// hostapd & viawget ioctl related
-//
-
-// VIAGWET_IOCTL_HOSTAPD ioctl() cmd:
+/* hostapd & viawget ioctl related
+   VIAGWET_IOCTL_HOSTAPD ioctl() cmd: */
 enum {
 	VIAWGET_HOSTAPD_FLUSH =3D 1,
 	VIAWGET_HOSTAPD_ADD_STA =3D 2,
@@ -386,7 +365,7 @@ enum {
 #define VIAWGET_HOSTAPD_GENERIC_ELEMENT_HDR_LEN \
 ((int) (&((struct viawget_hostapd_param *) 0)->u.generic_elem.data))

-// Maximum length for algorithm names (-1 for nul termination) used in ioc=
tl()
+/* Maximum length for algorithm names (-1 for nul termination) used
in ioctl() */

 struct viawget_hostapd_param {
 	u32 cmd;
@@ -433,12 +412,4 @@ struct viawget_hostapd_param {
 	} u;
 };

-/*---------------------  Export Classes  ----------------------------*/
-
-/*---------------------  Export Variables  --------------------------*/
-
-/*---------------------  Export Types  ------------------------------*/
-
-/*---------------------  Export Functions  --------------------------*/
-
 #endif /* __IOCMD_H__ */
--=20
1.7.4.4




--=20
Marcos Paulo de Souza

*Porque uma vida sem desafios =E9 uma vida sem raz=E3o.*
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
