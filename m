From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 19:29:49 +0000
Subject: [PATCH 1/2] mtdconcat: Delete an error message for a failed memory allocation in mtd_concat_create()
Message-Id: <53f3fdb5-c216-c4b1-cb9f-c5945ec56749@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07947bdd-2b30-e4b5-82f7-d98b62df858e@users.sourceforge.net>
In-Reply-To: <07947bdd-2b30-e4b5-82f7-d98b62df858e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 19:55:10 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/mtdconcat.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 60bf53df5454..f1a60c55a126 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -668,12 +668,9 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	/* allocate the device structure */
 	size = SIZEOF_STRUCT_MTD_CONCAT(num_devs);
 	concat = kzalloc(size, GFP_KERNEL);
-	if (!concat) {
-		printk
-		    ("memory allocation error while creating concatenated device \"%s\"\n",
-		     name);
+	if (!concat)
 		return NULL;
-	}
+
 	concat->subdev = (struct mtd_info **) (concat + 1);
 
 	/*
-- 
2.15.1

