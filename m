From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 08 Oct 2005 22:14:05 +0000
Subject: [KJ] Fwd: [PATCH] s/HANGUEL/HANGEUL/
Message-Id: <20051008221405.GE24907@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18478829311491335=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18478829311491335==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Jerome Pinot <ngc891@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH] atkbd: fix mispell of the korean alphabet name

 Sorry, can't reach the kernel-janitors mailing-list

 Fix a mispell of the korean alphabet name in the atkbd subsystem.
 See http://en.wikipedia.org/wiki/Hangeul#Names for more details.
 Will make some korean people happy.

 Signed-off-by: Jerome Pinot <ngc891@gmail.com>
 ---
	wikipedia: Hangeul
	google: 286000 vs 794
	KEY_HANGUEL left to not break people

				--adobriyan

 drivers/char/keyboard.c        |    2 +-
 drivers/input/keyboard/atkbd.c |    8 ++++----
 drivers/macintosh/adbhid.c     |    2 +-
 drivers/usb/input/hid-debug.h  |    2 +-
 include/linux/input.h          |    3 ++-
 5 files changed, 9 insertions(+), 8 deletions(-)

Index: linux-kj/drivers/char/keyboard.c
===================================================================
--- linux-kj.orig/drivers/char/keyboard.c	2005-10-07 17:52:51.000000000 +0400
+++ linux-kj/drivers/char/keyboard.c	2005-10-09 02:03:49.000000000 +0400
@@ -975,7 +975,7 @@ static int emulate_raw(struct vc_data *v
 			put_queue(vc, 0x1d | up_flag);
 			put_queue(vc, 0x45 | up_flag);
 			return 0;
-		case KEY_HANGUEL:
+		case KEY_HANGEUL:
 			if (!up_flag) put_queue(vc, 0xf1);
 			return 0;
 		case KEY_HANJA:
Index: linux-kj/drivers/input/keyboard/atkbd.c
===================================================================
--- linux-kj.orig/drivers/input/keyboard/atkbd.c	2005-10-07 17:53:00.000000000 +0400
+++ linux-kj/drivers/input/keyboard/atkbd.c	2005-10-09 02:04:21.000000000 +0400
@@ -149,7 +149,7 @@ static unsigned char atkbd_unxlate_table
 #define ATKBD_RET_EMUL0		0xe0
 #define ATKBD_RET_EMUL1		0xe1
 #define ATKBD_RET_RELEASE	0xf0
-#define ATKBD_RET_HANGUEL	0xf1
+#define ATKBD_RET_HANGEUL	0xf1
 #define ATKBD_RET_HANJA		0xf2
 #define ATKBD_RET_ERR		0xff
 
@@ -296,7 +296,7 @@ static irqreturn_t atkbd_interrupt(struc
 
 		if (atkbd->emul ||
 		    !(code == ATKBD_RET_EMUL0 || code == ATKBD_RET_EMUL1 ||
-		      code == ATKBD_RET_HANGUEL || code == ATKBD_RET_HANJA ||
+		      code == ATKBD_RET_HANGEUL || code == ATKBD_RET_HANJA ||
 		     (code == ATKBD_RET_ERR && !atkbd->err_xl) ||
 	             (code == ATKBD_RET_BAT && !atkbd->bat_xl))) {
 			atkbd->release = code >> 7;
@@ -325,8 +325,8 @@ static irqreturn_t atkbd_interrupt(struc
 		case ATKBD_RET_RELEASE:
 			atkbd->release = 1;
 			goto out;
-		case ATKBD_RET_HANGUEL:
-			atkbd_report_key(&atkbd->dev, regs, KEY_HANGUEL, 3);
+		case ATKBD_RET_HANGEUL:
+			atkbd_report_key(&atkbd->dev, regs, KEY_HANGEUL, 3);
 			goto out;
 		case ATKBD_RET_HANJA:
 			atkbd_report_key(&atkbd->dev, regs, KEY_HANJA, 3);
Index: linux-kj/drivers/macintosh/adbhid.c
===================================================================
--- linux-kj.orig/drivers/macintosh/adbhid.c	2005-10-07 17:53:09.000000000 +0400
+++ linux-kj/drivers/macintosh/adbhid.c	2005-10-09 02:04:53.000000000 +0400
@@ -179,7 +179,7 @@ u8 adb_to_linux_keycodes[128] = {
 	/* 0x65 */ KEY_F9,		/*  67 */
 	/* 0x66 */ KEY_HANJA,		/* 123 */
 	/* 0x67 */ KEY_F11,		/*  87 */
-	/* 0x68 */ KEY_HANGUEL,		/* 122 */
+	/* 0x68 */ KEY_HANGEUL,		/* 122 */
 	/* 0x69 */ KEY_SYSRQ,		/*  99 */
 	/* 0x6a */ 0,
 	/* 0x6b */ KEY_SCROLLLOCK,	/*  70 */
Index: linux-kj/drivers/usb/input/hid-debug.h
===================================================================
--- linux-kj.orig/drivers/usb/input/hid-debug.h	2005-10-07 17:52:47.000000000 +0400
+++ linux-kj/drivers/usb/input/hid-debug.h	2005-10-09 02:02:46.000000000 +0400
@@ -563,7 +563,7 @@ static char *keys[KEY_MAX + 1] = {
 	[KEY_VOLUMEUP] = "VolumeUp",		[KEY_POWER] = "Power",
 	[KEY_KPEQUAL] = "KPEqual",		[KEY_KPPLUSMINUS] = "KPPlusMinus",
 	[KEY_PAUSE] = "Pause",			[KEY_KPCOMMA] = "KPComma",
-	[KEY_HANGUEL] = "Hanguel",		[KEY_HANJA] = "Hanja",
+	[KEY_HANGEUL] = "Hangeul",		[KEY_HANJA] = "Hanja",
 	[KEY_YEN] = "Yen",			[KEY_LEFTMETA] = "LeftMeta",
 	[KEY_RIGHTMETA] = "RightMeta",		[KEY_COMPOSE] = "Compose",
 	[KEY_STOP] = "Stop",			[KEY_AGAIN] = "Again",
Index: linux-kj/include/linux/input.h
===================================================================
--- linux-kj.orig/include/linux/input.h	2005-10-07 17:53:20.000000000 +0400
+++ linux-kj/include/linux/input.h	2005-10-09 02:05:33.000000000 +0400
@@ -229,7 +229,8 @@ struct input_absinfo {
 #define KEY_PAUSE		119
 
 #define KEY_KPCOMMA		121
-#define KEY_HANGUEL		122
+#define KEY_HANGEUL		122
+#define KEY_HANGUEL		KEY_HANGEUL
 #define KEY_HANJA		123
 #define KEY_YEN			124
 #define KEY_LEFTMETA		125


--===============18478829311491335==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18478829311491335==--
