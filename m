From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 21:42:24 +0000
Subject: [Kernel-janitors] [PATCH] bluetooth/bluecard: replace
Message-Id: <20040722214224.GH2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85836349682777802=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85836349682777802==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am really sorry for this, but I didn't change what I had changed
before in the compileable patch (msleep(10) instead of mlseep(100)).
This is the final one, I swear (I think).

Please find below the corrected version, which compiles without error
for me.

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/bluetooth/bluecard_cs.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/bluetooth/bluecard_cs.c	2004-07-21 20:52:07.000000000 +0000
@@ -34,6 +34,7 @@
 #include <linux/ioport.h>
 #include <linux/spinlock.h>
 #include <linux/skbuff.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 
 #include <pcmcia/version.h>
@@ -776,8 +777,7 @@ int bluecard_open(bluecard_info_t *info)
 	outb(0x80, iobase + 0x30);
 
 	/* Wait some time */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ / 100);
+	msleep(10);
 
 	/* Turn FPGA on */
 	outb(0x00, iobase + 0x30);
@@ -823,8 +823,7 @@ int bluecard_open(bluecard_info_t *info)
 	outb((0x0f << RTS_LEVEL_SHIFT_BITS) | 1, iobase + REG_RX_CONTROL);
 
 	/* Timeout before it is safe to send the first HCI packet */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((HZ * 5) / 4);		// or set it to 3/2
+	msleep(1250);
 
 	/* Register HCI device */
 	if (hci_register_dev(hdev) < 0) {

--===============85836349682777802==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85836349682777802==--
