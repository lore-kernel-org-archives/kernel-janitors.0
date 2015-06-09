From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Tue, 09 Jun 2015 00:19:35 +0000
Subject: [PATCH V2 4/8] staging: wilc1000: remove WILC_Uint64.
Message-Id: <1433809179-9769-4-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u64 in stead of WILC_Uint64.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V2 : remove the spaces on the subject
     Capitalize the name on the From and the Signed-off-by

 drivers/staging/wilc1000/coreconfigurator.c   | 2 +-
 drivers/staging/wilc1000/coreconfigurator.h   | 2 +-
 drivers/staging/wilc1000/host_interface.h     | 2 +-
 drivers/staging/wilc1000/wilc_oswrapper.h     | 1 -
 drivers/staging/wilc1000/wilc_wfi_netdevice.h | 4 ++--
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 3ba0a40..cf21466 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -846,7 +846,7 @@ WILC_Sint32 ParseNetworkInfo(u8 *pu8MsgBuffer, tstrNetworkInfo **ppstrNetworkInf
 		u32Tsf_Lo = get_beacon_timestamp_lo(pu8msa);
 		u32Tsf_Hi = get_beacon_timestamp_hi(pu8msa);
 
-		pstrNetworkInfo->u64Tsf = u32Tsf_Lo | ((WILC_Uint64)u32Tsf_Hi << 32);
+		pstrNetworkInfo->u64Tsf = u32Tsf_Lo | ((u64)u32Tsf_Hi << 32);
 
 		/* Get SSID */
 		get_ssid(pu8msa, pstrNetworkInfo->au8ssid, &(pstrNetworkInfo->u8SsidLen));
diff --git a/drivers/staging/wilc1000/coreconfigurator.h b/drivers/staging/wilc1000/coreconfigurator.h
index d833ec9..969fcb7 100644
--- a/drivers/staging/wilc1000/coreconfigurator.h
+++ b/drivers/staging/wilc1000/coreconfigurator.h
@@ -429,7 +429,7 @@ typedef struct {
 	u16 u16IEsLen;
 	void *pJoinParams;
 	tstrRSSI strRssi;
-	WILC_Uint64 u64Tsf; /* time-stamp [Low and High 64 bit] */
+	u64 u64Tsf; /* time-stamp [Low and High 64 bit] */
 } tstrNetworkInfo;
 
 /* This structure is used to support parsing of the received Association Response frame */
diff --git a/drivers/staging/wilc1000/host_interface.h b/drivers/staging/wilc1000/host_interface.h
index cc28bba..864fa55 100644
--- a/drivers/staging/wilc1000/host_interface.h
+++ b/drivers/staging/wilc1000/host_interface.h
@@ -406,7 +406,7 @@ typedef struct {
 	/*Remain on channel struvture*/
 	tstrHostIfRemainOnChan strHostIfRemainOnChan;
 	u8 u8RemainOnChan_pendingreq;
-	WILC_Uint64 u64P2p_MgmtTimeout;
+	u64 u64P2p_MgmtTimeout;
 	u8 u8P2PConnect;
 	#endif
 
diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index 9db45a9..1060559 100644
--- a/drivers/staging/wilc1000/wilc_oswrapper.h
+++ b/drivers/staging/wilc1000/wilc_oswrapper.h
@@ -14,7 +14,6 @@
 #define WILC_OSW_INTERFACE_VER 2
 
 /* Integer Types */
-typedef unsigned long long WILC_Uint64;
 typedef signed char WILC_Sint8;
 typedef signed short WILC_Sint16;
 typedef signed int WILC_Sint32;
diff --git a/drivers/staging/wilc1000/wilc_wfi_netdevice.h b/drivers/staging/wilc1000/wilc_wfi_netdevice.h
index 32e707b..20822c9 100644
--- a/drivers/staging/wilc1000/wilc_wfi_netdevice.h
+++ b/drivers/staging/wilc1000/wilc_wfi_netdevice.h
@@ -123,7 +123,7 @@ struct wilc_wfi_p2pListenParams {
 	struct ieee80211_channel *pstrListenChan;
 	enum nl80211_channel_type tenuChannelType;
 	u32 u32ListenDuration;
-	WILC_Uint64 u64ListenCookie;
+	u64 u64ListenCookie;
 	u32 u32ListenSessionID;
 };
 
@@ -135,7 +135,7 @@ struct WILC_WFI_priv {
 
 	#ifdef WILC_P2P
 	struct wilc_wfi_p2pListenParams strRemainOnChanParams;
-	WILC_Uint64 u64tx_cookie;
+	u64 u64tx_cookie;
 
 	#endif
 
-- 
1.9.1

