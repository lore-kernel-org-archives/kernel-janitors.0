From: chaehyun lim <chaehyun.lim@gmail.com>
Date: Thu, 04 Jun 2015 00:01:36 +0000
Subject: [PATCH V2 2/2] staging: wilc1000: remove UWORD32
Message-Id: <1433376096-12532-2-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u32 instead of UWORD32

Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
---
V2 : remove the defintion of UWORD32

 drivers/staging/wilc1000/coreconfigurator.c | 6 +++---
 drivers/staging/wilc1000/itypes.h           | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 958cf0b..0dc4413 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -498,10 +498,10 @@ INLINE WILC_Uint32 get_beacon_timestamp_lo(WILC_Uint8 *data)
 	return time_stamp;
 }
 
-INLINE UWORD32 get_beacon_timestamp_hi(u8 *data)
+INLINE u32 get_beacon_timestamp_hi(u8 *data)
 {
-	UWORD32 time_stamp = 0;
-	UWORD32 index    = (MAC_HDR_LEN + 4);
+	u32 time_stamp = 0;
+	u32 index    = (MAC_HDR_LEN + 4);
 
 	time_stamp |= data[index++];
 	time_stamp |= (data[index++] << 8);
diff --git a/drivers/staging/wilc1000/itypes.h b/drivers/staging/wilc1000/itypes.h
index 91c8f0d..c99f8ca 100644
--- a/drivers/staging/wilc1000/itypes.h
+++ b/drivers/staging/wilc1000/itypes.h
@@ -44,7 +44,6 @@
 typedef int WORD32;
 typedef short WORD16;
 typedef char WORD8;
-typedef unsigned int UWORD32;
 typedef unsigned short UWORD16;
 
 /*****************************************************************************/
-- 
1.9.1

