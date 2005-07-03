From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:54:54 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 7/17] fix sparse warnings (__nocast type)
Message-Id: <200507031854.54239.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_+RDyCDQZEvejvXz"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_+RDyCDQZEvejvXz
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: drivers/block/cfq-iosched

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_+RDyCDQZEvejvXz
Content-Type: text/x-diff; charset="iso-8859-1"; name="block_cfq-iosched.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="block_cfq-iosched.patch"

 drivers/block/cfq-iosched.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

Index: linux-2.6-git/drivers/block/cfq-iosched.c
===================================================================
--- linux-2.6-git.orig/drivers/block/cfq-iosched.c	2005-07-03 15:48:08.000000000 +0000
+++ linux-2.6-git/drivers/block/cfq-iosched.c	2005-07-03 16:47:36.000000000 +0000
@@ -1415,7 +1415,7 @@
 }
 
 static struct cfq_io_context *
-cfq_alloc_io_context(struct cfq_data *cfqd, int gfp_mask)
+cfq_alloc_io_context(struct cfq_data *cfqd, unsigned int __nocast gfp_mask)
 {
 	struct cfq_io_context *cic = kmem_cache_alloc(cfq_ioc_pool, gfp_mask);
 
@@ -1510,7 +1510,7 @@
 
 static struct cfq_queue *
 cfq_get_queue(struct cfq_data *cfqd, unsigned int key, unsigned short ioprio,
-	      int gfp_mask)
+	      unsigned int __nocast gfp_mask)
 {
 	const int hashval = hash_long(key, CFQ_QHASH_SHIFT);
 	struct cfq_queue *cfqq, *new_cfqq = NULL;
@@ -1571,7 +1571,7 @@
  * cfqq, so we don't need to worry about it disappearing
  */
 static struct cfq_io_context *
-cfq_get_io_context(struct cfq_data *cfqd, pid_t pid, int gfp_mask)
+cfq_get_io_context(struct cfq_data *cfqd, pid_t pid, unsigned int __nocast gfp_mask)
 {
 	struct io_context *ioc = NULL;
 	struct cfq_io_context *cic;
@@ -2063,7 +2063,7 @@
  */
 static int
 cfq_set_request(request_queue_t *q, struct request *rq, struct bio *bio,
-		int gfp_mask)
+		unsigned int __nocast gfp_mask)
 {
 	struct cfq_data *cfqd = q->elevator->elevator_data;
 	struct task_struct *tsk = current;

--Boundary-00=_+RDyCDQZEvejvXz
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_+RDyCDQZEvejvXz--
