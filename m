From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 01:31:45 +0000
Subject: [PATCH] Staging: rtl8187se: Makefile: cleaned up makefile cflag lines
Message-Id: <1285291905-3739-1-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use the proper ccflags-y option.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/rtl8187se/Makefile |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8187se/Makefile b/drivers/staging/rtl8187se/Makefile
index e6adf91..3c143e3 100644
--- a/drivers/staging/rtl8187se/Makefile
+++ b/drivers/staging/rtl8187se/Makefile
@@ -1,20 +1,20 @@
 
-#EXTRA_CFLAGS += -DCONFIG_IEEE80211_NOWEP=y
-#EXTRA_CFLAGS += -std=gnu89
-#EXTRA_CFLAGS += -O2
+#ccflags-y +=  -DCONFIG_IEEE80211_NOWEP=y
+#ccflags-y += -std=gnu89
+#ccflags-y +=  -O2
 #CC            = gcc
 
-EXTRA_CFLAGS += -DSW_ANTE
-EXTRA_CFLAGS += -DTX_TRACK
-EXTRA_CFLAGS += -DHIGH_POWER
-EXTRA_CFLAGS += -DSW_DIG
-EXTRA_CFLAGS += -DRATE_ADAPT
+ccflags-y += -DSW_ANTE
+ccflags-y += -DTX_TRACK
+ccflags-y +=  -DHIGH_POWER
+ccflags-y += -DSW_DIG
+ccflags-y += -DRATE_ADAPT
 
 #enable it for legacy power save, disable it for leisure  power save
-EXTRA_CFLAGS += -DENABLE_LPS
+ccflags-y +=  -DENABLE_LPS
 
 
-#EXTRA_CFLAGS += -mhard-float -DCONFIG_FORCE_HARD_FLOAT=y
+#ccflags-y +=  -mhard-float -DCONFIG_FORCE_HARD_FLOAT=y
 
 r8187se-objs :=			\
 		r8180_core.o		\
-- 
1.7.3

