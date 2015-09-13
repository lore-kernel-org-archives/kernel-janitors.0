From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:11 +0000
Subject: [PATCH 18/39] whci: drop null test before destroy functions
Message-Id: <1442146532-9100-19-git-send-email-Julia.Lawall@lip6.fr>
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
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/whci/init.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/whci/init.c b/drivers/usb/host/whci/init.c
index d3e13b6..e363723 100644
--- a/drivers/usb/host/whci/init.c
+++ b/drivers/usb/host/whci/init.c
@@ -175,8 +175,7 @@ void whc_clean_up(struct whc *whc)
 	pzl_clean_up(whc);
 	asl_clean_up(whc);
 
-	if (whc->qset_pool)
-		dma_pool_destroy(whc->qset_pool);
+	dma_pool_destroy(whc->qset_pool);
 
 	len   = resource_size(&whc->umc->resource);
 	if (whc->base)

