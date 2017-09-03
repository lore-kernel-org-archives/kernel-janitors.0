From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Sep 2017 20:35:06 +0000
Subject: [PATCH 5/7] [media] Hexium Orion: Delete an error message for a failed memory allocation in hexium_p
Message-Id: <80c8a86a-5b26-0c40-5d71-730870958556@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
In-Reply-To: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Sep 2017 19:55:25 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/saa7146/hexium_orion.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index c306a92e8909..72fac6a8494a 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -223,7 +223,5 @@ static int hexium_probe(struct saa7146_dev *dev)
-	if (NULL = hexium) {
-		pr_err("hexium_probe: not enough kernel memory\n");
+	if (!hexium)
 		return -ENOMEM;
-	}
 
 	/* enable i2c-port pins */
 	saa7146_write(dev, MC1, (MASK_08 | MASK_24 | MASK_10 | MASK_26));
-- 
2.14.1

