From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:47:25 +0000
Subject: [KJ] [PATCH 32/33] sound/rawmidi: replace
Message-Id: <20050126004725.GX12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79930405305836549=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79930405305836549==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wai_event_interruptible_timeout() instead of
deprecated interruptible_sleep_on_timeout(). Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/sound/core/rawmidi.c	2005-01-25 16:45:12.000000000 -0800
+++ 2.6.11-rc2-kj/sound/core/rawmidi.c	2005-01-24 17:22:36.000000000 -0800
@@ -30,6 +30,7 @@
 #include <linux/wait.h>
 #include <linux/moduleparam.h>
 #include <linux/delay.h>
+#include <linux/wait.h>
 #include <sound/rawmidi.h>
 #include <sound/info.h>
 #include <sound/control.h>
@@ -133,17 +134,14 @@ int snd_rawmidi_drain_output(snd_rawmidi
 
 	err = 0;
 	runtime->drain = 1;
-	while (runtime->avail < runtime->buffer_size) {
-		timeout = interruptible_sleep_on_timeout(&runtime->sleep, 10 * HZ);
-		if (signal_pending(current)) {
-			err = -ERESTARTSYS;
-			break;
-		}
-		if (runtime->avail < runtime->buffer_size && !timeout) {
-			snd_printk(KERN_WARNING "rawmidi drain error (avail = %li, buffer_size = %li)\n", (long)runtime->avail, (long)runtime->buffer_size);
-			err = -EIO;
-			break;
-		}
+	timeout = wait_event_interruptible_timeout(runtime->sleep,
+				(runtime->avail >= runtime->buffer_size),
+				10*HZ);
+	if (signal_pending(current))
+		err = -ERESTARTSYS;
+	if (runtime->avail < runtime->buffer_size && !timeout) {
+		snd_printk(KERN_WARNING "rawmidi drain error (avail = %li, buffer_size = %li)\n", (long)runtime->avail, (long)runtime->buffer_size);
+		err = -EIO;
 	}
 	runtime->drain = 0;
 	if (err != -ERESTARTSYS) {

--===============79930405305836549==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79930405305836549==--
