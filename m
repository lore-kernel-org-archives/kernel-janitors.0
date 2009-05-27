From: Gerard Lledo <gerard.lledo@gmail.com>
Date: Wed, 27 May 2009 14:35:18 +0000
Subject: [PATCH] Staging: comedi: Add missing includes
Message-Id: <1243434919-10192-2-git-send-email-gerard.lledo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com>
In-Reply-To: <1243434919-10192-1-git-send-email-gerard.lledo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-next@vger.kernel.org, Gerard Lledo <gerard.lledo@gmail.com>

Fixes build errors due to missing includes

Signed-off-by: Gerard Lledo <gerard.lledo@gmail.com>
---
 drivers/staging/comedi/comedidev.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/comedi/comedidev.h b/drivers/staging/comedi/comedidev.h
index 7a1ccde..1cdf5aa 100644
--- a/drivers/staging/comedi/comedidev.h
+++ b/drivers/staging/comedi/comedidev.h
@@ -38,6 +38,9 @@
 #include <linux/dma-mapping.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/timer.h>
 
 #include "comedi.h"
 
-- 
1.5.6.5

