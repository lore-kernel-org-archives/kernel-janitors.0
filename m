From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:35:00 +0000
Subject: [KJ] [PATCH 26/39] sound/emu8000: replace schedule_timeout() with
Message-Id: <20050121193500.GG3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31175485017925952=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31175485017925952==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use ssleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not check
for signals / early return, so ssleep() should be appropriate. I am fairly
certain the time conversion is ok, as well.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/sound/isa/sb/emu8000.c	2005-01-15 16:55:45.000000000 -0800
+++ 2.6.11-rc1-kj/sound/isa/sb/emu8000.c	2005-01-21 11:32:38.000000000 -0800
@@ -25,6 +25,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/ioport.h>
+#include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/emu8000.h>
 #include <sound/emu8000_reg.h>
@@ -355,8 +356,7 @@ init_arrays(emu8000_t *emu)
 {
 	send_array(emu, init1, ARRAY_SIZE(init1)/4);
 
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((HZ * (44099 + 1024)) / 44100); /* wait for 1024 clocks */
+	ssleep(1);
 	send_array(emu, init2, ARRAY_SIZE(init2)/4);
 	send_array(emu, init3, ARRAY_SIZE(init3)/4);
 

--===============31175485017925952==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31175485017925952==--
