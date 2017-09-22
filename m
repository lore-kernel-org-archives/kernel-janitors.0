From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Sep 2017 20:43:46 +0000
Subject: [PATCH 2/2] USB: devio: Don't corrupt user memory
Message-Id: <20170922204346.3cohwogfnu26c2xa@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The user buffer has "uurb->buffer_length" bytes.  If the kernel has more
information than that, we should truncate it instead of writing past
the end of the user's buffer.  I added a WARN_ONCE() to help the user
debug the issue.

Reported-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 318bb3b96687..4664e543cf2f 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1571,7 +1576,11 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 			totlen += isopkt[u].length;
 		}
 		u *= sizeof(struct usb_iso_packet_descriptor);
-		uurb->buffer_length = totlen;
+		if (totlen <= uurb->buffer_length)
+			uurb->buffer_length = totlen;
+		else
+			WARN_ONCE(1, "uurb->buffer_length is too short %d vs %d",
+				  totlen, uurb->buffer_length);
 		break;
 
 	default:
