From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:02:27 +0000
Subject: [PATCH 4/7] mtd: nand: fixup bounds checks for nand_{lock,unlock}()
Message-Id: <1425117750-22298-5-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Coverity noticed that these 'ret' assignments weren't being used. Let's
use them.

Note that nand_lock() and nand_unlock() are still not officially used by
any drivers.

Coverity CIDs #1227054 and #1227037

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index df7eb4ff07d1..5488a7ad63e7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -968,7 +968,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
-		ret = -EINVAL;
+		return -EINVAL;
 
 	/* Align to last block address if size addresses end of the device */
 	if (ofs + len = mtd->size)
@@ -1031,7 +1031,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
-		ret = -EINVAL;
+		return -EINVAL;
 
 	nand_get_device(mtd, FL_LOCKING);
 
-- 
2.1.0

