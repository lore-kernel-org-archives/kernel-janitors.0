From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 18:58:41 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 10/17] fix sparse warnings (__nocast type)
Message-Id: <200507031858.41781.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_hVDyCFGoPA/iisu"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_hVDyCFGoPA/iisu
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: drivers/char/n_tty.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_hVDyCFGoPA/iisu
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="char_n_tty.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="char_n_tty.patch"

 drivers/char/n_tty.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6-git/drivers/char/n_tty.c
===================================================================
--- linux-2.6-git.orig/drivers/char/n_tty.c	2005-07-01 17:48:31.000000000 +0000
+++ linux-2.6-git/drivers/char/n_tty.c	2005-07-03 14:15:48.000000000 +0000
@@ -62,7 +62,7 @@
 
 static inline unsigned char *alloc_buf(void)
 {
-	int prio = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
+	unsigned int prio = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
 
 	if (PAGE_SIZE != N_TTY_BUF_SIZE)
 		return kmalloc(N_TTY_BUF_SIZE, prio);

--Boundary-00=_hVDyCFGoPA/iisu
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_hVDyCFGoPA/iisu--
