From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 13:18:05 +0000
Subject: [PATCH -next] bus: fsl-mc: Remove duplicated includes
Message-Id: <1522243085-93644-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bus/fsl-mc/dpbp.c | 1 -
 drivers/bus/fsl-mc/dpcon.c | 1 -
 2 file changed, 2 deletion(-)

diff --git a/drivers/bus/fsl-mc/dpbp.c b/drivers/bus/fsl-mc/dpbp.c
index 0aeacc5..9a7faab 100644
--- a/drivers/bus/fsl-mc/dpbp.c
+++ b/drivers/bus/fsl-mc/dpbp.c
@@ -5,7 +5,6 @@
  */
 #include <linux/kernel.h>
 #include <linux/fsl/mc.h>
-#include <linux/fsl/mc.h>
 
 #include "fsl-mc-private.h"
 
diff --git a/drivers/bus/fsl-mc/dpcon.c b/drivers/bus/fsl-mc/dpcon.c
index a1ba819..b5c968d 100644
--- a/drivers/bus/fsl-mc/dpcon.c
+++ b/drivers/bus/fsl-mc/dpcon.c
@@ -5,7 +5,6 @@
  */
 #include <linux/kernel.h>
 #include <linux/fsl/mc.h>
-#include <linux/fsl/mc.h>
 
 #include "fsl-mc-private.h"

