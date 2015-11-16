From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Nov 2015 18:05:52 +0000
Subject: [PATCH] USB-EHCI: Delete unnecessary checks before the function call "dma_pool_destroy"
Message-Id: <564A1B00.8030507@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Nov 2015 19:01:44 +0100

The dma_pool_destroy() function tests whether its argument is NULL
and then returns immediately. Thus the test around the calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/ehci-mem.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/ehci-mem.c b/drivers/usb/host/ehci-mem.c
index b6205fa..4de4301 100644
--- a/drivers/usb/host/ehci-mem.c
+++ b/drivers/usb/host/ehci-mem.c
@@ -128,21 +128,13 @@ static void ehci_mem_cleanup (struct ehci_hcd *ehci)
 	ehci->dummy = NULL;
 
 	/* DMA consistent memory and pools */
-	if (ehci->qtd_pool)
-		dma_pool_destroy (ehci->qtd_pool);
+	dma_pool_destroy(ehci->qtd_pool);
 	ehci->qtd_pool = NULL;
-
-	if (ehci->qh_pool) {
-		dma_pool_destroy (ehci->qh_pool);
-		ehci->qh_pool = NULL;
-	}
-
-	if (ehci->itd_pool)
-		dma_pool_destroy (ehci->itd_pool);
+	dma_pool_destroy(ehci->qh_pool);
+	ehci->qh_pool = NULL;
+	dma_pool_destroy(ehci->itd_pool);
 	ehci->itd_pool = NULL;
-
-	if (ehci->sitd_pool)
-		dma_pool_destroy (ehci->sitd_pool);
+	dma_pool_destroy(ehci->sitd_pool);
 	ehci->sitd_pool = NULL;
 
 	if (ehci->periodic)
-- 
2.6.2

