From: Joe Perches <joe@perches.com>
Date: Sun, 19 Aug 2007 22:18:48 +0000
Subject: [PATCH 2/5] drivers/char/... convert #include "linux/..." to
Message-Id: <1187561928.4200.139.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alan Cox <alan@redhat.com>, Amit Choudhary <amit2030@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Dave Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@suse.de>, Jean Delvare <khali@linux-fr.org>, Paul Fulghum <paulkf@microgate.com>, Pierre Ossman <drzeus-list@drzeus.cx>, Roland Dreier <rolandd@cisco.com>, Russell King <rmk@arm.linux.org.uk>, Yoann Padioleau <padator@wanadoo.fr>, dri-devel@lists.sourceforge.net, linux-pcmcia@lists.infradead.org

(untested)

There are several files that 
#include "linux/file" not #include <linux/file>
#include "asm/file" not #include <asm/file>

Here's a little script that converts them:

egrep -i -r -l --include=*.[ch] \
"^[[:space:]]*\#[[:space:]]*include[[:space:]]*\"(linux|asm)/(.*)\"" * \
| xargs sed -i -e
's/^[[:space:]]*#[[:space:]]*include[[:space:]]*"\(linux\|asm\)\/\(.*
\)"/#include <\1\/\2>/g'

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/drivers/char/drm/drm_ioctl.c b/drivers/char/drm/drm_ioctl.c
index b195e10..902c4a1 100644
--- a/drivers/char/drm/drm_ioctl.c
+++ b/drivers/char/drm/drm_ioctl.c
@@ -36,7 +36,7 @@
#include "drmP.h"
#include "drm_core.h"

-#include "linux/pci.h"
+#include <linux/pci.h>

/**
  * Get the bus id.
diff --git a/drivers/char/pcmcia/synclink_cs.c
b/drivers/char/pcmcia/synclink_cs.c
index 2b88931..4a186ed 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -87,7 +87,7 @@

#include <asm/uaccess.h>

-#include "linux/synclink.h"
+#include <linux/synclink.h>

static MGSL_PARAMS default_params = {
MGSL_MODE_HDLC, /* unsigned long mode */
diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
index fdc256b..eb1d90a 100644
--- a/drivers/char/synclink.c
+++ b/drivers/char/synclink.c
@@ -114,7 +114,7 @@

#include <asm/uaccess.h>

-#include "linux/synclink.h"
+#include <linux/synclink.h>

#define RCLRVALUE 0xffff

diff --git a/drivers/char/synclink_gt.c b/drivers/char/synclink_gt.c
index bbb7f12..cb3d061 100644
--- a/drivers/char/synclink_gt.c
+++ b/drivers/char/synclink_gt.c
@@ -81,7 +81,7 @@
#include <asm/types.h>
#include <asm/uaccess.h>

-#include "linux/synclink.h"
+#include <linux/synclink.h>

#if defined(CONFIG_HDLC) || (defined(CONFIG_HDLC_MODULE) &&
defined(CONFIG_SYNCLINK_GT_MODULE))
#define SYNCLINK_GENERIC_HDLC 1
diff --git a/drivers/char/synclinkmp.c b/drivers/char/synclinkmp.c
index c63013b..726581e 100644
--- a/drivers/char/synclinkmp.c
+++ b/drivers/char/synclinkmp.c
@@ -80,7 +80,7 @@

#include <asm/uaccess.h>

-#include "linux/synclink.h"
+#include <linux/synclink.h>

static MGSL_PARAMS default_params = {
MGSL_MODE_HDLC, /* unsigned long mode */


