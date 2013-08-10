From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sat, 10 Aug 2013 00:32:44 +0000
Subject: [PATCH 1/3] staging: usbip: fix non-ANSI function prototypes.
Message-Id: <1376094766-9175-2-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Add "void" to usbip_names_free() and usbip_vhci_driver_close() which are
parameterless functions.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/usbip/userspace/libsrc/usbip_common.c | 2 +-
 drivers/staging/usbip/userspace/libsrc/vhci_driver.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/usbip/userspace/libsrc/usbip_common.c b/drivers/staging/usbip/userspace/libsrc/usbip_common.c
index 17e08e0..30df056 100644
--- a/drivers/staging/usbip/userspace/libsrc/usbip_common.c
+++ b/drivers/staging/usbip/userspace/libsrc/usbip_common.c
@@ -244,7 +244,7 @@ int usbip_names_init(char *f)
 	return names_init(f);
 }
 
-void usbip_names_free()
+void usbip_names_free(void)
 {
 	names_free();
 }
diff --git a/drivers/staging/usbip/userspace/libsrc/vhci_driver.c b/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
index 25e62e9f..499abed 100644
--- a/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
+++ b/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
@@ -400,7 +400,7 @@ err:
 }
 
 
-void usbip_vhci_driver_close()
+void usbip_vhci_driver_close(void)
 {
 	if (!vhci_driver)
 		return;
-- 
1.8.3.1

