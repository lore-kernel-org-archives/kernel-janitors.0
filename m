From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:13 +0000
Subject: [PATCH 01/14] pch_uart: drop double zeroing
Message-Id: <1600601186-7420-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org

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
  (n,sizeof(struct scatterlist),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/tty/serial/pch_uart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -981,7 +981,7 @@ static unsigned int dma_handle_tx(struct
 
 	priv->tx_dma_use = 1;
 
-	priv->sg_tx_p = kcalloc(num, sizeof(struct scatterlist), GFP_ATOMIC);
+	priv->sg_tx_p = kmalloc_array(num, sizeof(struct scatterlist), GFP_ATOMIC);
 	if (!priv->sg_tx_p) {
 		dev_err(priv->port.dev, "%s:kzalloc Failed\n", __func__);
 		return 0;
