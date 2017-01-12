From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 10:36:54 +0000
Subject: [PATCH 2/3] mtd/ftl: Delete an error message for a failed memory allocation in ftl_add_mtd()
Message-Id: <189c05bd-f0b2-6501-c24b-55f4eef76dc1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
In-Reply-To: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 11:11:47 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/ftl.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index ef2f38b6a837..7af23110be6e 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1042,12 +1042,8 @@ static void ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	partition_t *partition;
 
 	partition = kzalloc(sizeof(partition_t), GFP_KERNEL);
-
-	if (!partition) {
-		printk(KERN_WARNING "No memory to scan for FTL on %s\n",
-		       mtd->name);
+	if (!partition)
 		return;
-	}
 
 	partition->mbd.mtd = mtd;
 
-- 
2.11.0

