From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 20:41:08 +0000
Subject: [PATCH 1/7] [media] Hopper: Delete an error message for a failed memory allocation in hopper_pci_pro
Message-Id: <e664da42-bfb2-17da-38c9-9086ada8f542@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
In-Reply-To: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 21:19:05 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/mantis/hopper_cards.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/mantis/hopper_cards.c b/drivers/media/pci/mantis/hopper_cards.c
index 68b5800030b7..cc1bb04d8cb4 100644
--- a/drivers/media/pci/mantis/hopper_cards.c
+++ b/drivers/media/pci/mantis/hopper_cards.c
@@ -168,4 +168,3 @@ static int hopper_pci_probe(struct pci_dev *pdev,
-		printk(KERN_ERR "%s ERROR: Out of memory\n", __func__);
 		err = -ENOMEM;
 		goto fail0;
 	}
-- 
2.14.1

