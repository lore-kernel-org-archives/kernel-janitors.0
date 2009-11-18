From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:24:13 +0000
Subject: [PATCH 11/16] drivers/net/via-velocity.c: remove exceptional & on
Message-Id: <Pine.LNX.4.64.0911181923540.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/net/via-velocity.c          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/via-velocity.c b/drivers/net/via-velocity.c
index 158f411..1e6b395 100644
--- a/drivers/net/via-velocity.c
+++ b/drivers/net/via-velocity.c
@@ -2176,7 +2176,7 @@ static int velocity_open(struct net_device *dev)
 
 	velocity_init_registers(vptr, VELOCITY_INIT_COLD);
 
-	ret = request_irq(vptr->pdev->irq, &velocity_intr, IRQF_SHARED,
+	ret = request_irq(vptr->pdev->irq, velocity_intr, IRQF_SHARED,
 			  dev->name, dev);
 	if (ret < 0) {
 		/* Power down the chip */
