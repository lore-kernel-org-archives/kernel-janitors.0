From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 29 Dec 2019 15:42:55 +0000
Subject: [PATCH 1/4] misc: cxl: use mmgrab
Message-Id: <1577634178-22530-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
helper") and most of the kernel was updated to use it. Update a
remaining file.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ expression e; @@
- atomic_inc(&e->mm_count);
+ mmgrab(e);
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/misc/cxl/context.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/context.c b/drivers/misc/cxl/context.c
index aed9c445d1e2..fb2eff69e449 100644
--- a/drivers/misc/cxl/context.c
+++ b/drivers/misc/cxl/context.c
@@ -352,7 +352,7 @@ void cxl_context_free(struct cxl_context *ctx)
 void cxl_context_mm_count_get(struct cxl_context *ctx)
 {
 	if (ctx->mm)
-		atomic_inc(&ctx->mm->mm_count);
+		mmgrab(ctx->mm);
 }
 
 void cxl_context_mm_count_put(struct cxl_context *ctx)
