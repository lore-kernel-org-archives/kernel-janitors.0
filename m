From: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Date: Tue, 25 Apr 2006 18:03:13 +0000
Subject: [KJ] [PATCH] constify drivers/block/floppy.c (2.6.17-rc1-mm3)
Message-Id: <20060425180313.GA7096@rhlx01.fht-esslingen.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33099922621603128=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33099922621603128==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,

constify the few floppy module variables that can be constified
(see objdump -x floppy.ko).

Patch against 2.6.17-rc1-mm3.

Signed-off-by: Andreas Mohr <andi@lisas.de>

Thanks!


--- linux-2.6.17-rc1-mm3/drivers/block/floppy.c	2006-04-03 05:22:10.000000000 +0200
+++ linux-2.6.17-rc1-mm3/drivers/block/floppy.c.const	2006-04-25 19:57:40.000000000 +0200
@@ -505,7 +505,7 @@
 
 static sector_t floppy_sizes[256];
 
-static char floppy_device_name[] = "floppy";
+static const char floppy_device_name[] = "floppy";
 
 /*
  * The driver is trying to determine the correct media format
@@ -3954,7 +3954,7 @@
 	.media_changed	= check_floppy_change,
 	.revalidate_disk = floppy_revalidate,
 };
-static char *table[] = {
+static const char * const table[] = {
 	"", "d360", "h1200", "u360", "u720", "h360", "h720",
 	"u1440", "u2880", "CompaQ", "h1440", "u1680", "h410",
 	"u820", "h1476", "u1722", "h420", "u830", "h1494", "u1743",
@@ -3962,11 +3962,11 @@
 	"u3200", "u3520", "u3840", "u1840", "u800", "u1600",
 	NULL
 };
-static int t360[] = { 1, 0 },
+static const int t360[] = { 1, 0 },
 	t1200[] = { 2, 5, 6, 10, 12, 14, 16, 18, 20, 23, 0 },
 	t3in[] = { 8, 9, 26, 27, 28, 7, 11, 15, 19, 24, 25, 29, 31, 3, 4, 13,
 			17, 21, 22, 30, 0 };
-static int *table_sup[] =
+static const int * const table_sup[] =
     { NULL, t360, t1200, t3in + 5 + 8, t3in + 5, t3in, t3in };
 
 static void __init register_devfs_entries(int drive)

-- 
No programming skills!? Why not help translate many Linux applications! 
https://launchpad.ubuntu.com/rosetta
(or alternatively buy nicely packaged Linux distros/OSS software to help
support Linux developers creating shiny new things for you?)

--===============33099922621603128==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33099922621603128==--
