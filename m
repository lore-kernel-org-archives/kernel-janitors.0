From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:44:55 +0000
Subject: [KJ] [PATCH 29/39] sound/rawmidi: replace schedule_timeout() with
Message-Id: <20050121194455.GJ3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============025750815225463963=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============025750815225463963==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep instead of schedule_timeout() to guarantee the task
delays as expected. This also removes a dependence on the value of HZ.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/sound/core/rawmidi.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/sound/core/rawmidi.c	2005-01-18 13:24:06.000000000 -0800
@@ -29,6 +29,7 @@
 #include <linux/time.h>
 #include <linux/wait.h>
 #include <linux/moduleparam.h>
+#include <linux/delay.h>
 #include <sound/rawmidi.h>
 #include <sound/info.h>
 #include <sound/control.h>
@@ -149,10 +150,8 @@ int snd_rawmidi_drain_output(snd_rawmidi
 		/* we need wait a while to make sure that Tx FIFOs are empty */
 		if (substream->ops->drain)
 			substream->ops->drain(substream);
-		else {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ / 20);
-		}
+		else
+			msleep(50);
 		snd_rawmidi_drop_output(substream);
 	}
 	return err;

--===============025750815225463963==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============025750815225463963==--
