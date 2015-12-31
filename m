From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Dec 2015 20:25:57 +0000
Subject: [PATCH 1/3] mtd-rfd_ftl: Replace a variable initialisation by assignments in move_block_contents()
Message-Id: <56858F55.7040604@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56858E3A.7000706@users.sourceforge.net>
In-Reply-To: <56858E3A.7000706@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Dec 2015 20:34:51 +0100

Replace an explicit initialisation for the variable "rc" at the beginning
by assignments that will only be performed if a memory allocation failed.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index d1cbf26..2927e1b 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -359,17 +359,21 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 	void *sector_data;
 	u16 *map;
 	size_t retlen;
-	int i, rc = -ENOMEM;
+	int i, rc;
 
 	part->is_reclaiming = 1;
 
 	sector_data = kmalloc(SECTOR_SIZE, GFP_KERNEL);
-	if (!sector_data)
+	if (!sector_data) {
+		rc = -ENOMEM;
 		goto err3;
+	}
 
 	map = kmalloc(part->header_size, GFP_KERNEL);
-	if (!map)
+	if (!map) {
+		rc = -ENOMEM;
 		goto err2;
+	}
 
 	rc = mtd_read(part->mbd.mtd, part->blocks[block_no].offset,
 		      part->header_size, &retlen, (u_char *)map);
-- 
2.6.3

