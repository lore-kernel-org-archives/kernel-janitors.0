From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:45:23 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/9] usb/dabusb: replace
Message-Id: <20040927214523.GJ1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35455256923551726=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35455256923551726==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
so that the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/usb/media/dabusb.c	2004-09-13 11:35:00.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/media/dabusb.c	2004-09-13 11:41:45.000000000 -0700
@@ -598,7 +598,7 @@ static int dabusb_open (struct inode *in
 		if (file->f_flags & O_NONBLOCK) {
 			return -EBUSY;
 		}
-		schedule_timeout (HZ / 2);
+		msleep_interruptible (500);
 
 		if (signal_pending (current)) {
 			return -EAGAIN;

--===============35455256923551726==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35455256923551726==--
