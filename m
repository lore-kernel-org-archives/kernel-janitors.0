From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Sun, 20 Jul 2008 20:06:19 +0000
Subject: [PATCH] libata.h: replace __FUNCTION__ with __func__
Message-Id: <48839ABB.3070503@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>

libata.h: replace __FUNCTION__ with __func__


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

---

 include/linux/libata.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/libata.h b/include/linux/libata.h
index 5b247b8..d4b8e5f 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -60,9 +60,9 @@

 /* note: prints function name for you */
 #ifdef ATA_DEBUG
-#define DPRINTK(fmt, args...) printk(KERN_ERR "%s: " fmt, __FUNCTION__, ## args)
+#define DPRINTK(fmt, args...) printk(KERN_ERR "%s: " fmt, __func__, ## args)
 #ifdef ATA_VERBOSE_DEBUG
-#define VPRINTK(fmt, args...) printk(KERN_ERR "%s: " fmt, __FUNCTION__, ## args)
+#define VPRINTK(fmt, args...) printk(KERN_ERR "%s: " fmt, __func__, ## args)
 #else
 #define VPRINTK(fmt, args...)
 #endif /* ATA_VERBOSE_DEBUG */
@@ -71,7 +71,7 @@
 #define VPRINTK(fmt, args...)
 #endif /* ATA_DEBUG */

-#define BPRINTK(fmt, args...) if (ap->flags & ATA_FLAG_DEBUGMSG) printk(KERN_ERR "%s: " fmt, __FUNCTION__, ## args)
+#define BPRINTK(fmt, args...) if (ap->flags & ATA_FLAG_DEBUGMSG) printk(KERN_ERR "%s: " fmt, __func__, ## args)

 /* NEW: debug levels */
 #define HAVE_LIBATA_MSG 1
