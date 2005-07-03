From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:56:00 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 8/17] fix sparse warnings (__nocast type)
Message-Id: <200507031856.00579.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_ATDyCx8bJ5MFfMa"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_ATDyCx8bJ5MFfMa
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: drivers/block/deadline-iosched

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_ATDyCx8bJ5MFfMa
Content-Type: text/x-diff; charset="iso-8859-1";
	name="block_deadline-iosched.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="block_deadline-iosched.patch"

 drivers/block/deadline-iosched.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-git/drivers/block/deadline-iosched.c
===================================================================
--- linux-2.6-git.orig/drivers/block/deadline-iosched.c	2005-07-01 17:48:30.000000000 +0000
+++ linux-2.6-git/drivers/block/deadline-iosched.c	2005-07-03 14:15:48.000000000 +0000
@@ -761,7 +761,7 @@
 
 static int
 deadline_set_request(request_queue_t *q, struct request *rq, struct bio *bio,
-		     int gfp_mask)
+		    unsigned int __nocast gfp_mask)
 {
 	struct deadline_data *dd = q->elevator->elevator_data;
 	struct deadline_rq *drq;

--Boundary-00=_ATDyCx8bJ5MFfMa
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_ATDyCx8bJ5MFfMa--
