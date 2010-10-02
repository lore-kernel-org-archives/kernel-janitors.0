From: Tracey Dent <tdent48227@gmail.com>
Date: Sat, 02 Oct 2010 16:38:01 +0000
Subject: [PATCH v3 12/20] Staging: rtl8192su: ieee80211: Makefile: cleaned up Makefile cflag lines
Message-Id: <1286037489-28439-12-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, Tracey Dent <tdent48227@gmail.com>

Changed to use the proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/rtl8192su/ieee80211/Makefile |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192su/ieee80211/Makefile b/drivers/staging/rtl8192su/ieee80211/Makefile
index a500bfa..5bee643 100644
--- a/drivers/staging/rtl8192su/ieee80211/Makefile
+++ b/drivers/staging/rtl8192su/ieee80211/Makefile
@@ -1,10 +1,10 @@
 NIC_SELECT = RTL8192SU
 
-EXTRA_CFLAGS += -O2
-EXTRA_CFLAGS += -DRTL8192S_DISABLE_FW_DM=0
-EXTRA_CFLAGS += -DRTL8192SU
-#EXTRA_CFLAGS += -DJOHN_NOCPY
-EXTRA_CFLAGS += -DTHOMAS_TURBO
+ccflags-y := -O2
+ccflags-y += -DRTL8192S_DISABLE_FW_DM=0
+ccflags-y += -DRTL8192SU
+#ccflags-y += -DJOHN_NOCPY
+ccflags-y += -DTHOMAS_TURBO
 
 ieee80211-rsl-objs := ieee80211_rx.o \
 		      ieee80211_softmac.o \
-- 
1.7.3.1.50.g1e633

