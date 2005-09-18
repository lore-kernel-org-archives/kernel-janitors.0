From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 18 Sep 2005 02:12:21 +0000
Subject: [KJ] [PATCH] 2 of 20 Update MODULE_* macro (atxp1.c)
Message-Id: <AF7216D1-3122-40B0-8FD1-ABC589C79383@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-17-525969759"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Apple-Mail-17-525969759
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


--Apple-Mail-17-525969759
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0700;
	name="MOD_VERS_Conform_atxp1.patch"
Content-Disposition: attachment;
	filename=MOD_VERS_Conform_atxp1.patch


Signed-off-by: Jesse Millan <jesse.millan@gmail.com>
---

 drivers/hwmon/atxp1.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff -puN drivers/hwmon/atxp1.c~MOD_VERS_Conform_atxp1 drivers/hwmon/atxp1.c
--- linux-2.6.14-rc1/drivers/hwmon/atxp1.c~MOD_VERS_Conform_atxp1	2005-09-17 19:00:56.000000000 -0700
+++ linux-2.6.14-rc1-jessem/drivers/hwmon/atxp1.c	2005-09-17 19:02:17.000000000 -0700
@@ -27,10 +27,10 @@
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>

-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("System voltages control via Attansic ATXP1");
-MODULE_VERSION("0.6.2");
-MODULE_AUTHOR("Sebastian Witt <se.witt@gmx.net>");
+#define DRIVER_AUTHOR "Sebastian Witt <se.witt@gmx.net>"
+#define DRIVER_DESCRIPTION "System voltages control via Attansic ATXP1"
+#define DRIVER_VERSION "0.6.2"
+#define DRIVER_LICENSE "GPL"

 #define ATXP1_VID	0x00
 #define ATXP1_CVID	0x01
_

--Apple-Mail-17-525969759
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Apple-Mail-17-525969759--
