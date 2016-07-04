From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 04 Jul 2016 05:46:42 +0000
Subject: [PATCH] fsl/fman: fix error handling
Message-Id: <1467611202-15168-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, igal.liberman@freescale.com, rdunlap@infradead.org, standby24x7@gmail.com, arnd@arndb.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This is likely that checking 'fman->fifo_offset' instead of
'fman->cam_offset' is expected here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

---

The type of 'fifo_offset' may also need to be changed.
---
 drivers/net/ethernet/freescale/fman/fman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman.c b/drivers/net/ethernet/freescale/fman/fman.c
index 1de2e1e..f634e769 100644
--- a/drivers/net/ethernet/freescale/fman/fman.c
+++ b/drivers/net/ethernet/freescale/fman/fman.c
@@ -2036,7 +2036,7 @@ static int fman_init(struct fman *fman)
 	/* allocate MURAM for FIFO according to total size */
 	fman->fifo_offset = fman_muram_alloc(fman->muram,
 					     fman->state->total_fifo_size);
-	if (IS_ERR_VALUE(fman->cam_offset)) {
+	if (IS_ERR_VALUE(fman->fifo_offset)) {
 		free_init_resources(fman);
 		dev_err(fman->dev, "%s: MURAM alloc for BMI FIFO failed\n",
 			__func__);
-- 
2.7.4

