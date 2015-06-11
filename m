From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Thu, 11 Jun 2015 05:35:53 +0000
Subject: [PATCH V4 2/9] staging: wilc1000: remove UWORD32
Message-Id: <1434000960-16909-2-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use u32 instead of UWORD32.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V4: rebased on the top of staging-testing
V3: capitalize the name on the From and the Signed-off-by
V2: remove the definition of UWORD32

 drivers/staging/wilc1000/coreconfigurator.c | 6 +++---
 drivers/staging/wilc1000/itypes.h           | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 339b2a5..d3a0069 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -499,10 +499,10 @@ INLINE WILC_Uint32 get_beacon_timestamp_lo(u8 *data)
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

