From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 21 Jul 2004 21:18:02 +0000
Subject: [Kernel-janitors] [PATCH] bluetooth: replace schedule_timeout() with
Message-Id: <20040721211802.GI1906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59939258478676627=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720181806.GF2320@us.ibm.com>
In-Reply-To: <20040720181806.GF2320@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============59939258478676627==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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


--- linux-vanilla/drivers/bluetooth/dtl1_cs.c	2004-06-16 05:19:13.000000000 +0000
+++ linux-dev/drivers/bluetooth/dtl1_cs.c	2004-07-21 16:53:03.000000000 +0000
@@ -32,7 +32,7 @@
 #include <linux/ptrace.h>
 #include <linux/ioport.h>
 #include <linux/spinlock.h>
-
+#include <linux/delay.h>
 #include <linux/skbuff.h>
 #include <linux/string.h>
 #include <linux/serial.h>
@@ -524,8 +524,7 @@ int dtl1_open(dtl1_info_t *info)
 	spin_unlock_irqrestore(&(info->lock), flags);
 
 	/* Timeout before it is safe to send the first HCI packet */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ * 2);
+	msleep(2000);
 
 	/* Register HCI device */
 	if (hci_register_dev(hdev) < 0) {

--===============59939258478676627==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59939258478676627==--
