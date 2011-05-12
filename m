From: mfmooney@gmail.com
Date: Thu, 12 May 2011 05:08:09 +0000
Subject: [PATCH 03/12 v2] staging: usbip: fix header includes
Message-Id: <d889ac7da74d0a6d438b2e0855a76fc5e5299362.1305176085.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: matt mooney <mfm@muteddisk.com>

Modify header directives to include what is needed by each file and
not already included in its own header.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub.h         |    9 ++++-----
 drivers/staging/usbip/stub_dev.c     |    2 +-
 drivers/staging/usbip/stub_main.c    |    2 +-
 drivers/staging/usbip/stub_rx.c      |    5 +++--
 drivers/staging/usbip/stub_tx.c      |    2 +-
 drivers/staging/usbip/usbip_common.c |    8 ++++----
 drivers/staging/usbip/usbip_common.h |   16 ++++++++++------
 drivers/staging/usbip/usbip_event.c  |    1 +
 drivers/staging/usbip/vhci.h         |    8 +++++++-
 drivers/staging/usbip/vhci_hcd.c     |    6 +++++-
 drivers/staging/usbip/vhci_rx.c      |    2 +-
 drivers/staging/usbip/vhci_sysfs.c   |    5 +++--
 drivers/staging/usbip/vhci_tx.c      |    2 +-
 13 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/usbip/stub.h b/drivers/staging/usbip/stub.h
index cd3a5bf..6592aa2 100644
--- a/drivers/staging/usbip/stub.h
+++ b/drivers/staging/usbip/stub.h
@@ -17,13 +17,12 @@
  * USA.
  */
 
-#include <linux/kernel.h>
 #include <linux/list.h>
-#include <linux/spinlock.h>
 #include <linux/slab.h>
-#include <linux/string.h>
-#include <linux/module.h>
-#include <linux/net.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/wait.h>
 
 #define STUB_BUSID_OTHER 0
 #define STUB_BUSID_REMOV 1
diff --git a/drivers/staging/usbip/stub_dev.c b/drivers/staging/usbip/stub_dev.c
index 919d558..c71d0a3 100644
--- a/drivers/staging/usbip/stub_dev.c
+++ b/drivers/staging/usbip/stub_dev.c
@@ -17,7 +17,7 @@
  * USA.
  */
 
-#include <linux/slab.h>
+#include <linux/device.h>
 #include <linux/kthread.h>
 
 #include "usbip_common.h"
diff --git a/drivers/staging/usbip/stub_main.c b/drivers/staging/usbip/stub_main.c
index a3c73b2..1f8fc5e 100644
--- a/drivers/staging/usbip/stub_main.c
+++ b/drivers/staging/usbip/stub_main.c
@@ -17,7 +17,7 @@
  * USA.
  */
 
-#include <linux/slab.h>
+#include <linux/string.h>
 
 #include "usbip_common.h"
 #include "stub.h"
diff --git a/drivers/staging/usbip/stub_rx.c b/drivers/staging/usbip/stub_rx.c
index e11ac2a..e245609 100644
--- a/drivers/staging/usbip/stub_rx.c
+++ b/drivers/staging/usbip/stub_rx.c
@@ -17,12 +17,13 @@
  * USA.
  */
 
-#include <linux/slab.h>
+#include <asm/byteorder.h>
 #include <linux/kthread.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
 
 #include "usbip_common.h"
 #include "stub.h"
