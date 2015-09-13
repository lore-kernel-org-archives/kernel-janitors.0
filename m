From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:32 +0000
Subject: [PATCH 39/39] usb: host: drop null test before destroy functions
Message-Id: <1442146532-9100-40-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
@@

-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);

@@
expression x;
@@

-if (x != NULL) {
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
  x = NULL;
-}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/fotg210-hcd.c  |   12 ++++--------
 drivers/usb/host/fusbh200-hcd.c |   12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 000ed80..287d595 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -1976,17 +1976,13 @@ static void fotg210_mem_cleanup(struct fotg210_hcd *fotg210)
 	fotg210->dummy = NULL;
 
 	/* DMA consistent memory and pools */
-	if (fotg210->qtd_pool)
-		dma_pool_destroy(fotg210->qtd_pool);
+	dma_pool_destroy(fotg210->qtd_pool);
 	fotg210->qtd_pool = NULL;
 
-	if (fotg210->qh_pool) {
-		dma_pool_destroy(fotg210->qh_pool);
-		fotg210->qh_pool = NULL;
-	}
+	dma_pool_destroy(fotg210->qh_pool);
+	fotg210->qh_pool = NULL;
 
-	if (fotg210->itd_pool)
-		dma_pool_destroy(fotg210->itd_pool);
+	dma_pool_destroy(fotg210->itd_pool);
 	fotg210->itd_pool = NULL;
 
 	if (fotg210->periodic)
diff --git a/drivers/usb/host/fusbh200-hcd.c b/drivers/usb/host/fusbh200-hcd.c
index 1fd8718..b247d71 100644
--- a/drivers/usb/host/fusbh200-hcd.c
+++ b/drivers/usb/host/fusbh200-hcd.c
@@ -1927,17 +1927,13 @@ static void fusbh200_mem_cleanup (struct fusbh200_hcd *fusbh200)
 	fusbh200->dummy = NULL;
 
 	/* DMA consistent memory and pools */
-	if (fusbh200->qtd_pool)
-		dma_pool_destroy (fusbh200->qtd_pool);
+	dma_pool_destroy(fusbh200->qtd_pool);
 	fusbh200->qtd_pool = NULL;
 
-	if (fusbh200->qh_pool) {
-		dma_pool_destroy (fusbh200->qh_pool);
-		fusbh200->qh_pool = NULL;
-	}
+	dma_pool_destroy(fusbh200->qh_pool);
+	fusbh200->qh_pool = NULL;
 
-	if (fusbh200->itd_pool)
-		dma_pool_destroy (fusbh200->itd_pool);
+	dma_pool_destroy(fusbh200->itd_pool);
 	fusbh200->itd_pool = NULL;
 
 	if (fusbh200->periodic)

