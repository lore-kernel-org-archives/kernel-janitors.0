From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 10:38:06 +0000
Subject: [PATCH 3/3] mtd/ftl: Improve another size determination in ftl_add_mtd()
Message-Id: <24ba7545-98a6-7afa-b85c-7d6a41500627@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
In-Reply-To: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 11:18:59 +0100

Replace the specification of a data type by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 7af23110be6e..70d583aa44ad 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1041,7 +1041,7 @@ static void ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
 	partition_t *partition;
 
-	partition = kzalloc(sizeof(partition_t), GFP_KERNEL);
+	partition = kzalloc(sizeof(*partition), GFP_KERNEL);
 	if (!partition)
 		return;
 
-- 
2.11.0

