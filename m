From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Thu, 11 Jun 2015 05:35:56 +0000
Subject: [PATCH V3 5/9] staging: wilc1000: remove WILC_Uint64
Message-Id: <1434000960-16909-5-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u64 instead of WILC_Uint64.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V3: rebased on the top of staging-testing
V2: remove the spaces on the subject
    capitalize the name on the From and the Signed-off-by

 drivers/staging/wilc1000/coreconfigurator.c   | 2 +-
 drivers/staging/wilc1000/coreconfigurator.h   | 2 +-
 drivers/staging/wilc1000/host_interface.h     | 2 +-
 drivers/staging/wilc1000/wilc_oswrapper.h     | 1 -
 drivers/staging/wilc1000/wilc_wfi_netdevice.h | 4 ++--
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 2bb513d..0a03080 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -839,7 +839,7 @@ WILC_Sint32 ParseNetworkInfo(u8 *pu8MsgBuffer, tstrNetworkInfo **ppstrNetworkInf
 		u32Tsf_Lo = get_beacon_timestamp_lo(pu8msa);
 		u32Tsf_Hi = get_beacon_timestamp_hi(pu8msa);
 
-		pstrNetworkInfo->u64Tsf = u32Tsf_Lo | ((WILC_Uint64)u32Tsf_Hi << 32);
+		pstrNetworkInfo->u64Tsf = u32Tsf_Lo | ((u64)u32Tsf_Hi << 32);
 
 		/* Get SSID */
 		get_ssid(pu8msa, pstrNetworkInfo->au8ssid, &(pstrNetworkInfo->u8SsidLen));
diff --git a/drivers/staging/wilc1000/coreconfigurator.h b/drivers/staging/wilc1000/coreconfigurator.h
index c2a6d5b..6d16bba 100644
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
index 85eb3f4..a75efbf 100644
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
index 964e818..3af48da 100644
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
index 108d453..10e6b1a 100644
--- a/drivers/staging/wilc1000/wilc_wfi_netdevice.h
+++ b/drivers/staging/wilc1000/wilc_wfi_netdevice.h
@@ -118,7 +118,7 @@ struct wilc_wfi_p2pListenParams {
 	struct ieee80211_channel *pstrListenChan;
 	enum nl80211_channel_type tenuChannelType;
 	u32 u32ListenDuration;
-	WILC_Uint64 u64ListenCookie;
+	u64 u64ListenCookie;
 	u32 u32ListenSessionID;
 };
 
@@ -130,7 +130,7 @@ struct WILC_WFI_priv {
 
 	#ifdef WILC_P2P
 	struct wilc_wfi_p2pListenParams strRemainOnChanParams;
-	WILC_Uint64 u64tx_cookie;
+	u64 u64tx_cookie;
 
 	#endif
 
-- 
1.9.1

