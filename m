From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 24 Jan 2021 07:39:55 +0000
Subject: [PATCH] mtd: rawnand: Fix an error handling path in 'ebu_dma_start()'
Message-Id: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, vadivel.muruganx.ramuthevar@linux.intel.com, martin.blumenstingl@googlemail.com
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

If 'dmaengine_prep_slave_single()' fails, we must undo a previous
'dma_map_single()' call, as already done in all the other error handling
paths of this function.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index a304fda5d1fa..8b49fd56cf96 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -318,8 +318,10 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	}
 
 	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
-	if (!tx)
-		return -ENXIO;
+	if (!tx) {
+		ret = -ENXIO;
+		goto err_unmap;
+	}
 
 	tx->callback = callback;
 	tx->callback_param = ebu_host;
-- 
2.27.0
