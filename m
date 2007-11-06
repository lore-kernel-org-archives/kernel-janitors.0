From: Jiri Olsa <olsajiri@gmail.com>
Date: Tue, 06 Nov 2007 15:10:57 +0000
Subject: [PATCH] drivers: Removing duplicit #includes
Message-Id: <47308401.4020609@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing duplicit #includes for drivers/
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>

---
 drivers/char/drm/drm_memory.h   |    2 --
 drivers/char/keyboard.c         |    1 -
 drivers/net/irda/ks959-sir.c    |    1 -
 drivers/net/irda/ksdazzle-sir.c |    1 -
 4 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/char/drm/drm_memory.h b/drivers/char/drm/drm_memory.h
index 63e425b..15af9b3 100644
--- a/drivers/char/drm/drm_memory.h
+++ b/drivers/char/drm/drm_memory.h
@@ -44,8 +44,6 @@
 
 #if __OS_HAS_AGP
 
-#include <linux/vmalloc.h>
-
 #ifdef HAVE_PAGE_AGP
 #include <asm/agp.h>
 #else
diff --git a/drivers/char/keyboard.c b/drivers/char/keyboard.c
index fc54d23..2c21fb1 100644
--- a/drivers/char/keyboard.c
+++ b/drivers/char/keyboard.c
@@ -38,7 +38,6 @@
 #include <linux/kbd_kern.h>
 #include <linux/kbd_diacr.h>
 #include <linux/vt_kern.h>
-#include <linux/consolemap.h>
 #include <linux/sysrq.h>
 #include <linux/input.h>
 #include <linux/reboot.h>
diff --git a/drivers/net/irda/ks959-sir.c b/drivers/net/irda/ks959-sir.c
index 8c257a5..db48998 100644
--- a/drivers/net/irda/ks959-sir.c
+++ b/drivers/net/irda/ks959-sir.c
@@ -118,7 +118,6 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/module.h>
 #include <linux/kref.h>
 #include <linux/usb.h>
 #include <linux/device.h>
diff --git a/drivers/net/irda/ksdazzle-sir.c b/drivers/net/irda/ksdazzle-sir.c
index d01a285..10c25b2 100644
--- a/drivers/net/irda/ksdazzle-sir.c
+++ b/drivers/net/irda/ksdazzle-sir.c
@@ -82,7 +82,6 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/module.h>
 #include <linux/kref.h>
 #include <linux/usb.h>
 #include <linux/device.h>
