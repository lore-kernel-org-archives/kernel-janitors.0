From: Christopher Diaz Riveros <chrisadr@gentoo.org>
Date: Tue, 20 Feb 2018 16:35:53 +0000
Subject: [PATCH-next] staging: emxx_udc: Remove unneeded cast
Message-Id: <20180220163553.14553-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix Coccinelle alert:

drivers/staging//emxx_udc/emxx_udc.c:2689:19-21: WARNING: casting value returned by memory allocation function to (u8 *) is useless.

This issue was detected by using the Coccinelle software.

Signed-off-by: Christopher Diaz Riveros <chrisadr@gentoo.org>
---
 drivers/staging/emxx_udc/emxx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index 7517001fb8f0..ad69a1e536a7 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2686,7 +2686,7 @@ static int nbu2ss_ep_queue(
 
 	if (req->unaligned) {
 		if (!ep->virt_buf)
-			ep->virt_buf = (u8 *)dma_alloc_coherent(
+			ep->virt_buf = dma_alloc_coherent(
 				NULL, PAGE_SIZE,
 				&ep->phys_buf, GFP_ATOMIC | GFP_DMA);
 		if (ep->epnum > 0)  {
-- 
2.16.2

