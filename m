From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:11:09 +0000
Subject: [Kernel-janitors] [PATCH] usb/dabusb: insert set_current_state()
Message-Id: <20040727231109.GK4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6418634191588457=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6418634191588457==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Move non-blocking conditional check outside while-loop.
Insert set_current_stateo() so schedule_timeout() functions as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/media/dabusb.c	2004-06-16 05:19:36.000000000 +0000
+++ linux-dev/drivers/usb/media/dabusb.c	2004-07-13 20:36:32.000000000 +0000
@@ -592,12 +592,14 @@ static int dabusb_open (struct inode *in
 	dbg("dabusb_open");
 	down (&s->mutex);
 
+	if (file->f_flags & O_NONBLOCK) {
+		return -EBUSY;
+	}
+	
 	while (!s->usbdev || s->opened) {
 		up (&s->mutex);
 
-		if (file->f_flags & O_NONBLOCK) {
-			return -EBUSY;
-		}
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout (HZ / 2);
 
 		if (signal_pending (current)) {

--===============6418634191588457==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6418634191588457==--
