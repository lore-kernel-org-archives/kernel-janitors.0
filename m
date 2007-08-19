From: Joe Perches <joe@perches.com>
Date: Sun, 19 Aug 2007 22:19:32 +0000
Subject: [PATCH 4/5] Documentation/firmware/... convert #include
Message-Id: <1187561972.4200.143.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Markus Rechberger <markus.rechberger@amd.com>

(untested)

There are several files that 
#include "linux/file" not #include <linux/file>
#include "asm/file" not #include <asm/file>

Here's a little script that converts them:

egrep -i -r -l --include=*.[ch] \
"^[[:space:]]*\#[[:space:]]*include[[:space:]]*\"(linux|asm)/(.*)\"" * \
| xargs sed -i -e 's/^[[:space:]]*#[[:space:]]*include[[:space:]]*"\(linux\|asm\)\/\(.*\)"/#include <\1\/\2>/g'

This one is probably wrong.

It should likely keep firmware.h in
the same directory as firmware.c

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/Documentation/firmware_class/firmware_sample_driver.c b/Documentation/firmware_class/firmware_sample_driver.c
index 6865cbe..754ded2 100644
--- a/Documentation/firmware_class/firmware_sample_driver.c
+++ b/Documentation/firmware_class/firmware_sample_driver.c
@@ -13,7 +13,7 @@
 #include <linux/device.h>
 #include <linux/string.h>
 
-#include "linux/firmware.h"
+#include "firmware.h"
 
 static struct device ghost_device = {
 	.bus_id    = "ghost0",



