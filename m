From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 14:03:55 +0000
Subject: [PATCH] mtd/maps/vmu-flash: Delete an error message for a failed memory allocation in maple_vmu_read
Message-Id: <efc677c8-35c6-dd97-2091-8daa91576602@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 14:54:08 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/maps/vmu-flash.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 6b223cfe92b7..a76a5ff402e1 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -130,9 +130,6 @@ static int maple_vmu_read_block(unsigned int num, unsigned char *buf,
 	if (!pcache->buffer) {
 		pcache->buffer = kmalloc(card->blocklen, GFP_KERNEL);
 		if (!pcache->buffer) {
-			dev_err(&mdev->dev, "VMU at (%d, %d) - read fails due"
-				" to lack of memory\n", mdev->port,
-				mdev->unit);
 			error = -ENOMEM;
 			goto outB;
 		}
-- 
2.15.1

