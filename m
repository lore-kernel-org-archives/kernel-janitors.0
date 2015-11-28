From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 28 Nov 2015 14:18:59 +0000
Subject: [PATCH 1/2] USB: constify usb_mon_operations structure
Message-Id: <1448720340-16837-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

The usb_mon_operations structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 include/linux/usb/hcd.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index f89c24b..4dcf844 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -660,7 +660,7 @@ struct usb_mon_operations {
 	/* void (*urb_unlink)(struct usb_bus *bus, struct urb *urb); */
 };
 
-extern struct usb_mon_operations *mon_ops;
+extern const struct usb_mon_operations *mon_ops;
 
 static inline void usbmon_urb_submit(struct usb_bus *bus, struct urb *urb)
 {
@@ -682,7 +682,7 @@ static inline void usbmon_urb_complete(struct usb_bus *bus, struct urb *urb,
 		(*mon_ops->urb_complete)(bus, urb, status);
 }
 
-int usb_mon_register(struct usb_mon_operations *ops);
+int usb_mon_register(const struct usb_mon_operations *ops);
 void usb_mon_deregister(void);
 
 #else

