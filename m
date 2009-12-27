From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Dec 2009 21:27:44 +0000
Subject: [PATCH 4/5] drivers/net/can: Correct NULL test
Message-Id: <Pine.LNX.4.64.0912272227290.20548@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Urs Thuermann <urs.thuermann@volkswagen.de>, Oliver Hartkopp <oliver.hartkopp@volkswagen.de>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the just-allocated value for NULL rather than some other value.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,y;
statement S;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
(
if ((x) = NULL) S
|
if (
-   y
+   x
       = NULL)
 S
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/can/mcp251x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/net/can/mcp251x.c b/drivers/net/can/mcp251x.c
--- a/drivers/net/can/mcp251x.c
+++ b/drivers/net/can/mcp251x.c
@@ -990,7 +990,7 @@ static int __devinit mcp251x_can_probe(s
 			goto error_tx_buf;
 		}
 		priv->spi_rx_buf = kmalloc(SPI_TRANSFER_BUF_LEN, GFP_KERNEL);
-		if (!priv->spi_tx_buf) {
+		if (!priv->spi_rx_buf) {
 			ret = -ENOMEM;
 			goto error_rx_buf;
 		}
