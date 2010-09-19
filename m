From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:54:40 +0000
Subject: [PATCH] staging: spectra: off by one
Message-Id: <1284900881-24243-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Javier Martinez Canillas <martinez.javier@gmail.com>, David Woodhouse <David.Woodhouse@intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

g_pBlockTable has only DeviceInfo.wDataBlockNum elements.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/staging/spectra/flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/spectra/flash.c b/drivers/staging/spectra/flash.c
index 9b5218b..4e6e451 100644
--- a/drivers/staging/spectra/flash.c
+++ b/drivers/staging/spectra/flash.c
@@ -1604,7 +1604,7 @@ static int get_l2_cache_blks(void)
 
 	for (n = 0; n < BLK_NUM_FOR_L2_CACHE; n++) {
 		blk = find_least_worn_blk_for_l2_cache();
-		if (blk > DeviceInfo.wDataBlockNum) {
+		if (blk >= DeviceInfo.wDataBlockNum) {
 			nand_dbg_print(NAND_DBG_WARN,
 				"find_least_worn_blk_for_l2_cache: "
 				"No enough free NAND blocks (n: %d) for L2 Cache!\n", n);
-- 
1.7.0.4

