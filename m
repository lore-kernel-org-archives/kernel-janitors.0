From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Sep 2017 20:33:02 +0000
Subject: [PATCH 3/7] [media] Hexium Gemini: Delete an error message for a failed memory allocation in hexium_
Message-Id: <1c4c1193-be5a-1fc8-718e-373a45b66e2a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
In-Reply-To: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Sep 2017 19:23:37 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/saa7146/hexium_gemini.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index c889ec9f8a5a..694b70fa3baf 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -264,7 +264,6 @@ static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_d
-	if (NULL = hexium) {
-		pr_err("not enough kernel memory in hexium_attach()\n");
+	if (!hexium)
 		return -ENOMEM;
-	}
+
 	dev->ext_priv = hexium;
 
 	/* enable i2c-port pins */
-- 
2.14.1

