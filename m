From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 17 Jul 2010 20:45:27 +0000
Subject: [PATCH 3/4] staging/spectra: initializa lblk variable
Message-Id: <1279399527.14049.24.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix a compile warning by initializaing lblk. Since FTL_Get_Block_Index() returns BAD_BLOCK 
if it doesn't find the logical block number, lblk number is initizalized to BAD_BLOCK.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/spectra/flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/spectra/flash.c b/drivers/staging/spectra/flash.c
index a0d6094..2673388 100644
--- a/drivers/staging/spectra/flash.c
+++ b/drivers/staging/spectra/flash.c
@@ -1698,7 +1698,7 @@ static int get_l2_cache_blks(void)
 static int erase_l2_cache_blocks(void)
 {
 	int i, ret = PASS;
-	u32 pblk, lblk;
+	u32 pblk, lblk = BAD_BLOCK;
 	u64 addr;
 	u32 *pbt = (u32 *)g_pBlockTable;
 
-- 
1.7.0.4



