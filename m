From: Lauri Jakku <ljakku77@gmail.com>
Date: Tue, 04 Feb 2020 04:27:45 +0000
Subject: [PATCH] USB HID random timeout failures fixed by trying 20 times
Message-Id: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

send, 20ms apart, control messages, if error is timeout.

Signed-off-by: Lauri Jakku <lja@iki.fi>
---
drivers/usb/core/message.c | 30 +++++++++++++++++++++++++-----
1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 5adf489428aa..5d615b2f92d8 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -20,6 +20,7 @@
#include <linux/usb/hcd.h> /* for usbcore internals */
#include <linux/usb/of.h>
#include <asm/byteorder.h>
+#include <linux/errno.h>

#include "usb.h"

@@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
__u16 size, int timeout)
{
struct usb_ctrlrequest *dr;
- int ret;
+ int ret = -ETIMEDOUT;
+
+ /* retry_cnt * 10ms, max retry time set to 400ms */
+ int retry_cnt = 20;

dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
if (!dr)
@@ -149,11 +153,27 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
dr->wIndex = cpu_to_le16(index);
dr->wLength = cpu_to_le16(size);

- ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
+ do {
+ ret = usb_internal_control_msg(dev,
+ pipe,
+ dr,
+ data,
+ size,
+ timeout);
+
+ /*
+ * Linger a bit, prior to the next control message
+ * or if return value is timeout, but do try few
+ * times (max 200ms) before quitting.
+ */
+ if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
+ msleep(200);
+ else if (ret = -ETIMEDOUT)
+ msleep(20);
+
+ /* Loop while timeout, max retry_cnt times. */
+ } while ((retry_cnt-- > 0) && (ret = -ETIMEDOUT));

- /* Linger a bit, prior to the next control message. */
- if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
- msleep(200);

kfree(dr);

-- 
2.25.0
