From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:08:54 +0000
Subject: [Kernel-janitors] [PATCH] usb/uhci-hcd: replace schedule_timeout()
Message-Id: <20040727230854.GJ4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28792238007677318=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28792238007677318==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/host/uhci-hcd.c	2004-06-16 05:19:53.000000000 +0000
+++ linux-dev/drivers/usb/host/uhci-hcd.c	2004-07-06 01:04:33.000000000 +0000
@@ -1834,13 +1834,11 @@ static void reset_hc(struct uhci_hcd *uh
 	/* Global reset for 50ms */
 	uhci->state = UHCI_RESET;
 	outw(USBCMD_GRESET, io_addr + USBCMD);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((HZ*50+999) / 1000);
+	msleep(50);
 	outw(0, io_addr + USBCMD);
 
 	/* Another 10ms delay */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((HZ*10+999) / 1000);
+	msleep(10);
 	uhci->resume_detect = 0;
 }
 

--===============28792238007677318==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28792238007677318==--
