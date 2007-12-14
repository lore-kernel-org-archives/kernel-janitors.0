From: Francisco Alecrim <francisco.alecrim@indt.org.br>
Date: Fri, 14 Dec 2007 18:56:49 +0000
Subject: [PATCH 5/6] drivers/net: clean up remove duplicated headers
Message-Id: <1197658610-4558-6-git-send-email-francisco.alecrim@indt.org.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: "Francisco Alecrim <francisco.alecrim@indt.org.br>"
 <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-4-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-5-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-5-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, dmitry.torokhov@gmail.com, hcegtvedt@atmel.com, Francisco Alecrim <francisco.alecrim@indt.org.br>

Remove duplicated headers in drivers/net:
drivers/net/ucc_geth_ethtool.c: asm/uaccess.h is included more than once.
drivers/net/irda/ks959-sir.c: linux/module.h is included more than once.
drivers/net/irda/ksdazzle-sir.c: linux/module.h is included more than once.

Signed-off-by: Francisco Alecrim <francisco.alecrim@indt.org.br>
---
 drivers/net/irda/ks959-sir.c    |    1 -
 drivers/net/irda/ksdazzle-sir.c |    1 -
 drivers/net/ucc_geth_ethtool.c  |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

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
diff --git a/drivers/net/ucc_geth_ethtool.c b/drivers/net/ucc_geth_ethtool.c
index 9a9622c..68c8700 100644
--- a/drivers/net/ucc_geth_ethtool.c
+++ b/drivers/net/ucc_geth_ethtool.c
@@ -37,7 +37,6 @@
 #include <asm/irq.h>
 #include <asm/uaccess.h>
 #include <asm/types.h>
-#include <asm/uaccess.h>
 
 #include "ucc_geth.h"
 #include "ucc_geth_mii.h"
-- 
1.5.3.7

