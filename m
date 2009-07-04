From: Julia Lawall <julia@diku.dk>
Date: Sat, 04 Jul 2009 21:32:29 +0000
Subject: [PATCH 2/3] drivers/video/imxfb.c: Fix resource size off by 1 error
Message-Id: <Pine.LNX.4.64.0907042331490.9841@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel@pengutronix.de, linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the first case, the change is not semantics-preserving, but
resource_size is used at the corresponding call to request_mem_region in
the same function.

In the second case, the change is semantics-preserving.

The problem was found using the following semantic patch:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
struct resource *res;
@@

- (res->end - res->start) + 1
+ resource_size(res)

@@
struct resource *res;
@@

- res->end - res->start
+ BAD(resource_size(res))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/video/imxfb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/video/imxfb.c b/drivers/video/imxfb.c
--- a/drivers/video/imxfb.c 2009-04-13 16:04:25.000000000 +0200
+++ b/drivers/video/imxfb.c 2009-07-04 21:37:48.000000000 +0200
@@ -754,7 +754,7 @@ failed_map:
 failed_getclock:
 	iounmap(fbi->regs);
 failed_ioremap:
-	release_mem_region(res->start, res->end - res->start);
+	release_mem_region(res->start, resource_size(res));
 failed_req:
 	kfree(info->pseudo_palette);
 failed_init:
@@ -785,7 +785,7 @@ static int __devexit imxfb_remove(struct
 	framebuffer_release(info);
 
 	iounmap(fbi->regs);
-	release_mem_region(res->start, res->end - res->start + 1);
+	release_mem_region(res->start, resource_size(res));
 	clk_disable(fbi->clk);
 	clk_put(fbi->clk);
 
