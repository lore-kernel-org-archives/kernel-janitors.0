From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:40 +0000
Subject: [KJ] [patch 2.6.13-rc1 06/23] Audit return code of create_proc_*
Message-Id: <20050707154540.081487000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4383491008247849=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4383491008247849==
Content-Disposition: inline; filename=proc_create_drivers_block_cciss.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/drivers/block/cciss.c 2.6.13-rc1/drivers/block/cciss.c
--- 2.6.13-rc1.orig/drivers/block/cciss.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/drivers/block/cciss.c	2005-07-05 10:36:28.782498496 +0200
@@ -337,7 +337,10 @@ static void __devinit cciss_procinit(int
 	pde = create_proc_read_entry(hba[i]->devname, 
 		S_IWUSR | S_IRUSR | S_IRGRP | S_IROTH, 
 		proc_cciss, cciss_proc_get_info, hba[i]);
-	pde->write_proc = cciss_proc_write;
+	if (!pde)
+		printk(KERN_WARNING "ccis: Unable to create /proc entry.\n");
+	else
+		pde->write_proc = cciss_proc_write;
 }
 #endif /* CONFIG_PROC_FS */
 

--

--===============4383491008247849==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4383491008247849==--
