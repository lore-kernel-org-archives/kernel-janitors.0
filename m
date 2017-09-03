From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Sep 2017 20:36:15 +0000
Subject: [PATCH 6/7] [media] Hexium Orion: Improve a size determination in hexium_probe()
Message-Id: <f98489bb-88c0-b16d-8f0e-31212e243634@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
In-Reply-To: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Sep 2017 20:00:17 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/saa7146/hexium_orion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index 72fac6a8494a..187e072a3697 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -219,5 +219,5 @@ static int hexium_probe(struct saa7146_dev *dev)
 		return -EFAULT;
 	}
 
-	hexium = kzalloc(sizeof(struct hexium), GFP_KERNEL);
+	hexium = kzalloc(sizeof(*hexium), GFP_KERNEL);
 	if (!hexium)
-- 
2.14.1

