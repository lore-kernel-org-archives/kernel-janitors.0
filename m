From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:15:48 +0000
Subject: [Kernel-janitors] [PATCH] usb/tiglusb: insert set_current_state()
Message-Id: <20040727231548.GO4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62483528865600202=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62483528865600202==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry about that, didn't mean to send the patch quite yet...

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Insert set_current_state() so schedule_timeout()
functions as expected.
 
Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/misc/tiglusb.c	2004-06-16 05:18:47.000000000 +0000
+++ linux-dev/drivers/usb/misc/tiglusb.c	2004-07-13 20:29:54.000000000 +0000
@@ -115,6 +115,7 @@ tiglusb_open (struct inode *inode, struc
 			return -EBUSY;
 		}
 
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout (HZ / 2);
 
 		if (signal_pending (current)) {

--===============62483528865600202==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62483528865600202==--
