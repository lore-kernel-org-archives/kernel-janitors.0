From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 10 Jun 2018 14:24:14 +0000
Subject: [PATCH] parport: sunbpp: fix error return code
Message-Id: <1528640655-18948-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Return an error code on failure.  Change leading spaces to tab on the
first if.

Problem found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/parport/parport_sunbpp.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/parport/parport_sunbpp.c b/drivers/parport/parport_sunbpp.c
index 01cf1c1..8de3295 100644
--- a/drivers/parport/parport_sunbpp.c
+++ b/drivers/parport/parport_sunbpp.c
@@ -286,12 +286,16 @@ static int bpp_probe(struct platform_device *op)
 
 	ops = kmemdup(&parport_sunbpp_ops, sizeof(struct parport_operations),
 		      GFP_KERNEL);
-        if (!ops)
+	if (!ops) {
+		err = -ENOMEM;
 		goto out_unmap;
+	}
 
 	dprintk(("register_port\n"));
-	if (!(p = parport_register_port((unsigned long)base, irq, dma, ops)))
+	if (!(p = parport_register_port((unsigned long)base, irq, dma, ops))) {
+		err = -ENOMEM;
 		goto out_free_ops;
+	}
 
 	p->size = size;
 	p->dev = &op->dev;

