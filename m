From: Julia Lawall <julia@diku.dk>
Date: Sat, 06 Feb 2010 08:44:15 +0000
Subject: [PATCH 8/11] drivers/net: Correct NULL test
Message-Id: <Pine.LNX.4.64.1002060943580.8092@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <p_gortmaker@yahoo.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the value that was just allocated rather than the previously tested one.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression *x;
expression e;
identifier l;
@@

if (x = NULL || ...) {
    ... when forall
    return ...; }
... when != goto l;
    when != x = e
    when != &x
*x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/ax88796.c               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ax88796.c b/drivers/net/ax88796.c
index 62d9c9c..1dd4403 100644
--- a/drivers/net/ax88796.c
+++ b/drivers/net/ax88796.c
@@ -921,7 +921,7 @@ static int ax_probe(struct platform_device *pdev)
  		size = (res->end - res->start) + 1;
 
 		ax->mem2 = request_mem_region(res->start, size, pdev->name);
-		if (ax->mem = NULL) {
+		if (ax->mem2 = NULL) {
 			dev_err(&pdev->dev, "cannot reserve registers\n");
 			ret = -ENXIO;
 			goto exit_mem1;
