From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 21:18:51 +0000
Subject: [PATCH] mfd/janz-cmodio: Delete an error message for a failed memory allocation in cmodio_pci_probe(
Message-Id: <5a66d47c-317f-1abd-7eb1-3a4f74843c78@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 22:15:09 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/janz-cmodio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index ec1f46a6be3a..317a47ad5bb7 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -183,10 +183,8 @@ static int cmodio_pci_probe(struct pci_dev *dev,
 	int ret;
 
 	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&dev->dev, "unable to allocate private data\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	pci_set_drvdata(dev, priv);
 	priv->pdev = dev;
-- 
2.15.1

