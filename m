From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 31 Jan 2005 19:40:22 +0000
Subject: [KJ] [UPDATE PATCH 36/39] usb/kaweth: use wait_event_timeout()
Message-Id: <20050131194022.GF2683@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49597099844927728=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49597099844927728==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 31, 2005 at 11:33:28AM -0800, Greg KH wrote:
> On Mon, Jan 31, 2005 at 11:27:03AM -0800, Nishanth Aravamudan wrote:
> > On Mon, Jan 31, 2005 at 10:51:59AM -0800, Greg KH wrote:
> > > On Fri, Jan 21, 2005 at 01:36:35PM -0800, Nishanth Aravamudan wrote:
> > > > Hi,
> > > > 
> > > > Please consider applying.
> > > > 
> > > > Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> > > > now unused variables. I changed the code to only add to the wait-queue if
> > > > necessary, but I'm not sure if this is correct.
> > > 
> > > Please at least compile your patches to make sure they build.  This one
> > > does not :(
> > 
> > I'm not seeing a build error here; what errors are coming up for you?
> 
> Don't remember anymore, as I reverted the patch already...
> 
> I think it was a {} matching issue like your other patches.

You are right. I had actually fixed this, but didn't mail the updated diff.
Sorry about that, Greg.

Please consider the following which builds cleanly.

Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
now unused variables. I changed the code to only add to the wait-queue if
necessary, but I'm not sure if this is correct.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-v/drivers/usb/net/kaweth.c	2005-01-31 11:17:54.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/net/kaweth.c	2005-01-24 09:35:07.000000000 -0800
@@ -58,6 +58,7 @@
 #include <linux/ethtool.h>
 #include <linux/pci.h>
 #include <linux/dma-mapping.h>
+#include <linux/wait.h>
 #include <asm/uaccess.h>
 #include <asm/semaphore.h>
 #include <asm/byteorder.h>
@@ -1180,31 +1181,21 @@ static void usb_api_blocking_completion(
 // Starts urb and waits for completion or timeout
 static int usb_start_wait_urb(struct urb *urb, int timeout, int* actual_length)
 {
-        DECLARE_WAITQUEUE(wait, current);
 	struct usb_api_data awd;
         int status;
 
         init_waitqueue_head(&awd.wqh);
         awd.done = 0;
 
-        add_wait_queue(&awd.wqh, &wait);
         urb->context = &awd;
         status = usb_submit_urb(urb, GFP_NOIO);
         if (status) {
                 // something went wrong
                 usb_free_urb(urb);
-                remove_wait_queue(&awd.wqh, &wait);
                 return status;
         }
 
-	while (timeout && !awd.done) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		timeout = schedule_timeout(timeout);
-	}
-
-        remove_wait_queue(&awd.wqh, &wait);
-
-        if (!timeout) {
+	if (!wait_event_timeout(awd.wqh, awd.done, timeout)) {
                 // timeout
                 kaweth_warn("usb_control/bulk_msg: timeout");
                 usb_kill_urb(urb);  // remove urb safely

--===============49597099844927728==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49597099844927728==--
