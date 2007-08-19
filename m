From: Joe Perches <joe@perches.com>
Date: Sun, 19 Aug 2007 22:19:11 +0000
Subject: [PATCH 3/5] drivers/scsi/... convert #include "linux/..." to
Message-Id: <1187561951.4200.142.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

(untested)

There are several files that 
#include "linux/file" not #include <linux/file>
#include "asm/file" not #include <asm/file>

Here's a little script that converts them:

egrep -i -r -l --include=*.[ch] \
"^[[:space:]]*\#[[:space:]]*include[[:space:]]*\"(linux|asm)/(.*)\"" * \
| xargs sed -i -e 's/^[[:space:]]*#[[:space:]]*include[[:space:]]*"\(linux\|asm\)\/\(.*\)"/#include <\1\/\2>/g'

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/drivers/scsi/aic94xx/aic94xx_dump.c b/drivers/scsi/aic94xx/aic94xx_dump.c
index 6bd8e30..ddf5f10 100644
--- a/drivers/scsi/aic94xx/aic94xx_dump.c
+++ b/drivers/scsi/aic94xx/aic94xx_dump.c
@@ -29,7 +29,7 @@
  *
  */
 
-#include "linux/pci.h"
+#include <linux/pci.h>
 #include "aic94xx.h"
 #include "aic94xx_reg.h"
 #include "aic94xx_reg_def.h"


