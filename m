From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Thu, 11 Jun 2015 05:34:32 +0000
Subject: [PATCH V4 1/9] staging: wilc1000: remove UWORD8
Message-Id: <1434000880-16858-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u8 instead of UWORD8.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V4: rebased on the top of staging-testing
V3: capitalize the name on the From and the Signed-off-by
V2: remove the definition of UWORD8

 drivers/staging/wilc1000/coreconfigurator.c | 2 +-
 drivers/staging/wilc1000/host_interface.c   | 2 +-
 drivers/staging/wilc1000/itypes.h           | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 3a6c5ba..339b2a5 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -499,7 +499,7 @@ INLINE WILC_Uint32 get_beacon_timestamp_lo(u8 *data)
 	return time_stamp;
 }
 
-INLINE UWORD32 get_beacon_timestamp_hi(UWORD8 *data)
+INLINE UWORD32 get_beacon_timestamp_hi(u8 *data)
 {
 	UWORD32 time_stamp = 0;
 	UWORD32 index    = (MAC_HDR_LEN + 4);
diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 1ecb373..b2bbb45 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -3692,7 +3692,7 @@ static void Handle_DelAllSta(void *drvHandler, tstrHostIFDelAllSta *pstrDelAllSt
 	u8 *pu8CurrByte;
 	tstrWILC_WFIDrv *pstrWFIDrv = (tstrWILC_WFIDrv *)drvHandler;
 	u8 i;
-	UWORD8 au8Zero_Buff[6] = {0};
+	u8 au8Zero_Buff[6] = {0};
 	strWID.u16WIDid = (WILC_Uint16)WID_DEL_ALL_STA;
 	strWID.enuWIDtype = WID_STR;
 	strWID.s32ValueSize = (pstrDelAllStaParam->u8Num_AssocSta * ETH_ALEN) + 1;
diff --git a/drivers/staging/wilc1000/itypes.h b/drivers/staging/wilc1000/itypes.h
index 6c2bd79..91c8f0d 100644
--- a/drivers/staging/wilc1000/itypes.h
+++ b/drivers/staging/wilc1000/itypes.h
@@ -46,7 +46,6 @@ typedef short WORD16;
 typedef char WORD8;
 typedef unsigned int UWORD32;
 typedef unsigned short UWORD16;
-typedef unsigned char UWORD8;
 
 /*****************************************************************************/
 /* Enums                                                                     */
-- 
1.9.1

