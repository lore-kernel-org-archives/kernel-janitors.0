From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 18 Sep 2005 02:09:37 +0000
Subject: [KJ] [PATCH] 1 of 20 Update MODULE_* macro (a800.c)
Message-Id: <44084B9A-F05D-42A1-92C7-AE1DF8F55EE5@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-15-525806357"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-15-525806357
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


--Apple-Mail-15-525806357
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0700;
	name="MOD_VERS_Conform_a800.patch"
Content-Disposition: attachment;
	filename=MOD_VERS_Conform_a800.patch


Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/media/dvb/dvb-usb/a800.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff -puN drivers/media/dvb/dvb-usb/a800.c~MOD_VERS_Conform_a800 drivers/media/dvb/dvb-usb/a800.c
--- linux-2.6.14-rc1/drivers/media/dvb/dvb-usb/a800.c~MOD_VERS_Conform_a800	2005-09-17 18:50:31.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/media/dvb/dvb-usb/a800.c	2005-09-17 18:51:47.000000000 -0700
@@ -15,6 +15,11 @@
  */
 #include "dibusb.h"
 
+#define DRIVER_AUTHOR "Patrick Boettcher <patrick.boettcher@desy.de>"
+#define DRIVER_DESCRIPTION "VerMedia AverTV DVB-T USB 2.0 (A800)"
+#define DRIVER_VERSION "1.0"
+#define DRIVER_LICENSE "GPL"
+
 static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "set debugging level (rc=1 (or-able))." DVB_USB_DEBUG_STATUS);
@@ -176,7 +181,7 @@ static void __exit a800_module_exit(void
 module_init (a800_module_init);
 module_exit (a800_module_exit);
 
-MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@desy.de>");
-MODULE_DESCRIPTION("AVerMedia AverTV DVB-T USB 2.0 (A800)");
-MODULE_VERSION("1.0");
-MODULE_LICENSE("GPL");
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE(DRIVER_LICENSE);
_

--Apple-Mail-15-525806357
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-15-525806357--
