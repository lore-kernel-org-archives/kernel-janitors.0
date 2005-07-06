From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Wed, 06 Jul 2005 11:52:12 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 5/17] fix sparse warnings [UPDATE]
Message-Id: <200507061152.12661.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031852.14875.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031852.14875.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Sunday 03 July 2005 18:52, Victor Fusco escreveu:
> Description:
>	Fix the sparse warning "implicit cast to nocast type"
> 
> File/Subsystem: drivers/block/elevator
> 
> Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
>  
> 

Description:
	Fix the sparse warning "implicit cast to nocast type"

File/Subsystem: drivers/block/elevator


Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>



 linux-2.6-git/drivers/block/ll_rw_blk.c |   17 ++++++++++-------
 linux-2.6-git/include/linux/blkdev.h    |   10 +++++-----
 linux-2.6-git/include/linux/elevator.h  |    6 ++++--
 linux-git/drivers/block/elevator.c      |    2 +-
 4 files changed, 20 insertions(+), 15 deletions(-)

Index: linux-2.6-git/drivers/block/ll_rw_blk.c
=================================--- linux-2.6-git.orig/drivers/block/ll_rw_blk.c	2005-07-05 13:18:04.000000000 +0000
+++ linux-2.6-git/drivers/block/ll_rw_blk.c	2005-07-05 13:22:33.000000000 +0000
@@ -1639,13 +1639,14 @@
 
 static int __make_request(request_queue_t *, struct bio *);
 
-request_queue_t *blk_alloc_queue(int gfp_mask)
+request_queue_t *blk_alloc_queue(unsigned int __nocast gfp_mask)
 {
 	return blk_alloc_queue_node(gfp_mask, -1);
 }
 EXPORT_SYMBOL(blk_alloc_queue);
 
-request_queue_t *blk_alloc_queue_node(int gfp_mask, int node_id)
+request_queue_t *blk_alloc_queue_node(unsigned int __nocast gfp_mask,
+                                      int node_id)
 {
 	request_queue_t *q;
 
@@ -1774,7 +1775,8 @@
 }
 
 static inline struct request *
-blk_alloc_request(request_queue_t *q, int rw, struct bio *bio, int gfp_mask)
+blk_alloc_request(request_queue_t *q, int rw, struct bio *bio,
+                  unsigned int __nocast gfp_mask)
 {
 	struct request *rq = mempool_alloc(q->rq.rq_pool, gfp_mask);
 
@@ -1872,7 +1874,7 @@
  * Returns !NULL on success, with queue_lock *not held*.
  */
 static struct request *get_request(request_queue_t *q, int rw, struct bio *bio,
-				   int gfp_mask)
+				   unsigned int __nocast gfp_mask)
 {
 	struct request *rq = NULL;
 	struct request_list *rl = &q->rq;
@@ -2006,7 +2008,8 @@
 	return rq;
 }
 
