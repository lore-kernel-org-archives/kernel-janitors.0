From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:23 +0000
Subject: [PATCH 11/14] spi/topcliff-pch: drop double zeroing
Message-Id: <1600601186-7420-12-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,n,flags;
@@

x = 
- kcalloc
+ kmalloc_array
  (n,sizeof(*x),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/spi/spi-topcliff-pch.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -1002,7 +1002,7 @@ static void pch_spi_handle_dma(struct pc
 	spin_unlock_irqrestore(&data->lock, flags);
 
 	/* RX */
-	dma->sg_rx_p = kcalloc(num, sizeof(*dma->sg_rx_p), GFP_ATOMIC);
+	dma->sg_rx_p = kmalloc_array(num, sizeof(*dma->sg_rx_p), GFP_ATOMIC);
 	if (!dma->sg_rx_p)
 		return;
 
@@ -1065,7 +1065,7 @@ static void pch_spi_handle_dma(struct pc
 		head = 0;
 	}
 
-	dma->sg_tx_p = kcalloc(num, sizeof(*dma->sg_tx_p), GFP_ATOMIC);
+	dma->sg_tx_p = kmalloc_array(num, sizeof(*dma->sg_tx_p), GFP_ATOMIC);
 	if (!dma->sg_tx_p)
 		return;
 
