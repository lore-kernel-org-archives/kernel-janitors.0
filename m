From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 Aug 2014 08:20:50 +0000
Subject: [PATCH] block: add abort on failure
Message-Id: <1407486050-9375-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Morris <josh.h.morris@us.ibm.com>, Jeff Moyer <jmoyer@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initializing card seems to be critical to the rest of the probe process, so
abort the probe function if the calls to rsxx_load_config and
rsxx_get_num_targets do not succeed.

Suggested by Jeff Moyer.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/rsxx/core.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index a8de2ee..ae2805b 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -915,15 +915,19 @@ static int rsxx_pci_probe(struct pci_dev *dev,
 
 	/************* Load Card Config *************/
 	st = rsxx_load_config(card);
-	if (st)
+	if (st) {
 		dev_err(CARD_TO_DEV(card),
 			"Failed loading card config\n");
+		goto failed_dma_setup;
+	}
 
 	/************* Setup DMA Engine *************/
 	st = rsxx_get_num_targets(card, &card->n_targets);
-	if (st)
+	if (st) {
 		dev_info(CARD_TO_DEV(card),
 			"Failed reading the number of DMA targets\n");
+		goto failed_dma_setup;
+	}
 
 	card->ctrl = kzalloc(card->n_targets * sizeof(*card->ctrl), GFP_KERNEL);
 	if (!card->ctrl) {

