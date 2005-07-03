From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:49:43 +0000
Subject: [KJ] [PATCH 2.6.13-c1 3/17] fix sparse warnings (__nocast type)
Message-Id: <200507031849.43357.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_HNDyC2vzPxd8wPU"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_HNDyC2vzPxd8wPU
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: mm/mempool.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_HNDyC2vzPxd8wPU
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="mm_mempool.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mm_mempool.patch"



Fix the sparse warning: 
    implicit cast to nocast type


 mm/mempool.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-git/mm/mempool.c
===================================================================
--- linux-2.6-git.orig/mm/mempool.c	2005-07-01 17:48:52.000000000 +0000
+++ linux-2.6-git/mm/mempool.c	2005-07-03 14:15:48.000000000 +0000
@@ -205,7 +205,7 @@
 	void *element;
 	unsigned long flags;
 	wait_queue_t wait;
-	int gfp_temp;
+	unsigned int __nocast gfp_temp;
 
 	might_sleep_if(gfp_mask & __GFP_WAIT);
 

--Boundary-00=_HNDyC2vzPxd8wPU
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_HNDyC2vzPxd8wPU--
