From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:18:26 +0000
Subject: [PATCH 13/21] Staging: rtl8192su: ieee80211: Makefile: cleaned up makefile cflag lines
Message-Id: <1285352314-5939-13-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use the proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/rtl8192su/ieee80211/Makefile |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192su/ieee80211/Makefile b/drivers/staging/rtl8192su/ieee80211/Makefile
index a500bfa..41fd157 100644
--- a/drivers/staging/rtl8192su/ieee80211/Makefile
+++ b/drivers/staging/rtl8192su/ieee80211/Makefile
@@ -1,10 +1,10 @@
 NIC_SELECT = RTL8192SU
 
-EXTRA_CFLAGS += -O2
-EXTRA_CFLAGS += -DRTL8192S_DISABLE_FW_DM=0
-EXTRA_CFLAGS += -DRTL8192SU
-#EXTRA_CFLAGS += -DJOHN_NOCPY
-EXTRA_CFLAGS += -DTHOMAS_TURBO
+ccflags-y += -O2
+ccflags-y += -DRTL8192S_DISABLE_FW_DM=0
+ccflags-y += -DRTL8192SU
+#ccflags-y += -DJOHN_NOCPY
+ccflags-y += -DTHOMAS_TURBO
 
 ieee80211-rsl-objs := ieee80211_rx.o \
 		      ieee80211_softmac.o \
-- 
1.7.3

