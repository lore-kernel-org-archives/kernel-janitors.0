From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Jan 2014 14:20:03 +0000
Subject: [patch] gpu: ion: dereferencing an ERR_PTR
Message-Id: <20140122142003.GA9681@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We dereference "heap->task" before checking if it's an ERR_PTR.

Fixes: ea313b5f88ed ('gpu: ion: Also shrink memory cached in the deferred free list')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Which email list are android patches going to these days?  These didn't
go through the staging list.

diff --git a/drivers/staging/android/ion/ion_heap.c b/drivers/staging/android/ion/ion_heap.c
index 296c74f98dc0..37e64d51394c 100644
--- a/drivers/staging/android/ion/ion_heap.c
+++ b/drivers/staging/android/ion/ion_heap.c
@@ -243,12 +243,12 @@ int ion_heap_init_deferred_free(struct ion_heap *heap)
 	init_waitqueue_head(&heap->waitqueue);
 	heap->task = kthread_run(ion_heap_deferred_free, heap,
 				 "%s", heap->name);
-	sched_setscheduler(heap->task, SCHED_IDLE, &param);
 	if (IS_ERR(heap->task)) {
 		pr_err("%s: creating thread for deferred free failed\n",
 		       __func__);
 		return PTR_RET(heap->task);
 	}
+	sched_setscheduler(heap->task, SCHED_IDLE, &param);
 	return 0;
 }
 
