From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 18 Sep 2006 22:35:38 +0000
Subject: [KJ] [Patch] BUG_ON conversion for fs/aio.c
Message-Id: <1158618938.19853.3.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts a if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc7/fs/aio.c.orig	2006-09-18 23:48:31.000000000 +0200
+++ linux-2.6.18-rc7/fs/aio.c	2006-09-18 23:48:56.000000000 +0200
@@ -366,8 +366,7 @@ void fastcall __put_ioctx(struct kioctx 
 {
 	unsigned nr_events = ctx->max_reqs;
 
-	if (unlikely(ctx->reqs_active))
-		BUG();
+	BUG_ON(ctx->reqs_active);
 
 	cancel_delayed_work(&ctx->wq);
 	flush_workqueue(aio_wq);
@@ -501,8 +500,7 @@ static int __aio_put_req(struct kioctx *
 	assert_spin_locked(&ctx->ctx_lock);
 
 	req->ki_users --;
-	if (unlikely(req->ki_users < 0))
-		BUG();
+	BUG_ON(req->ki_users < 0);
 	if (likely(req->ki_users))
 		return 0;
 	list_del(&req->ki_list);		/* remove from active_reqs */


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
