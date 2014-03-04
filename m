From: Shaun Laing <shaun@xresource.ca>
Date: Tue, 04 Mar 2014 19:44:21 +0000
Subject: [PATCH] staging: cxt1e1: Add extern keyword for sparse 'static' warning
Message-Id: <1393962261-2380992-1-git-send-email-shaun@xresource.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Resolve sparse "warning: symbol '...' was not declared.  Should it be static?"
messages.  Includes "comet_tables.h", which contains extern declarations for
the variables defined in comet_tables.c.

Signed-off-by: Shaun Laing <shaun@xresource.ca>
---
 drivers/staging/cxt1e1/comet_tables.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/cxt1e1/comet_tables.c b/drivers/staging/cxt1e1/comet_tables.c
index 8493111..e96665e 100644
--- a/drivers/staging/cxt1e1/comet_tables.c
+++ b/drivers/staging/cxt1e1/comet_tables.c
@@ -19,6 +19,7 @@
  */
 
 #include <linux/types.h>
+#include "comet_tables.h"
 
 /*****************************************************************************
 *
-- 
1.7.9.5

