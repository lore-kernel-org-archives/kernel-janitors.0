From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 20:34:33 +0000
Subject: [Kernel-janitors] [PATCH 8/8] block/xd: replace schedule_timeout()
Message-Id: <20040915203433.GD5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12729179341128249=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12729179341128249==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep() or msleep_interruptible() [as appropriate]
instead of schedule_timeout() to gurantee the task delays as
expected. As a result changed the units of the timeout variable from
jiffies to msecs.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/block/xd.c	2004-09-13 17:16:05.000000000 -0700
+++ 2.6.9-rc2/drivers/block/xd.c	2004-09-14 11:55:19.000000000 -0700
@@ -62,7 +62,7 @@ static int xd[5] = { -1,-1,-1,-1, };
 
 #define XD_DONT_USE_DMA		0  /* Initial value. may be overriden using
 				      "nodma" module option */
-#define XD_INIT_DISK_DELAY	(30*HZ/1000)  /* 30 ms delay during disk initialization */
+#define XD_INIT_DISK_DELAY	(30)  /* 30 ms delay during disk initialization */
 
 /* Above may need to be increased if a problem with the 2nd drive detection
    (ST11M controller) or resetting a controller (WD) appears */
@@ -625,14 +625,12 @@ static u_char __init xd_initdrives (void
 	for (i = 0; i < XD_MAXDRIVES; i++) {
 		xd_build(cmdblk,CMD_TESTREADY,i,0,0,0,0,0);
 		if (!xd_command(cmdblk,PIO_MODE,NULL,NULL,NULL,XD_TIMEOUT*8)) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(XD_INIT_DISK_DELAY);
+			msleep_interruptible(XD_INIT_DISK_DELAY);
 
 			init_drive(count);
 			count++;
 
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(XD_INIT_DISK_DELAY);
+			msleep_interruptible(XD_INIT_DISK_DELAY);
 		}
 	}
 	return (count);
@@ -753,8 +751,7 @@ static void __init xd_wd_init_controller
 
 	outb(0,XD_RESET);		/* reset the controller */
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(XD_INIT_DISK_DELAY);
+	msleep(XD_INIT_DISK_DELAY);
 }
 
 static void __init xd_wd_init_drive (u_char drive)
@@ -928,8 +925,7 @@ If you need non-standard settings use th
 	xd_maxsectors = 0x01;
 	outb(0,XD_RESET);		/* reset the controller */
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(XD_INIT_DISK_DELAY);
+	msleep(XD_INIT_DISK_DELAY);
 }
 
 static void __init xd_xebec_init_drive (u_char drive)

--===============12729179341128249==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12729179341128249==--
