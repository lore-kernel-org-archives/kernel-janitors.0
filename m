From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 20:45:07 +0000
Subject: [PATCH 5/7] [media] Mantis: Delete an error message for a failed memory allocation in mantis_pci_pro
Message-Id: <a3d1d847-978a-101e-cadb-2b2d7f5e73f1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
In-Reply-To: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 21:55:05 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/mantis/mantis_cards.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/mantis/mantis_cards.c b/drivers/media/pci/mantis/mantis_cards.c
index cdefffc16d9e..56a01f6f84c7 100644
--- a/drivers/media/pci/mantis/mantis_cards.c
+++ b/drivers/media/pci/mantis/mantis_cards.c
@@ -177,7 +177,5 @@ static int mantis_pci_probe(struct pci_dev *pdev,
-	if (mantis = NULL) {
-		printk(KERN_ERR "%s ERROR: Out of memory\n", __func__);
+	if (!mantis)
 		return -ENOMEM;
-	}
 
 	drvdata			= (void *)pci_id->driver_data;
 	mantis->num		= devs;
-- 
2.14.1

