From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Mar 2012 21:49:02 +0000
Subject: [PATCH 3/7] drivers/net/irda/{ali-ircc,via-ircc,w83977af-ir}.c: ensure arguments to request_irq and
Message-Id: <1331502542-18094-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331494587-12196-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331494587-12196-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel@sortiz.org>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert calls to free_irq so that the second argument is the same as the
last argument of the corresponding call to request_irq.  Without this
property, free_irq does nothing.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Version 2, avoids changing request_irq.

 drivers/net/irda/ali-ircc.c    |    2 +-
 drivers/net/irda/via-ircc.c    |    4 ++--
 drivers/net/irda/w83977af_ir.c |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/irda/ali-ircc.c b/drivers/net/irda/ali-ircc.c
index 963067d..dcc80d6 100644
--- a/drivers/net/irda/ali-ircc.c
+++ b/drivers/net/irda/ali-ircc.c
@@ -1368,7 +1368,7 @@ static int ali_ircc_net_open(struct net_device *dev)
 		IRDA_WARNING("%s, unable to allocate dma=%d\n",
 			     ALI_IRCC_DRIVER_NAME,
 			     self->io.dma);
-		free_irq(self->io.irq, self);
+		free_irq(self->io.irq, dev);
 		return -EAGAIN;
 	}
 	
diff --git a/drivers/net/irda/via-ircc.c b/drivers/net/irda/via-ircc.c
index 2d456dd..1a89fd4 100644
--- a/drivers/net/irda/via-ircc.c
+++ b/drivers/net/irda/via-ircc.c
@@ -1495,14 +1495,14 @@ static int via_ircc_net_open(struct net_device *dev)
 	if (request_dma(self->io.dma, dev->name)) {
 		IRDA_WARNING("%s, unable to allocate dma=%d\n", driver_name,
 			     self->io.dma);
-		free_irq(self->io.irq, self);
+		free_irq(self->io.irq, dev);
 		return -EAGAIN;
 	}
 	if (self->io.dma2 != self->io.dma) {
 		if (request_dma(self->io.dma2, dev->name)) {
 			IRDA_WARNING("%s, unable to allocate dma2=%d\n",
 				     driver_name, self->io.dma2);
-			free_irq(self->io.irq, self);
+			free_irq(self->io.irq, dev);
 			free_dma(self->io.dma);
 			return -EAGAIN;
 		}
diff --git a/drivers/net/irda/w83977af_ir.c b/drivers/net/irda/w83977af_ir.c
index 7d43506..f5bb92f 100644
--- a/drivers/net/irda/w83977af_ir.c
+++ b/drivers/net/irda/w83977af_ir.c
@@ -1172,7 +1172,7 @@ static int w83977af_net_open(struct net_device *dev)
 	 * and clean up on failure.
 	 */
 	if (request_dma(self->io.dma, dev->name)) {
-		free_irq(self->io.irq, self);
+		free_irq(self->io.irq, dev);
 		return -EAGAIN;
 	}
 		
