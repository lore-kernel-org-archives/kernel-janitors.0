From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 16:44:51 +0000
Subject: Re: [Kernel-janitors] [PATCH] usb/dabusb: insert set_current_state()
Message-Id: <20040728164451.GD1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88351413152799108=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727231109.GK4679@us.ibm.com>
In-Reply-To: <20040727231109.GK4679@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============88351413152799108==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After discussing this patch with Mark Hollomon, I think it is much safer
/ better to leave the conditional check within the while loop. This way
the mutex state is as expected and maintainability is not compromised.
The previous patch should not be applied.

Applys-to: 2.6.7

Description: Inserts appropriate set_current_state() call so that
schedule_timeout() functions as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/media/dabusb.c	2004-06-15 22:19:36.000000000 -0700
+++ linux-dev/drivers/usb/media/dabusb.c	2004-07-28 09:41:42.000000000 -0700
@@ -598,6 +598,7 @@ static int dabusb_open (struct inode *in
 		if (file->f_flags & O_NONBLOCK) {
 			return -EBUSY;
 		}
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout (HZ / 2);
 
 		if (signal_pending (current)) {

--===============88351413152799108==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88351413152799108==--
