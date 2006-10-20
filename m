From: David KOENIG <karhudever@gmail.com>
Date: Fri, 20 Oct 2006 02:40:21 +0000
Subject: [KJ] [PATCH] Fixed stv0299 driver to use time_after instead of
Message-Id: <200610191940.21559.karhudever@gmial.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

From 914ba26e82ade62ca88ffa986fc06b4c0fb7a215 Mon Sep 17 00:00:00 2001
From: David KOENIG <karhudever@gmail.com>
Date: Thu, 19 Oct 2006 19:38:26 -0700
Subject: [PATCH] Fixed stv0299 driver to use time_after instead of comparisons
---
 drivers/media/dvb/frontends/stv0299.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb/frontends/stv0299.c 
b/drivers/media/dvb/frontends/stv0299.c
index 9348376..ff4da5a 100644
--- a/drivers/media/dvb/frontends/stv0299.c
+++ b/drivers/media/dvb/frontends/stv0299.c
@@ -43,6 +43,7 @@
 */
 
 #include <linux/init.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -193,7 +194,7 @@ static int stv0299_wait_diseqc_fifo (str
 	dprintk ("%s\n", __FUNCTION__);
 
 	while (stv0299_readreg(state, 0x0a) & 1) {
-		if (jiffies - start > timeout) {
+		if (time_after(jiffies, start + timeout)) {
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}
@@ -210,7 +211,7 @@ static int stv0299_wait_diseqc_idle (str
 	dprintk ("%s\n", __FUNCTION__);
 
 	while ((stv0299_readreg(state, 0x0a) & 3) != 2 ) {
-		if (jiffies - start > timeout) {
+		if (time_after(jiffies, start + timeout)) {
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}
-- 
1.4.1


-- 
<>< karhudever@gmail.com

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
