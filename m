From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 20:42:07 +0000
Subject: [PATCH 2/7] [media] Hopper: Improve a size determination in hopper_pci_probe()
Message-Id: <e008a449-14a8-b754-a353-25a8d463a2d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
In-Reply-To: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 21:21:22 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/mantis/hopper_cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mantis/hopper_cards.c b/drivers/media/pci/mantis/hopper_cards.c
index cc1bb04d8cb4..fe7b40c306f7 100644
--- a/drivers/media/pci/mantis/hopper_cards.c
+++ b/drivers/media/pci/mantis/hopper_cards.c
@@ -163,7 +163,7 @@ static int hopper_pci_probe(struct pci_dev *pdev,
 	struct mantis_hwconfig *config;
 	int err = 0;
 
-	mantis = kzalloc(sizeof(struct mantis_pci), GFP_KERNEL);
+	mantis = kzalloc(sizeof(*mantis), GFP_KERNEL);
 	if (mantis = NULL) {
 		err = -ENOMEM;
 		goto fail0;
-- 
2.14.1

