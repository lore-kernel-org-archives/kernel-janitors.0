From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 10:35:52 +0000
Subject: [KJ] [patch 2.6.13-rc1 09/23][RESEND] printk :
Message-Id: <20050708103552.GQ4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6683638616556169=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6683638616556169==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/um/kernel/exitcode.c
===================================================================
--- 2.6.13-rc1.orig/arch/um/kernel/exitcode.c
+++ 2.6.13-rc1/arch/um/kernel/exitcode.c
@@ -48,7 +48,7 @@ static int make_proc_exitcode(void)
 
 	ent = create_proc_entry("exitcode", 0600, &proc_root);
 	if(ent == NULL){
-		printk("make_proc_exitcode : Failed to register "
+		printk(KERN_WARNING "make_proc_exitcode : Failed to register "
 		       "/proc/exitcode\n");
 		return(0);
 	}

--===============6683638616556169==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6683638616556169==--
