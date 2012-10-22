From: Samuel Iglesias Gonsalvez <siglesias@igalia.com>
Date: Mon, 22 Oct 2012 07:36:48 +0000
Subject: [PATCH] Staging: ipack/carriers: fix missing include linux/slab.h
Message-Id: <1350891408-6755-1-git-send-email-siglesias@igalia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121020110833.GF5714@localhost>
In-Reply-To: <20121020110833.GF5714@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fengguang Wu <fengguang.wu@intel.com>
Cc: devel@driverdev.osuosl.org, Jens Taprogge <jens.taprogge@taprogge.org>, industrypack-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Iglesias Gonsalvez <siglesias@igalia.com>

Kernel build failed for parisc architecture:

drivers/staging/ipack/carriers/tpci200.c: In function 'tpci200_free_irq':
drivers/staging/ipack/carriers/tpci200.c:190:2: error: implicit declaration of
function 'kfree' [-Werror=implicit-function-declaration]
drivers/staging/ipack/carriers/tpci200.c: In function 'tpci200_request_irq':
drivers/staging/ipack/carriers/tpci200.c:217:2: error: implicit declaration of
function 'kzalloc' [-Werror=implicit-function-declaration]

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Samuel Iglesias Gonsalvez <siglesias@igalia.com>
---
 drivers/staging/ipack/carriers/tpci200.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/ipack/carriers/tpci200.c b/drivers/staging/ipack/carriers/tpci200.c
index 829fd1a..24e8e6d 100644
--- a/drivers/staging/ipack/carriers/tpci200.c
+++ b/drivers/staging/ipack/carriers/tpci200.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/slab.h>
 #include "tpci200.h"
 
 static const u16 tpci200_status_timeout[] = {
-- 
1.7.10.4

