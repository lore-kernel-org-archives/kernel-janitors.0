From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Sep 2020 10:23:21 +0000
Subject: [PATCH] mtd: remove redundant assignment to pointer eb
Message-Id: <20200911102321.22515-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer eb is being assigned a value that is never read, the assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/mtdswap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 58eefa43af14..795dec4483c2 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1053,7 +1053,6 @@ static int mtdswap_writesect(struct mtd_blktrans_dev *dev,
 	if (ret < 0)
 		return ret;
 
-	eb = d->eb_data + (newblock / d->pages_per_eblk);
 	d->page_data[page] = newblock;
 
 	return 0;
-- 
2.27.0
