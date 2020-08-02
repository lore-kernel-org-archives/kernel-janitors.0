From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Aug 2020 15:10:59 +0000
Subject: [PATCH] atm: idt77252: Fix the size used in a 'dma_alloc_coherent()' call
Message-Id: <20200802151059.699977-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 3chas3@gmail.com
Cc: linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This should be TSQSIZE in order to be consistent with the surrounding code
and the corresponding 'dma_free_coherent()' in 'deinit_tsq()'

This is harmless because RSQSIZE and TSQSIZE have the same value (i.e.
8192)

Fixes: 	1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/atm/idt77252.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index df51680e8931..f459fafa902a 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -1373,7 +1373,7 @@ init_tsq(struct idt77252_dev *card)
 {
 	struct tsq_entry *tsqe;
 
-	card->tsq.base = dma_alloc_coherent(&card->pcidev->dev, RSQSIZE,
+	card->tsq.base = dma_alloc_coherent(&card->pcidev->dev, TSQSIZE,
 					    &card->tsq.paddr, GFP_KERNEL);
 	if (card->tsq.base = NULL) {
 		printk("%s: can't allocate TSQ.\n", card->name);
-- 
2.25.1
