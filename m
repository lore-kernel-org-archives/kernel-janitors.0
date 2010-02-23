From: Dan Carpenter <error27@gmail.com>
Date: Tue, 23 Feb 2010 12:04:23 +0000
Subject: [patch] uwb: remove duplicate cpu_to_le16()
Message-Id: <20100223120423.GC5378@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Vrabel <david.vrabel@csr.com>
Cc: =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These parameters should be passed as cpu endian because we change it to
little endian inside usb_control_msg().  On x86 cpu_to_le16() doesn't
do anything so either way works but I think the original code would break 
on big endian systems.

I removed the masks as well because that usb_control_msg() parameters 
are __u16 so we already only use the lower bits.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I found this through static checking and I can't test it.  Please
review carefully.

diff --git a/drivers/uwb/i1480/dfu/usb.c b/drivers/uwb/i1480/dfu/usb.c
index 0bb665a..a7d4023 100644
--- a/drivers/uwb/i1480/dfu/usb.c
+++ b/drivers/uwb/i1480/dfu/usb.c
@@ -120,8 +120,7 @@ int i1480_usb_write(struct i1480 *i1480, u32 memory_address,
 		result = usb_control_msg(
 			i1480_usb->usb_dev, usb_sndctrlpipe(i1480_usb->usb_dev, 0),
 			0xf0, USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			cpu_to_le16(memory_address & 0xffff),
-			cpu_to_le16((memory_address >> 16) & 0xffff),
+			memory_address,	(memory_address >> 16),
 			i1480->cmd_buf, buffer_size, 100 /* FIXME: arbitrary */);
 		if (result < 0)
 			break;
@@ -166,8 +165,7 @@ int i1480_usb_read(struct i1480 *i1480, u32 addr, size_t size)
 		result = usb_control_msg(
 			i1480_usb->usb_dev, usb_rcvctrlpipe(i1480_usb->usb_dev, 0),
 			0xf0, USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			cpu_to_le16(itr_addr & 0xffff),
-			cpu_to_le16((itr_addr >> 16) & 0xffff),
+			itr_addr, (itr_addr >> 16),
 			i1480->cmd_buf + itr, itr_size,
 			100 /* FIXME: arbitrary */);
 		if (result < 0) {
