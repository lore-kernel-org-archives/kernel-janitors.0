From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 20:46:11 +0000
Subject: [PATCH 6/7] [media] Mantis: Improve a size determination in mantis_pci_probe()
Message-Id: <f50ebe4b-a614-3a78-892b-10ce2f0342e1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
In-Reply-To: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 21:56:07 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/mantis/mantis_cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mantis/mantis_cards.c b/drivers/media/pci/mantis/mantis_cards.c
index 56a01f6f84c7..6182ae44dd23 100644
--- a/drivers/media/pci/mantis/mantis_cards.c
+++ b/drivers/media/pci/mantis/mantis_cards.c
@@ -173,5 +173,5 @@ static int mantis_pci_probe(struct pci_dev *pdev,
 	struct mantis_hwconfig *config;
 	int err = 0;
 
-	mantis = kzalloc(sizeof(struct mantis_pci), GFP_KERNEL);
+	mantis = kzalloc(sizeof(*mantis), GFP_KERNEL);
 	if (!mantis)
-- 
2.14.1

