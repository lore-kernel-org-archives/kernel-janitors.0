From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:54:14 +0000
Subject: [KJ] [PATCH] pci/quirks: replace schedule_timeout() with msleep()
Message-Id: <20041022235414.GL18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69712524366656581=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69712524366656581==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/pci/quirks.c	2004-10-22 10:40:52.000000000 -0700
+++ 2.6.9-bk7/drivers/pci/quirks.c	2004-10-22 15:17:43.000000000 -0700
@@ -938,8 +938,7 @@ static void __devinit quirk_usb_handoff_
 		while (wait_time > 0 && 
 				readl(base + OHCI_CONTROL) & OHCI_CTRL_IR) {
 			wait_time -= 10;
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout((HZ*10 + 999) / 1000);
+			msleep(10);
 		}
 	}
 
@@ -988,8 +987,7 @@ static void __devinit quirk_usb_disable_
 
 			wait_time = 500;
 			do {
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout((HZ*10+999)/1000);
+				msleep(10);
 				wait_time -= 10;
 				pci_read_config_dword(pdev,
 						hcc_params + EHCI_USBLEGSUP,

--===============69712524366656581==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69712524366656581==--