-struct request *blk_get_request(request_queue_t *q, int rw, int gfp_mask)
+struct request *blk_get_request(request_queue_t *q, int rw,
+                                unsigned int __nocast gfp_mask)
 {
 	struct request *rq;
 
@@ -3285,7 +3288,7 @@
  * but since the current task itself holds a reference, the context can be
  * used in general code, so long as it stays within `current` context.
  */
-struct io_context *current_io_context(int gfp_flags)
+struct io_context *current_io_context( unsigned int __nocast gfp_flags)
 {
 	struct task_struct *tsk = current;
 	struct io_context *ret;
@@ -3316,7 +3319,7 @@
  *
  * This is always called in the context of the task which submitted the I/O.
  */
-struct io_context *get_io_context(int gfp_flags)
+struct io_context *get_io_context(unsigned int __nocast gfp_flags)
 {
 	struct io_context *ret;
 	ret = current_io_context(gfp_flags);
Index: linux-2.6-git/include/linux/blkdev.h
=================================--- linux-2.6-git.orig/include/linux/blkdev.h	2005-07-05 13:18:04.000000000 +0000
+++ linux-2.6-git/include/linux/blkdev.h	2005-07-05 13:22:33.000000000 +0000
@@ -96,8 +96,8 @@
 
 void put_io_context(struct io_context *ioc);
 void exit_io_context(void);
-struct io_context *current_io_context(int gfp_flags);
-struct io_context *get_io_context(int gfp_flags);
+struct io_context *current_io_context(unsigned int __nocast gfp_flags);
+struct io_context *get_io_context(unsigned int __nocast gfp_flags);
 void copy_io_context(struct io_context **pdst, struct io_context **psrc);
 void swap_io_context(struct io_context **ioc1, struct io_context **ioc2);
 
@@ -549,7 +549,7 @@
 extern void blk_put_request(struct request *);
 extern void blk_end_sync_rq(struct request *rq);
 extern void blk_attempt_remerge(request_queue_t *, struct request *);
-extern struct request *blk_get_request(request_queue_t *, int, int);
+extern struct request *blk_get_request(request_queue_t *, int, unsigned int __nocast);
 extern void blk_insert_request(request_queue_t *, struct request *, int, void *);
 extern void blk_requeue_request(request_queue_t *, struct request *);
 extern void blk_plug_device(request_queue_t *);
@@ -651,8 +651,8 @@
 extern void blk_finish_queue_drain(request_queue_t *);
 
 int blk_get_queue(request_queue_t *);
-request_queue_t *blk_alloc_queue(int gfp_mask);
-request_queue_t *blk_alloc_queue_node(int,int);
+request_queue_t *blk_alloc_queue(unsigned int __nocast gfp_mask);
+request_queue_t *blk_alloc_queue_node(unsigned int __nocast, int);
 #define blk_put_queue(q) blk_cleanup_queue((q))
 
 /*
Index: linux-2.6-git/include/linux/elevator.h
=================================--- linux-2.6-git.orig/include/linux/elevator.h	2005-07-05 13:18:04.000000000 +0000
+++ linux-2.6-git/include/linux/elevator.h	2005-07-05 13:22:33.000000000 +0000
@@ -18,7 +18,8 @@
 typedef void (elevator_completed_req_fn) (request_queue_t *, struct request *);
 typedef int (elevator_may_queue_fn) (request_queue_t *, int, struct bio *);
 
-typedef int (elevator_set_req_fn) (request_queue_t *, struct request *, struct bio *, int);
+typedef int (elevator_set_req_fn) (request_queue_t *, struct request *, struct bio *,
+                                   unsigned int __nocast);
 typedef void (elevator_put_req_fn) (request_queue_t *, struct request *);
 typedef void (elevator_deactivate_req_fn) (request_queue_t *, struct request *);
 
@@ -98,7 +99,8 @@
 extern void elv_unregister_queue(request_queue_t *q);
 extern int elv_may_queue(request_queue_t *, int, struct bio *);
 extern void elv_completed_request(request_queue_t *, struct request *);
-extern int elv_set_request(request_queue_t *, struct request *, struct bio *, int);
+extern int elv_set_request(request_queue_t *, struct request *, struct bio *,
+                           unsigned int __nocast);
 extern void elv_put_request(request_queue_t *, struct request *);
 
 /*
Index: linux-git/drivers/block/elevator.c
=================================--- linux-git.orig/drivers/block/elevator.c	2005-07-06 00:36:18.000000000 +0000
+++ linux-git/drivers/block/elevator.c	2005-07-06 02:14:22.000000000 +0000
@@ -487,7 +487,7 @@
 }
 
 int elv_set_request(request_queue_t *q, struct request *rq, struct bio *bio,
-		    int gfp_mask)
+		    unsigned int __nocast gfp_mask)
 {
 	elevator_t *e = q->elevator;


--

 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
