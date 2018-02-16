From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 12:39:35 +0000
Subject: [PATCH 2/3] pata_macio: Improve a size determination in two functions
Message-Id: <44765718-d832-c58b-6055-91c7c9b11b73@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e87cf7d-eda2-12d9-af01-17f6619cda72@users.sourceforge.net>
In-Reply-To: <1e87cf7d-eda2-12d9-af01-17f6619cda72@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 13:08:14 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ata/pata_macio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index 9588e685d994..dc40af4c615c 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -1129,8 +1129,7 @@ static int pata_macio_attach(struct macio_dev *mdev,
 	macio_enable_devres(mdev);
 
 	/* Allocate and init private data structure */
-	priv = devm_kzalloc(&mdev->ofdev.dev,
-			    sizeof(struct pata_macio_priv), GFP_KERNEL);
+	priv = devm_kzalloc(&mdev->ofdev.dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -1273,8 +1272,7 @@ static int pata_macio_pci_attach(struct pci_dev *pdev,
 	}
 
 	/* Allocate and init private data structure */
-	priv = devm_kzalloc(&pdev->dev,
-			    sizeof(struct pata_macio_priv), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-- 
2.16.1

