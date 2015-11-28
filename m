From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 28 Nov 2015 14:19:00 +0000
Subject: [PATCH 2/2] USB: constify usb_mon_operations structure
Message-Id: <1448720340-16837-2-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/usb/core/hcd.c     |    4 ++--
 drivers/usb/mon/mon_main.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 1c102d6..df0e3b9 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -3000,7 +3000,7 @@ EXPORT_SYMBOL_GPL(usb_hcd_platform_shutdown);
 
 #if defined(CONFIG_USB_MON) || defined(CONFIG_USB_MON_MODULE)
 
-struct usb_mon_operations *mon_ops;
+const struct usb_mon_operations *mon_ops;
 
 /*
  * The registration is unlocked.
@@ -3010,7 +3010,7 @@ struct usb_mon_operations *mon_ops;
  * symbols from usbcore, usbcore gets referenced and cannot be unloaded first.
  */
 
-int usb_mon_register (struct usb_mon_operations *ops)
+int usb_mon_register(const struct usb_mon_operations *ops)
 {
 
 	if (mon_ops)
diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
index f7c292f..fec3f11 100644
--- a/drivers/usb/mon/mon_main.c
+++ b/drivers/usb/mon/mon_main.c
@@ -241,7 +241,7 @@ static struct notifier_block mon_nb = {
 /*
  * Ops
  */
-static struct usb_mon_operations mon_ops_0 = {
+static const struct usb_mon_operations mon_ops_0 = {
 	.urb_submit =	mon_submit,
 	.urb_submit_error = mon_submit_error,
 	.urb_complete =	mon_complete,

