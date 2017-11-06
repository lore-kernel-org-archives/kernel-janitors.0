From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Nov 2017 11:48:43 +0000
Subject: [PATCH] lightnvm: pblk: remove some unnecessary NULL checks
Message-Id: <20171106114843.7rs6myhgxgij3jh7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matias Bjorling <mb@lightnvm.io>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that flush_workqueue() dereferences the work queue
pointer but then we check if it's NULL on the next line when it's too
late.  These NULL checks can be removed because the module won't load if
we can't allocate the work queues.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/lightnvm/pblk-gc.c b/drivers/lightnvm/pblk-gc.c
index 00d5698d64a9..aaba2049a135 100644
--- a/drivers/lightnvm/pblk-gc.c
+++ b/drivers/lightnvm/pblk-gc.c
@@ -669,12 +669,10 @@ void pblk_gc_exit(struct pblk *pblk)
 		kthread_stop(gc->gc_reader_ts);
 
 	flush_workqueue(gc->gc_reader_wq);
-	if (gc->gc_reader_wq)
-		destroy_workqueue(gc->gc_reader_wq);
+	destroy_workqueue(gc->gc_reader_wq);
 
 	flush_workqueue(gc->gc_line_reader_wq);
-	if (gc->gc_line_reader_wq)
-		destroy_workqueue(gc->gc_line_reader_wq);
+	destroy_workqueue(gc->gc_line_reader_wq);
 
 	if (gc->gc_writer_ts)
 		kthread_stop(gc->gc_writer_ts);
