From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 19:03:29 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 13/17] fix sparse warnings (__nocast type)
Message-Id: <200507031903.29607.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_BaDyCDFEEvhruaS"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_BaDyCDFEEvhruaS
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: kernel/audit.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_BaDyCDFEEvhruaS
Content-Type: text/x-diff; charset="iso-8859-1"; name="kernel_audit.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kernel_audit.patch"

 kernel/audit.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-git/kernel/audit.c
===================================================================
--- linux-2.6-git.orig/kernel/audit.c	2005-07-01 17:48:52.000000000 +0000
+++ linux-2.6-git/kernel/audit.c	2005-07-03 14:59:37.000000000 +0000
@@ -560,7 +560,7 @@
 }
 
 static struct audit_buffer * audit_buffer_alloc(struct audit_context *ctx,
-						int gfp_mask, int type)
+						unsigned int __nocast gfp_mask, int type)
 {
 	unsigned long flags;
 	struct audit_buffer *ab = NULL;

--Boundary-00=_BaDyCDFEEvhruaS
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_BaDyCDFEEvhruaS--
