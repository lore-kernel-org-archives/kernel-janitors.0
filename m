From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:28:09 +0000
Subject: [PATCH v2 21/22] Staging: wlags49_h2: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-21-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/wlags49_h2/Makefile |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/wlags49_h2/Makefile b/drivers/staging/wlags49_h2/Makefile
index 25d0a8a..198b823 100644
--- a/drivers/staging/wlags49_h2/Makefile
+++ b/drivers/staging/wlags49_h2/Makefile
@@ -12,8 +12,8 @@
 #  If you want to build AP support (untested), comment out -DSTA_ONLY
 
 INSTALLDIR := /lib/modules/$(shell uname -r)/kernel/drivers/net/wireless
-EXTRA_CFLAGS += -I$(KERNELDIR)/include
-EXTRA_CFLAGS += -I$(src) \
+ccflags-y := -I$(KERNELDIR)/include
+ccflags-y := -I$(src) \
 		-DBUS_PCMCIA \
 		-DUSE_WPA \
 		-DUSE_WEXT \
@@ -25,16 +25,16 @@ EXTRA_CFLAGS += -I$(src) \
 #		-DUSE_UIL \
 #		-DUSE_PROFILE \
 
-ifeq ($(findstring HERMES25,$(EXTRA_CFLAGS)),)
+ifeq ($(findstring HERMES25,$(ccflags-y)),)
 WLNAME := wlags49_h2_cs
 $(WLNAME)-y := sta_h2.o
-ifeq ($(findstring STA_ONLY,$(EXTRA_CFLAGS)),)
+ifeq ($(findstring STA_ONLY,$(ccflags-y)),)
 $(WLNAME)-y += ap_h2.o
 endif
 else
 WLNAME=wlags49_h25_cs
 $(WLNAME)-y := sta_h25.o
-ifeq ($(findstring STA_ONLY,$(EXTRA_CFLAGS)),)
+ifeq ($(findstring STA_ONLY,$(ccflags-y)),)
 $(WLNAME)-y += ap_h25.o
 endif
 endif
-- 
1.7.3

