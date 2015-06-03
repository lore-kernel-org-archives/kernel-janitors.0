From: chaehyun lim <chaehyun.lim@gmail.com>
Date: Wed, 03 Jun 2015 01:16:31 +0000
Subject: [PATCH 1/2] staging : wilc1000 : remove UWORD8
Message-Id: <1433294191-12074-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u8 instead of UWORD8.

Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/coreconfigurator.c | 2 +-
 drivers/staging/wilc1000/host_interface.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 01625bd..958cf0b 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -498,7 +498,7 @@ INLINE WILC_Uint32 get_beacon_timestamp_lo(WILC_Uint8 *data)
 	return time_stamp;
 }
 
-INLINE UWORD32 get_beacon_timestamp_hi(UWORD8 *data)
+INLINE UWORD32 get_beacon_timestamp_hi(u8 *data)
 {
 	UWORD32 time_stamp = 0;
 	UWORD32 index    = (MAC_HDR_LEN + 4);
diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index fcbadd1..8e00f71 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -3692,7 +3692,7 @@ static void Handle_DelAllSta(void *drvHandler, tstrHostIFDelAllSta *pstrDelAllSt
 	WILC_Uint8 *pu8CurrByte;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 	WILC_Uint8 i;
-	UWORD8 au8Zero_Buff[6] = {0};
+	u8 au8Zero_Buff[6] = {0};
 	strWID.u16WIDid = (WILC_Uint16)WID_DEL_ALL_STA;
 	strWID.enuWIDtype = WID_STR;
 	strWID.s32ValueSize = (pstrDelAllStaParam->u8Num_AssocSta * ETH_ALEN) + 1;
-- 
1.9.1