-#include <linux/usb/hcd.h>
 
 static int is_clear_halt_cmd(struct urb *urb)
 {
diff --git a/drivers/staging/usbip/stub_tx.c b/drivers/staging/usbip/stub_tx.c
index fc02261..3c332c2 100644
--- a/drivers/staging/usbip/stub_tx.c
+++ b/drivers/staging/usbip/stub_tx.c
@@ -17,8 +17,8 @@
  * USA.
  */
 
-#include <linux/slab.h>
 #include <linux/kthread.h>
+#include <linux/socket.h>
 
 #include "usbip_common.h"
 #include "stub.h"
diff --git a/drivers/staging/usbip/usbip_common.c b/drivers/staging/usbip/usbip_common.c
index 6c44fa4..fb95edf 100644
--- a/drivers/staging/usbip/usbip_common.c
+++ b/drivers/staging/usbip/usbip_common.c
@@ -17,12 +17,12 @@
  * USA.
  */
 
-#include <linux/kernel.h>
+#include <asm/byteorder.h>
 #include <linux/file.h>
-#include <linux/tcp.h>
-#include <linux/in.h>
-#include <linux/kthread.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
 #include <linux/slab.h>
+#include <net/sock.h>
 
 #include "usbip_common.h"
 
diff --git a/drivers/staging/usbip/usbip_common.h b/drivers/staging/usbip/usbip_common.h
index aa5d576..fd84ab2 100644
--- a/drivers/staging/usbip/usbip_common.h
+++ b/drivers/staging/usbip/usbip_common.h
@@ -17,14 +17,18 @@
  * USA.
  */
 
-#ifndef __VHCI_COMMON_H
-#define __VHCI_COMMON_H
+#ifndef __USBIP_COMMON_H
+#define __USBIP_COMMON_H
 
-#include <linux/version.h>
 #include <linux/compiler.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/net.h>
+#include <linux/printk.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
 #include <linux/usb.h>
-#include <asm/byteorder.h>
-#include <net/sock.h>
+#include <linux/wait.h>
 
 #define USBIP_VERSION "1.0.0"
 
@@ -366,4 +370,4 @@ void usbip_stop_eh(struct usbip_device *ud);
 void usbip_event_add(struct usbip_device *ud, unsigned long event);
 int usbip_event_happened(struct usbip_device *ud);
 
-#endif
+#endif /* __USBIP_COMMON_H */
diff --git a/drivers/staging/usbip/usbip_event.c b/drivers/staging/usbip/usbip_event.c
index 8861e3b..da6074d 100644
--- a/drivers/staging/usbip/usbip_event.c
+++ b/drivers/staging/usbip/usbip_event.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/kthread.h>
+
 #include "usbip_common.h"
 
 static int event_handler(struct usbip_device *ud)
diff --git a/drivers/staging/usbip/vhci.h b/drivers/staging/usbip/vhci.h
index d745c4e..d5bc8e7 100644
--- a/drivers/staging/usbip/vhci.h
+++ b/drivers/staging/usbip/vhci.h
@@ -17,8 +17,14 @@
  * USA.
  */
 
-#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/wait.h>
 
 struct vhci_device {
 	struct usb_device *udev;
diff --git a/drivers/staging/usbip/vhci_hcd.c b/drivers/staging/usbip/vhci_hcd.c
index 7372d4d..facd58e 100644
--- a/drivers/staging/usbip/vhci_hcd.c
+++ b/drivers/staging/usbip/vhci_hcd.c
@@ -17,8 +17,12 @@
  * USA.
  */
 
-#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/kthread.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "usbip_common.h"
 #include "vhci.h"
diff --git a/drivers/staging/usbip/vhci_rx.c b/drivers/staging/usbip/vhci_rx.c
index fedc442..2fe6cbf 100644
--- a/drivers/staging/usbip/vhci_rx.c
+++ b/drivers/staging/usbip/vhci_rx.c
@@ -17,8 +17,8 @@
  * USA.
  */
 
-#include <linux/slab.h>
 #include <linux/kthread.h>
+#include <linux/slab.h>
 
 #include "usbip_common.h"
 #include "vhci.h"
diff --git a/drivers/staging/usbip/vhci_sysfs.c b/drivers/staging/usbip/vhci_sysfs.c
index 4acded4..a684f22 100644
--- a/drivers/staging/usbip/vhci_sysfs.c
+++ b/drivers/staging/usbip/vhci_sysfs.c
@@ -17,11 +17,12 @@
  * USA.
  */
 
+#include <linux/kthread.h>
+#include <linux/net.h>
+
 #include "usbip_common.h"
 #include "vhci.h"
 
-#include <linux/in.h>
-
 /* TODO: refine locking ?*/
 
 /* Sysfs entry to show port status */
diff --git a/drivers/staging/usbip/vhci_tx.c b/drivers/staging/usbip/vhci_tx.c
index 62c9acb..c1aa03b 100644
--- a/drivers/staging/usbip/vhci_tx.c
+++ b/drivers/staging/usbip/vhci_tx.c
@@ -17,8 +17,8 @@
  * USA.
  */
 
-#include <linux/slab.h>
 #include <linux/kthread.h>
+#include <linux/slab.h>
 
 #include "usbip_common.h"
 #include "vhci.h"
-- 
1.7.5.1

