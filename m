From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 18 Sep 2005 02:25:25 +0000
Subject: [KJ] [PATCH] 5 of 20 Update MODULE_* macro (dibusb-mb)
Message-Id: <6A7912A8-94B5-4B18-A13A-D0E465777133@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-23-526753724"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-23-526753724
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

--Apple-Mail-23-526753724
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0700;
	name="MOD_VERS_Conform_dibusb-mb.patch"
Content-Disposition: attachment;
	filename=MOD_VERS_Conform_dibusb-mb.patch


Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/media/dvb/dvb-usb/dibusb-mb.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff -puN drivers/media/dvb/dvb-usb/dibusb-mb.c~MOD_VERS_Conform_dibusb-mb drivers/media/dvb/dvb-usb/dibusb-mb.c
--- linux-2.6.14-rc1/drivers/media/dvb/dvb-usb/dibusb-mb.c~MOD_VERS_Conform_dibusb-mb	2005-09-17 18:29:45.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/media/dvb/dvb-usb/dibusb-mb.c	2005-09-17 18:31:06.000000000 -0700
@@ -14,6 +14,11 @@
  */
 #include "dibusb.h"

+#define DRIVER_AUTHOR "Patrick Boettcher <patrick.boettcher@desy.de>"
+#define DRIVER_DESCRIPTION "Driver for DiBcom USB DVB-T devices (DiB3000M-B based)"
+#define DRIVER_VERSION "1.0"
+#define DRIVER_LICENSE "GPL"
+
 static int dibusb_dib3000mb_frontend_attach(struct dvb_usb_device *d)
 {
 	struct dib3000_config demod_cfg;
@@ -350,7 +355,7 @@ static void __exit dibusb_module_exit(vo
 module_init (dibusb_module_init);
 module_exit (dibusb_module_exit);

-MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@desy.de>");
-MODULE_DESCRIPTION("Driver for DiBcom USB DVB-T devices (DiB3000M-B based)");
-MODULE_VERSION("1.0");
-MODULE_LICENSE("GPL");
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE(DRIVER_LICENSE);
_

--Apple-Mail-23-526753724
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-23-526753724--
