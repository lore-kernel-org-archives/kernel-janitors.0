From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 31 Jan 2005 19:12:21 +0000
Subject: [KJ] [UPDATE PATCH 35/39] usb/hid-core: use wait_event_timeout()
Message-Id: <20050131191221.GD2683@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81179070291719213=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81179070291719213==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 31, 2005 at 10:50:53AM -0800, Greg KH wrote:
> On Fri, Jan 21, 2005 at 01:35:01PM -0800, Nishanth Aravamudan wrote:
> > Hi,
> > 
> > Please consider applying.
> > 
> > Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> > now unused variables.
> 
> This code does not even compile :(

Sorry about that, Greg. Fixed with patch below:

Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
now unused variables.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/usb/input/hid-core.c	2005-01-24 09:34:15.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/input/hid-core.c	2005-01-31 11:10:09.000000000 -0800
@@ -24,6 +24,7 @@
 #include <asm/unaligned.h>
 #include <asm/byteorder.h>
 #include <linux/input.h>
+#include <linux/wait.h>
 
 #undef DEBUG
 #undef DEBUG_DATA
@@ -1255,22 +1256,9 @@ void hid_submit_report(struct hid_device
 
 int hid_wait_io(struct hid_device *hid)
 {
-	DECLARE_WAITQUEUE(wait, current);
-	int timeout = 10*HZ;
-
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	add_wait_queue(&hid->wait, &wait);
-
-	while (timeout && (test_bit(HID_CTRL_RUNNING, &hid->iofl) ||
-			   test_bit(HID_OUT_RUNNING, &hid->iofl))) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		timeout = schedule_timeout(timeout);
-	}
-
-	set_current_state(TASK_RUNNING);
-	remove_wait_queue(&hid->wait, &wait);
-
-	if (!timeout) {
+	if (!wait_event_timeout(hid->wait, (!test_bit(HID_CTRL_RUNNING, &hid->iofl) &&
+					!test_bit(HID_OUT_RUNNING, &hid->iofl)),
+					10*HZ)) {
 		dbg("timeout waiting for ctrl or out queue to clear");
 		return -1;
 	}

--===============81179070291719213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81179070291719213==--
