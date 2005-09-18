From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 18 Sep 2005 02:22:29 +0000
Subject: [KJ] [PATCH] 4 of 20 Update MODULE_* macro (dell_rbu.c)
Message-Id: <BCDE56F6-CEA7-413F-A2A2-2DC048A273C0@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-21-526577473"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-21-526577473
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

This patch updates the MODULE_VERSION() macro calls to status quo.

i.e.

MODULE_VERSION("1.0");

is changed to:

#define DRIVER_VERSION "1.0"
...
MODULE_VERSION(DRIVER_VERSION);

Also, calls like this:

MODULE_AUTHOR("John Doe (john@doe.com)");

will be cleaned up to:

#define DRIVER_AUTHOR "John Doe <john@doe.com>"
...
MODULE_AUTHOR(DRIVER_AUTHOR);

etc. etc.

--Apple-Mail-21-526577473
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0700;
	name="MOD_VERS_Conform_dell_rbu.patch"
Content-Disposition: attachment;
	filename=MOD_VERS_Conform_dell_rbu.patch


Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/firmware/dell_rbu.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff -puN drivers/firmware/dell_rbu.c~MOD_VERS_Conform_dell_rbu drivers/firmware/dell_rbu.c
--- linux-2.6.14-rc1/drivers/firmware/dell_rbu.c~MOD_VERS_Conform_dell_rbu	2005-09-17 18:16:42.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/firmware/dell_rbu.c	2005-09-17 18:18:39.000000000 -0700
@@ -47,10 +47,10 @@
 #include <linux/firmware.h>
 #include <linux/dma-mapping.h>

-MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
-MODULE_DESCRIPTION("Driver for updating BIOS image on DELL systems");
-MODULE_LICENSE("GPL");
-MODULE_VERSION("1.0");
+#define DRIVER_AUTHOR "Abhay Salunke <abhay_salunke@dell.com>"
+#define DRIVER_DESCRIPTION "Driver for updating BIOS image on DELL systems"
+#define DRIVER_VERSION "1.0"
+#define DRIVER_LICENSE "GPL"

 #define BIOS_SCAN_LIMIT 0xffffffff
 #define MAX_IMAGE_LENGTH 16
@@ -632,3 +632,8 @@ static __exit void dcdrbu_exit(void)

 module_exit(dcdrbu_exit);
 module_init(dcdrbu_init);
+
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE(DRIVER_LICENSE);
_

--Apple-Mail-21-526577473
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-21-526577473--
