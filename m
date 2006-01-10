From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 10 Jan 2006 11:44:14 +0000
Subject: [KJ] [PATCH] printk : arch/arm/kernel/ptrace.c
Message-Id: <20060110114414.GF8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72526213186900712=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72526213186900712==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.15/arch/arm/kernel/ptrace.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/ptrace.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/ptrace.c	2006-01-09 16:44:30.000000000 +0100
@@ -465,7 +465,7 @@
 	child->thread.debug.nsaved = 0;
 
 	if (nsaved > 2) {
-		printk("ptrace_cancel_bpt: bogus nsaved: %d!\n", nsaved);
+		printk(KERN_ERR "ptrace_cancel_bpt: bogus nsaved: %d!\n", nsaved);
 		nsaved = 2;
 	}
 

--===============72526213186900712==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72526213186900712==--
