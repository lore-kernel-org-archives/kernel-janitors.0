From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 14 Aug 2013 09:11:13 +0000
Subject: [PATCH 9/29] drivers/char/hw_random/tx4939-rng.c: simplify use of devm_ioremap_resource
Message-Id: <1376471493-22215-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: kernel-janitors@vger.kernel.org, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

Move the call to platform_get_resource adjacent to the call to
devm_ioremap_resource to make the connection between them more clear.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res = NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/char/hw_random/tx4939-rng.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/tx4939-rng.c b/drivers/char/hw_random/tx4939-rng.c
index 00593c8..09c5fbe 100644
--- a/drivers/char/hw_random/tx4939-rng.c
+++ b/drivers/char/hw_random/tx4939-rng.c
@@ -110,12 +110,10 @@ static int __init tx4939_rng_probe(struct platform_device *dev)
 	struct resource *r;
 	int i;
 
-	r = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!r)
-		return -EBUSY;
 	rngdev = devm_kzalloc(&dev->dev, sizeof(*rngdev), GFP_KERNEL);
 	if (!rngdev)
 		return -ENOMEM;
+	r = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	rngdev->base = devm_ioremap_resource(&dev->dev, r);
 	if (IS_ERR(rngdev->base))
 		return PTR_ERR(rngdev->base);

