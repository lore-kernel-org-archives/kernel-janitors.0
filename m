From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 01 Feb 2005 21:07:17 +0000
Subject: [KJ] [PATCH] usb/mdc800: replace wake_up() with
Message-Id: <20050201210717.GD2575@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78421134141085913=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78421134141085913==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 01, 2005 at 11:51:36AM -0800, Nishanth Aravamudan wrote:
> On Mon, Jan 31, 2005 at 10:58:02AM -0800, Greg KH wrote:
> > On Fri, Jan 21, 2005 at 01:37:39PM -0800, Nishanth Aravamudan wrote:
> > > Hi,
> > > 
> > > Please consider applying.
> > > 
> > > Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> > > now unused variables.
> > > 
> > > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > Applied, thanks.
> 
> Greg,
> 
> This should fix the behavior of the previous patch (probably not noticed yet).
> The wake_up*() was not matched properly in the first patch (fixed below). Please
> consider reverting the previous patch and applying this one instead. I think it
> may actually have been somewhat broken in the original code, actually :)

Description: Modify the wake_up*() calls to match the wait_event*() ones
from a previous patch.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/usb/image/mdc800.c	2005-02-01 12:58:22.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/image/mdc800.c	2005-02-01 13:00:52.000000000 -0800
@@ -331,7 +331,7 @@ static void mdc800_usb_irq (struct urb *
 	{
 		mdc800->camera_request_ready=0;
 		mdc800->irq_woken=1;
-		wake_up_interruptible (&mdc800->irq_wait);
+		wake_up (&mdc800->irq_wait);
 	}
 }
 
@@ -386,7 +386,7 @@ static void mdc800_usb_write_notify (str
 		mdc800->state=READY;
 	}
 	mdc800->written = 1;
-	wake_up_interruptible (&mdc800->write_wait);
+	wake_up (&mdc800->write_wait);
 }
 
 
@@ -414,7 +414,7 @@ static void mdc800_usb_download_notify (
 		err ("request bytes fails (status:%i)", urb->status);
 	}
 	mdc800->downloaded = 1;
-	wake_up_interruptible (&mdc800->download_wait);
+	wake_up (&mdc800->download_wait);
 }
 
 

--===============78421134141085913==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78421134141085913==--
