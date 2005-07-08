From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 10:33:21 +0000
Subject: [KJ] [patch 2.6.13-rc1 08/23] printk : arch/um/kernel/process_kern.c
Message-Id: <20050708103321.GP4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86821501071362372=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86821501071362372==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: 2.6.13-rc1/arch/um/kernel/process_kern.c
===================================================================
--- 2.6.13-rc1.orig/arch/um/kernel/process_kern.c
+++ 2.6.13-rc1/arch/um/kernel/process_kern.c
@@ -412,7 +412,7 @@ int __init make_proc_sysemu(void)
 
 	if (ent == NULL)
 	{
-		printk("Failed to register /proc/sysemu\n");
+		printk(KERN_WARNING "Failed to register /proc/sysemu\n");
 		return(0);
 	}
 

--===============86821501071362372==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86821501071362372==--
