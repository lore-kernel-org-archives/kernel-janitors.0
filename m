From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 20:52:07 +0000
Subject: [PATCH] mtd/inftlmount: Delete error messages for a failed memory allocation in two functions
Message-Id: <dd43ad50-ecc0-15b2-619d-da3a5b46dc91@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jan 2018 21:45:19 +0100

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/inftlmount.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 8d6bb189ea8e..e5dd55021602 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -273,19 +273,12 @@ static int find_boot_record(struct INFTLrecord *inftl)
 
 		/* Memory alloc */
 		inftl->PUtable = kmalloc(inftl->nb_blocks * sizeof(u16), GFP_KERNEL);
-		if (!inftl->PUtable) {
-			printk(KERN_WARNING "INFTL: allocation of PUtable "
-				"failed (%zd bytes)\n",
-				inftl->nb_blocks * sizeof(u16));
+		if (!inftl->PUtable)
 			return -ENOMEM;
-		}
 
 		inftl->VUtable = kmalloc(inftl->nb_blocks * sizeof(u16), GFP_KERNEL);
 		if (!inftl->VUtable) {
 			kfree(inftl->PUtable);
-			printk(KERN_WARNING "INFTL: allocation of VUtable "
-				"failed (%zd bytes)\n",
-				inftl->nb_blocks * sizeof(u16));
 			return -ENOMEM;
 		}
 
@@ -562,12 +555,8 @@ int INFTL_mount(struct INFTLrecord *s)
 
 	/* Temporary buffer to store ANAC numbers. */
 	ANACtable = kcalloc(s->nb_blocks, sizeof(u8), GFP_KERNEL);
-	if (!ANACtable) {
-		printk(KERN_WARNING "INFTL: allocation of ANACtable "
-				"failed (%zd bytes)\n",
-				s->nb_blocks * sizeof(u8));
+	if (!ANACtable)
 		return -ENOMEM;
-	}
 
 	/*
 	 * First pass is to explore each physical unit, and construct the
-- 
2.15.1

