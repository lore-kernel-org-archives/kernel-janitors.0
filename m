From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 22:54:19 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 8/9] usb/tiglusb: replace
Message-Id: <20040927225419.GP1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============073788646669490809=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============073788646669490809==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/usb/misc/tiglusb.c	2004-09-13 11:35:01.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/misc/tiglusb.c	2004-09-13 11:42:02.000000000 -0700
@@ -115,7 +115,7 @@ tiglusb_open (struct inode *inode, struc
 			return -EBUSY;
 		}
 
-		schedule_timeout (HZ / 2);
+		msleep_interruptible (500);
 
 		if (signal_pending (current)) {
 			return -EAGAIN;

--===============073788646669490809==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============073788646669490809==--
