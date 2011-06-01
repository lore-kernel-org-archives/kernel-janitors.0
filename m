From: Julia Lawall <julia@diku.dk>
Date: Wed, 01 Jun 2011 17:10:04 +0000
Subject: [PATCH 1/10] drivers/char/hw_random/omap-rng.c: add missing clk_put
Message-Id: <1306948213-20767-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepak Saxena <dsaxena@plexity.net>
Cc: kernel-janitors@vger.kernel.org, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.hengli.com.au>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Convert a return to a jump to an existing label that calls clk_put.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression e1,e2;
statement S;
@@

e1 = clk_get@p1(...);
... when != e1 = e2
    when != clk_put(e1)
    when any
if (...) { ... when != clk_put(e1)
               when != if (...) { ... clk_put(e1) ... }
* return@p3 ...;
 } else S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/hw_random/omap-rng.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/omap-rng.c
index 2cc755a..b757fac 100644
--- a/drivers/char/hw_random/omap-rng.c
+++ b/drivers/char/hw_random/omap-rng.c
@@ -113,8 +113,10 @@ static int __devinit omap_rng_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	if (!res)
-		return -ENOENT;
+	if (!res) {
+		ret = -ENOENT;
+		goto err_region;
+	}
 
 	if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
 		ret = -EBUSY;

