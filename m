From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 21:36:35 +0000
Subject: [KJ] [PATCH 36/39] usb/kaweth: use wait_event_timeout()
Message-Id: <20050121213635.GQ3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38114672309932174=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38114672309932174==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
now unused variables. I changed the code to only add to the wait-queue if
necessary, but I'm not sure if this is correct.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/usb/net/kaweth.c	2005-01-15 16:55:42.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/usb/net/kaweth.c	2005-01-17 19:39:41.000000000 -0800
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
+	if (!wait_event_timeout(awd.wqh, awd.done, timeout))
                 // timeout
                 kaweth_warn("usb_control/bulk_msg: timeout");
                 usb_kill_urb(urb);  // remove urb safely

--===============38114672309932174==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38114672309932174==--
