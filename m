From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Feb 2014 07:36:13 +0000
Subject: [PATCH 3/3] caif: delete unnecessary field initialization
Message-Id: <1392449773-23429-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

On success, the function netdev_alloc_skb initializes the dev field of its
result to its first argument, so this doesn't have to be done in the
calling context.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression skb,privn,e;
@@

skb = netdev_alloc_skb(privn,...);
... when strict
(
-skb->dev = privn;
|
?skb = e
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/caif/caif_serial.c |    1 -
 drivers/net/caif/caif_spi.c    |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
index 88a6a58..fc73865 100644
--- a/drivers/net/caif/caif_serial.c
+++ b/drivers/net/caif/caif_serial.c
@@ -204,7 +204,6 @@ static void ldisc_receive(struct tty_struct *tty, const u8 *data,
 
 	skb->protocol = htons(ETH_P_CAIF);
 	skb_reset_mac_header(skb);
-	skb->dev = ser->dev;
 	debugfs_rx(ser, data, count);
 	/* Push received packet up the stack. */
 	ret = netif_rx_ni(skb);
diff --git a/drivers/net/caif/caif_spi.c b/drivers/net/caif/caif_spi.c
index 155db68..ff54c0e 100644
--- a/drivers/net/caif/caif_spi.c
+++ b/drivers/net/caif/caif_spi.c
@@ -554,7 +554,6 @@ int cfspi_rxfrm(struct cfspi *cfspi, u8 *buf, size_t len)
 
 		skb->protocol = htons(ETH_P_CAIF);
 		skb_reset_mac_header(skb);
-		skb->dev = cfspi->ndev;
 
 		/*
 		 * Push received packet up the stack.

