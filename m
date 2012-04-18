From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 18 Apr 2012 14:02:02 +0000
Subject: [PATCH] drivers/pcmcia/electra_cf.c: add missing iounmap and kfree
Message-Id: <1334757722-16187-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

cf and cf->mem_base have been allocated at the point of this failure, so
they should be freed before leaving the function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
I'm not sure to understand how the call to device_init_wakeup(&ofdev->dev,
0); fits in, but there seems to be no reason why this would more
appropriate in the error case a few lines below than in the error case here.

 drivers/pcmcia/electra_cf.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
index 7647d23..558d706 100644
--- a/drivers/pcmcia/electra_cf.c
+++ b/drivers/pcmcia/electra_cf.c
@@ -214,8 +214,10 @@ static int __devinit electra_cf_probe(struct platform_device *ofdev)
 	cf->io_size = PAGE_ALIGN(resource_size(&io));
 
 	area = __get_vm_area(cf->io_size, 0, PHB_IO_BASE, PHB_IO_END);
-	if (area = NULL)
-		return -ENOMEM;
+	if (area = NULL) {
+		status = -ENOMEM;
+		goto fail1;
+	}
 
 	cf->io_virt = (void __iomem *)(area->addr);
 

