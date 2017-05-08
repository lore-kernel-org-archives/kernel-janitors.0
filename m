From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 15:09:04 +0000
Subject: [PATCH 2/3] mtdswap: Improve two size determinations in mtdswap_add_mtd()
Message-Id: <cfc8598b-9552-9321-9fad-497415c1b0ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <82e905b5-3958-be81-b0ee-d0a2805154df@users.sourceforge.net>
In-Reply-To: <82e905b5-3958-be81-b0ee-d0a2805154df@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 16:18:49 +0200

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/mtdswap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 0805f45c5139..f73fb0909b0c 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1485,11 +1485,11 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		"%u spare, %u bad blocks\n",
 		MTDSWAP_PREFIX, part, swap_size / 1024, spare_cnt, bad_blocks);
 
-	d = kzalloc(sizeof(struct mtdswap_dev), GFP_KERNEL);
+	d = kzalloc(sizeof(*d), GFP_KERNEL);
 	if (!d)
 		return;
 
-	mbd_dev = kzalloc(sizeof(struct mtd_blktrans_dev), GFP_KERNEL);
+	mbd_dev = kzalloc(sizeof(*mbd_dev), GFP_KERNEL);
 	if (!mbd_dev) {
 		kfree(d);
 		return;
-- 
2.12.2

