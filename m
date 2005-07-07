From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:44 +0000
Subject: [KJ] [patch 2.6.13-rc1 10/23] Audit return code of create_proc_*
Message-Id: <20050707154601.265756000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88494371263460181=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88494371263460181==
Content-Disposition: inline;
	filename=proc_create_arch_um_drivers_mconsole_kern.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/um/drivers/mconsole_kern.c 2.6.13-rc1/arch/um/drivers/mconsole_kern.c
--- 2.6.13-rc1.orig/arch/um/drivers/mconsole_kern.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/um/drivers/mconsole_kern.c	2005-07-05 10:31:45.234604328 +0200
@@ -557,7 +557,7 @@ static int create_proc_mconsole(void)
 
 	ent = create_proc_entry("mconsole", S_IFREG | 0200, NULL);
 	if(ent == NULL){
-		printk("create_proc_mconsole : create_proc_entry failed\n");
+		printk(KERN_INFO "create_proc_mconsole : create_proc_entry failed\n");
 		return(0);
 	}
 

--

--===============88494371263460181==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88494371263460181==--
