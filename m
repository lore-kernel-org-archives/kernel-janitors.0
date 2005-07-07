From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:42 +0000
Subject: [KJ] [patch 2.6.13-rc1 08/23] Audit return code of create_proc_*
Message-Id: <20050707154550.641608000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36147680972302965=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36147680972302965==
Content-Disposition: inline;
	filename=proc_create_arch_um_kernel_process_kern.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/um/kernel/process_kern.c 2.6.13-rc1/arch/um/kernel/process_kern.c
--- 2.6.13-rc1.orig/arch/um/kernel/process_kern.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/um/kernel/process_kern.c	2005-07-05 10:32:41.270085640 +0200
@@ -412,7 +412,7 @@ int __init make_proc_sysemu(void)
 
 	if (ent == NULL)
 	{
-		printk("Failed to register /proc/sysemu\n");
+		printk(KERN_WARNING "Failed to register /proc/sysemu\n");
 		return(0);
 	}
 

--

--===============36147680972302965==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36147680972302965==--
