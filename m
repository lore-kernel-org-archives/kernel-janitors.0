From: Julia Lawall <julia@diku.dk>
Date: Sat, 04 Jul 2009 21:33:21 +0000
Subject: [PATCH 3/3] drivers/vlynq/vlynq.c: Fix resource size off by 1 error
Message-Id: <Pine.LNX.4.64.0907042332300.9841@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: florian@openwrt.org, openwrt-devel@lists.openwrt.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this case, the calls to request_mem_region, ioremap, and
release_mem_region all have a consistent length argument, len, but since in
other files (res->end - res->start) + 1, equivalent to resource_size(res),
is used for a resource-typed structure res, one could consider whether the
same should be done here.

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
 drivers/vlynq/vlynq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p 
a/drivers/vlynq/vlynq.c 
b/drivers/vlynq/vlynq.c
--- a/drivers/vlynq/vlynq.c 2009-06-24 21:18:50.000000000 +0200
+++ b/drivers/vlynq/vlynq.c 2009-07-04 21:37:28.000000000 +0200
@@ -703,7 +703,7 @@ static int vlynq_probe(struct platform_d
 	dev->mem_start = mem_res->start;
 	dev->mem_end = mem_res->end;
 
-	len = regs_res->end - regs_res->start;
+	len = resource_size(regs_res);
 	if (!request_mem_region(regs_res->start, len, dev_name(&dev->dev))) {
 		printk(KERN_ERR "%s: Can't request vlynq registers\n",
 		       dev_name(&dev->dev));
