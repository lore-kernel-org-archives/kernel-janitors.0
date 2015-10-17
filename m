From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 17 Oct 2015 09:32:20 +0000
Subject: [PATCH 2/2] [media] netup_unidvb: delete null dereference
Message-Id: <1445074340-21955-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445074340-21955-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445074340-21955-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Kozlov <serjk@netup.ru>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The calls to dev_dbg will not work properly when spi is NULL.  Just use
pr_debug instead.

Problem found using scripts/coccinelle/null/deref_null.cocci

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/pci/netup_unidvb/netup_unidvb_spi.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c b/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
index f55b327..026895f 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
@@ -81,8 +81,7 @@ irqreturn_t netup_spi_interrupt(struct netup_spi *spi)
 	unsigned long flags;
 
 	if (!spi) {
-		dev_dbg(&spi->master->dev,
-			"%s(): SPI not initialized\n", __func__);
+		pr_debug("%s(): SPI not initialized\n", __func__);
 		return IRQ_NONE;
 	}
 	spin_lock_irqsave(&spi->lock, flags);
@@ -235,8 +234,7 @@ void netup_spi_release(struct netup_unidvb_dev *ndev)
 	struct netup_spi *spi = ndev->spi;
 
 	if (!spi) {
-		dev_dbg(&spi->master->dev,
-			"%s(): SPI not initialized\n", __func__);
+		pr_debug("%s(): SPI not initialized\n", __func__);
 		return;
 	}
 	spin_lock_irqsave(&spi->lock, flags);

