From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:43 +0000
Subject: [KJ] [patch 2.6.13-rc1 09/23] Audit return code of create_proc_*
Message-Id: <20050707154555.931266000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3053561290576865=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3053561290576865==
Content-Disposition: inline;
	filename=proc_create_arch_um_kernel_exitcode.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/um/kernel/exitcode.c 2.6.13-rc1/arch/um/kernel/exitcode.c
--- 2.6.13-rc1.orig/arch/um/kernel/exitcode.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/um/kernel/exitcode.c	2005-07-05 10:32:47.871082136 +0200
@@ -48,7 +48,7 @@ static int make_proc_exitcode(void)
 
 	ent = create_proc_entry("exitcode", 0600, &proc_root);
 	if(ent == NULL){
-		printk("make_proc_exitcode : Failed to register "
+		printk(KERN_WARNING "make_proc_exitcode : Failed to register "
 		       "/proc/exitcode\n");
 		return(0);
 	}

--

--===============3053561290576865==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3053561290576865==--
