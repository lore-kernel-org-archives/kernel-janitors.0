From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 20 Nov 2014 17:34:02 +0000
Subject: [PATCH 7/7] parport_sunbpp: fix error return code
Message-Id: <1416504842-18548-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

The patch also removes a newly unnecessary initialization of err, replaces
spaces by a tab, and pulls an assignment out of a conditional test
expression.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series are independent of each other.

 drivers/parport/parport_sunbpp.c |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/parport/parport_sunbpp.c b/drivers/parport/parport_sunbpp.c
index 01cf1c1..14f4cb8 100644
--- a/drivers/parport/parport_sunbpp.c
+++ b/drivers/parport/parport_sunbpp.c
@@ -269,7 +269,7 @@ static int bpp_probe(struct platform_device *op)
 {
 	struct parport_operations *ops;
 	struct bpp_regs __iomem *regs;
-	int irq, dma, err = 0, size;
+	int irq, dma, err, size;
 	unsigned char value_tcr;
 	void __iomem *base;
 	struct parport *p;
@@ -286,12 +286,17 @@ static int bpp_probe(struct platform_device *op)
 
 	ops = kmemdup(&parport_sunbpp_ops, sizeof(struct parport_operations),
 		      GFP_KERNEL);
-        if (!ops)
+	if (!ops) {
+		err = -ENOMEM;
 		goto out_unmap;
+	}
 
 	dprintk(("register_port\n"));
-	if (!(p = parport_register_port((unsigned long)base, irq, dma, ops)))
+	p = parport_register_port((unsigned long)base, irq, dma, ops);
+	if (!p) {
+		err = -ENOMEM;
 		goto out_free_ops;
+	}
 
 	p->size = size;
 	p->dev = &op->dev;

