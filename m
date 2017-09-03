From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Sep 2017 20:37:21 +0000
Subject: [PATCH 7/7] [media] Hexium Orion: Adjust one function call together with a variable assignment
Message-Id: <fa33d58b-56c4-38aa-8346-6f6e9f3d5296@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
In-Reply-To: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Sep 2017 20:12:36 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/saa7146/hexium_orion.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index 187e072a3697..691472763696 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -266,7 +266,9 @@ static int hexium_probe(struct saa7146_dev *dev)
 
 	/* check if this is an old hexium Orion card by looking at
 	   a saa7110 at address 0x4e */
-	if (0 = (err = i2c_smbus_xfer(&hexium->i2c_adapter, 0x4e, 0, I2C_SMBUS_READ, 0x00, I2C_SMBUS_BYTE_DATA, &data))) {
+	err = i2c_smbus_xfer(&hexium->i2c_adapter, 0x4e, 0, I2C_SMBUS_READ,
+			     0x00, I2C_SMBUS_BYTE_DATA, &data);
+	if (err = 0) {
 		pr_info("device is a Hexium HV-PCI6/Orion (old)\n");
 		/* we store the pointer in our private data field */
 		dev->ext_priv = hexium;
-- 
2.14.1

