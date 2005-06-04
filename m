From: Domen Puncer <domen@coderock.org>
Date: Sat, 04 Jun 2005 14:58:26 +0000
Subject: [KJ] [patch] um: copy_from_user size fix in signal.c
Message-Id: <20050604145826.GB9687@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9674985476927993=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9674985476927993==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Size of pointer doesn't seem right, but maybe my solution isn't
either (sig_size maybe?).


Signed-off-by: Domen Puncer <domen@coderock.org>

diff -pruNX dontdiff c/arch/um/sys-i386/signal.c a/arch/um/sys-i386/signal.c
--- c/arch/um/sys-i386/signal.c	2005-05-25 13:34:36.000000000 +0200
+++ a/arch/um/sys-i386/signal.c	2005-06-04 15:28:01.000000000 +0200
@@ -312,7 +312,7 @@ long sys_sigreturn(struct pt_regs regs)
 	unsigned long __user *extramask = frame->extramask;
 	int sig_size = (_NSIG_WORDS - 1) * sizeof(unsigned long);
 
-	if(copy_from_user(&set.sig[0], oldmask, sizeof(&set.sig[0])) ||
+	if(copy_from_user(&set.sig[0], oldmask, sizeof(set.sig[0])) ||
 	   copy_from_user(&set.sig[1], extramask, sig_size))
 		goto segfault;
 

--===============9674985476927993==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9674985476927993==--
