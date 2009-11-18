From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:20:44 +0000
Subject: [PATCH 2/16] drivers/net/can: remove exceptional & on function name
Message-Id: <Pine.LNX.4.64.0911181920250.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Urs Thuermann <urs.thuermann@volkswagen.de>, Oliver Hartkopp <oliver.hartkopp@volkswagen.de>, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this file, function names are otherwise used as pointers without &.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier f;
@@

f(...) { ... }

@@
identifier r.f;
@@

- &f
+ f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/can/sja1000/sja1000.c   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/can/sja1000/sja1000.c b/drivers/net/can/sja1000/sja1000.c
index 782a47f..b4ba88a 100644
--- a/drivers/net/can/sja1000/sja1000.c
+++ b/drivers/net/can/sja1000/sja1000.c
@@ -516,7 +516,7 @@ static int sja1000_open(struct net_device *dev)
 
 	/* register interrupt handler, if not done by the device driver */
 	if (!(priv->flags & SJA1000_CUSTOM_IRQ_HANDLER)) {
-		err = request_irq(dev->irq, &sja1000_interrupt, priv->irq_flags,
+		err = request_irq(dev->irq, sja1000_interrupt, priv->irq_flags,
 				  dev->name, (void *)dev);
 		if (err) {
 			close_candev(dev);
