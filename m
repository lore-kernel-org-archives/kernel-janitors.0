From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 20:43:10 +0000
Subject: [PATCH 3/7] [media] Hopper: Adjust a null pointer check in two functions
Message-Id: <56d490a2-4159-204f-cd69-16fd9b268f29@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
In-Reply-To: <9ba22d42-0ec0-b865-dec5-4ce67ad443fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 21:25:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/mantis/hopper_cards.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/mantis/hopper_cards.c b/drivers/media/pci/mantis/hopper_cards.c
index fe7b40c306f7..88e5b2a97005 100644
--- a/drivers/media/pci/mantis/hopper_cards.c
+++ b/drivers/media/pci/mantis/hopper_cards.c
@@ -72,7 +72,7 @@ static irqreturn_t hopper_irq_handler(int irq, void *dev_id)
 	struct mantis_ca *ca;
 
 	mantis = (struct mantis_pci *) dev_id;
-	if (unlikely(mantis = NULL)) {
+	if (unlikely(!mantis)) {
 		dprintk(MANTIS_ERROR, 1, "Mantis = NULL");
 		return IRQ_NONE;
 	}
@@ -164,7 +164,7 @@ static int hopper_pci_probe(struct pci_dev *pdev,
 	int err = 0;
 
 	mantis = kzalloc(sizeof(*mantis), GFP_KERNEL);
-	if (mantis = NULL) {
+	if (!mantis) {
 		err = -ENOMEM;
 		goto fail0;
 	}
-- 
2.14.1

