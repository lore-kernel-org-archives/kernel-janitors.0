From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Jan 2015 19:05:01 +0000
Subject: [PATCH 2/2] PCMCIA: Less function calls in bcm63xx_drv_pcmcia_probe() after error detection
Message-Id: <54BC03DD.30608@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54BC02D2.8010008@users.sourceforge.net>
In-Reply-To: <54BC02D2.8010008@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Jan 2015 19:45:45 +0100

The functions "iounmap", "kfree" and "release_mem_region" were called in some
cases by the bcm63xx_drv_pcmcia_probe() function during error handling
even if the passed variable contained a null pointer.

* Corresponding details could be improved by adjustments for jump labels.

* Let us delete also another unnecessary check for the data structure
  member "reg_res" there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/bcm63xx_pcmcia.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index 9e7ad1b..9848d91a2 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -346,7 +346,7 @@ static int bcm63xx_drv_pcmcia_probe(struct platform_device *pdev)
 	skt->pd = pdev->dev.platform_data;
 	if (!skt->common_res || !skt->attr_res || !irq_res || !skt->pd) {
 		ret = -EINVAL;
-		goto err;
+		goto free_memory;
 	}
 
 	/* remap pcmcia registers */
@@ -354,14 +354,14 @@ static int bcm63xx_drv_pcmcia_probe(struct platform_device *pdev)
 	regmem_size = resource_size(res);
 	if (!request_mem_region(res->start, regmem_size, "bcm63xx_pcmcia")) {
 		ret = -EINVAL;
-		goto err;
+		goto free_memory;
 	}
 	skt->reg_res = res;
 
 	skt->base = ioremap(res->start, regmem_size);
 	if (!skt->base) {
 		ret = -ENOMEM;
-		goto err;
+		goto release_memory_region;
 	}
 
 	/* remap io registers */
@@ -370,7 +370,7 @@ static int bcm63xx_drv_pcmcia_probe(struct platform_device *pdev)
 	skt->io_base = ioremap(res->start, iomem_size);
 	if (!skt->io_base) {
 		ret = -ENOMEM;
-		goto err;
+		goto io_unmap_base;
 	}
 
 	/* resources are static */
@@ -427,9 +427,11 @@ static int bcm63xx_drv_pcmcia_probe(struct platform_device *pdev)
 
 err:
 	iounmap(skt->io_base);
+io_unmap_base:
 	iounmap(skt->base);
-	if (skt->reg_res)
-		release_mem_region(skt->reg_res->start, regmem_size);
+release_memory_region:
+	release_mem_region(skt->reg_res->start, regmem_size);
+free_memory:
 	kfree(skt);
 	return ret;
 }
-- 
2.2.2

