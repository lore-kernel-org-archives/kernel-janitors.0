From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Mar 2011 17:14:54 +0000
Subject: [PATCH 2/3] drivers/misc/atmel_tclib.c: Convert release_resource to release_mem_region
Message-Id: <1300814095-25278-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Request_mem_region should be used with release_mem_region, not
release_resource.

A semantic patch that partially fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@b@
expression x,E;
@@

x = request_mem_region(x->start,...)
... when != release_mem_region(x->start,...)
    when != x = E
(
- release_resource(x);
- kfree(x);
+  release_mem_region(x->start,resource_size(x));
|
?- release_resource(x);
+  release_mem_region(x->start,resource_size(x));
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/misc/atmel_tclib.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/atmel_tclib.c b/drivers/misc/atmel_tclib.c
index 3891124..0ce9d63 100644
--- a/drivers/misc/atmel_tclib.c
+++ b/drivers/misc/atmel_tclib.c
@@ -75,7 +75,7 @@ out:
 	return tc;
 
 fail_ioremap:
-	release_resource(r);
+	release_mem_region(r->start, resource_size(r));
 fail:
 	tc = NULL;
 	goto out;
@@ -95,7 +95,7 @@ void atmel_tc_free(struct atmel_tc *tc)
 	spin_lock(&tc_list_lock);
 	if (tc->regs) {
 		iounmap(tc->regs);
-		release_resource(tc->iomem);
+		release_mem_region(tc->iomem->start, resource_size(tc->iomem));
 		tc->regs = NULL;
 		tc->iomem = NULL;
 	}

