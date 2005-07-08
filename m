From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 10:29:10 +0000
Subject: [KJ] [patch 2.6.13-rc1 07/23][RESEND] drivers/acpi/system.c :
Message-Id: <20050708102910.GO4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50515814408953985=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50515814408953985==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Remove not used brackets

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: 2.6.13-rc1/drivers/acpi/system.c
===================================================================
--- 2.6.13-rc1.orig/drivers/acpi/system.c
+++ 2.6.13-rc1/drivers/acpi/system.c
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

--===============50515814408953985==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50515814408953985==--
