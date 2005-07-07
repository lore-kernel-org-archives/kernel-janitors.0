From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:41 +0000
Subject: [KJ] [patch 2.6.13-rc1 07/23] Audit return code of create_proc_*
Message-Id: <20050707154545.337166000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============014844335271107845=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============014844335271107845==
Content-Disposition: inline; filename=proc_create_drivers_acpi_system.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/drivers/acpi/system.c 2.6.13-rc1/drivers/acpi/system.c
--- 2.6.13-rc1.orig/drivers/acpi/system.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/drivers/acpi/system.c	2005-07-05 10:34:27.598921200 +0200
@@ -148,9 +148,8 @@ static int __init acpi_system_init (void
 		S_IRUGO, acpi_root_dir);
 	if (!entry)
 		goto Error;
-	else {
+	else
 		entry->proc_fops = &acpi_system_info_ops;
-	}
 
 	/* 'dsdt' [R] */
 	name = ACPI_SYSTEM_FILE_DSDT;

--

--===============014844335271107845==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============014844335271107845==--
