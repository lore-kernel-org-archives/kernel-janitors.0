From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 18 Sep 2005 02:15:04 +0000
Subject: [KJ] [PATCH] 3 of 20 Update MODULE_* macro (cxusb.c)
Message-Id: <16155D49-2348-4C69-9659-E18E4CCB1911@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-19-526132722"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-19-526132722
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

--Apple-Mail-19-526132722
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0700;
	name="MOD_VERS_Conform_cxusb.patch"
Content-Disposition: attachment;
	filename=MOD_VERS_Conform_cxusb.patch


Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/media/dvb/dvb-usb/cxusb.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff -puN drivers/media/dvb/dvb-usb/cxusb.c~MOD_VERS_Conform_cxusb drivers/media/dvb/dvb-usb/cxusb.c
--- linux-2.6.14-rc1/drivers/media/dvb/dvb-usb/cxusb.c~MOD_VERS_Conform_cxusb	2005-09-17 18:45:03.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/media/dvb/dvb-usb/cxusb.c	2005-09-17 18:46:31.000000000 -0700
@@ -26,6 +26,11 @@

 #include "cx22702.h"

+#define DRIVER_AUTHOR "Patrick Boettcher <patrick.boettcher@desy.de>"
+#define DRIVER_DESCRIPTION "Driver for Conexant USB2.0 hybrid reference design"
+#define DRIVER_VERSION "1.0-alpha"
+#define DRIVER_LICENSE "GPL"
+
 /* debug */
 int dvb_usb_cxusb_debug;
 module_param_named(debug,dvb_usb_cxusb_debug, int, 0644);
@@ -269,7 +274,7 @@ static void __exit cxusb_module_exit(voi
 module_init (cxusb_module_init);
 module_exit (cxusb_module_exit);

-MODULE_AUTHOR("Patrick Boettcher <patrick.boettcher@desy.de>");
-MODULE_DESCRIPTION("Driver for Conexant USB2.0 hybrid reference design");
-MODULE_VERSION("1.0-alpha");
-MODULE_LICENSE("GPL");
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE(DRIVER_LICENSE);
_

--Apple-Mail-19-526132722
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed



--
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Homepage: www.system-calls.com

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc



--Apple-Mail-19-526132722
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-19-526132722--
