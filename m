From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 09:10:07 +0000
Subject: [PATCH 1/2] n2rng: Use devm_kcalloc() in n2rng_probe()
Message-Id: <38c41219-7e7f-3a3e-29dd-04ae2d57beaa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d9fbb01-e12f-eb5c-7ecd-5a2a10fd5110@users.sourceforge.net>
In-Reply-To: <4d9fbb01-e12f-eb5c-7ecd-5a2a10fd5110@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Shannon Nelson <shannon.nelson@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 10:30:47 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "devm_kcalloc".

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/hw_random/n2-drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-drv.c
index 31cbdbbaebfc..92dd4e925315 100644
--- a/drivers/char/hw_random/n2-drv.c
+++ b/drivers/char/hw_random/n2-drv.c
@@ -748,9 +748,7 @@ static int n2rng_probe(struct platform_device *op)
 
 	dev_info(&op->dev, "Registered RNG HVAPI major %lu minor %lu\n",
 		 np->hvapi_major, np->hvapi_minor);
-
-	np->units = devm_kzalloc(&op->dev,
-				 sizeof(struct n2rng_unit) * np->num_units,
+	np->units = devm_kcalloc(&op->dev, np->num_units, sizeof(*np->units),
 				 GFP_KERNEL);
 	err = -ENOMEM;
 	if (!np->units)
-- 
2.12.2

