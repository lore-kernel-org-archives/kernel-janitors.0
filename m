From: Colin King <colin.king@canonical.com>
Date: Thu, 10 Sep 2020 15:44:51 +0000
Subject: [PATCH] mtd: mtdconcat: map: remove redundant assignment to variable 'size'
Message-Id: <20200910154451.752569-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'size' is being assigned the value zero that will never be
read. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/mtdconcat.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 242c3a660002..6e4d0017c0bd 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -114,7 +114,6 @@ concat_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t size, retsize;
 
 		if (to >= subdev->size) {
-			size = 0;
 			to -= subdev->size;
 			continue;
 		}
-- 
2.27.0
