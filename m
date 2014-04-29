From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Apr 2014 12:42:13 +0000
Subject: [patch] staging: frontier: fix some indenting
Message-Id: <20140429124213.GC18437@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were a couple lines which were not indented far enough and it was
confusing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/frontier/tranzport.c b/drivers/staging/frontier/tranzport.c
index 0571988..334ba04 100644
--- a/drivers/staging/frontier/tranzport.c
+++ b/drivers/staging/frontier/tranzport.c
@@ -271,8 +271,8 @@ static void usb_tranzport_interrupt_in_callback(struct urb *urb)
 			 dev->interrupt_in_buffer[6],
 			 dev->interrupt_in_buffer[7]);
 #if SUPPRESS_EXTRA_OFFLINE_EVENTS
-	if (dev->offline = 2 && dev->interrupt_in_buffer[1] = 0xff)
-		goto resubmit;
+		if (dev->offline = 2 && dev->interrupt_in_buffer[1] = 0xff)
+			goto resubmit;
 		if (dev->offline = 1 && dev->interrupt_in_buffer[1] = 0xff) {
 			dev->offline = 2;
 			goto resubmit;
@@ -285,8 +285,8 @@ static void usb_tranzport_interrupt_in_callback(struct urb *urb)
 			dev->offline = 1;
 
 #endif	/* SUPPRESS_EXTRA_OFFLINE_EVENTS */
-	   dbg_info(&dev->intf->dev, "%s: head, tail are %x, %x\n",
-		__func__, dev->ring_head, dev->ring_tail);
+		dbg_info(&dev->intf->dev, "%s: head, tail are %x, %x\n",
+			 __func__, dev->ring_head, dev->ring_tail);
 
 		next_ring_head = (dev->ring_head + 1) % ring_buffer_size;
 
