From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:12:36 +0000
Subject: [Kernel-janitors] [PATCH] usb/auerswald: replace schedule_timeout()
Message-Id: <20040727231236.GM4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63292445176088297=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63292445176088297==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/misc/auerswald.c	2004-06-16 05:19:13.000000000 +0000
+++ linux-dev/drivers/usb/misc/auerswald.c	2004-07-06 01:12:12.000000000 +0000
@@ -1974,8 +1974,7 @@ static int auerswald_probe (struct usb_i
 	dbg ("Version is %X", cp->version);
 
 	/* allow some time to settle the device */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/3);
+	msleep(334);
 
 	/* Try to get a suitable textual description of the device */
 	/* Device name:*/

--===============63292445176088297==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63292445176088297==--
