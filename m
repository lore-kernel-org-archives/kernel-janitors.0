From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:18:20 +0000
Subject: [PATCH 07/21] Staging: go7007: Makefile: cleaned up makefile cflags lines
Message-Id: <1285352314-5939-7-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/go7007/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/go7007/Makefile b/drivers/staging/go7007/Makefile
index d37b7ed..618e526e 100644
--- a/drivers/staging/go7007/Makefile
+++ b/drivers/staging/go7007/Makefile
@@ -22,13 +22,13 @@ s2250-objs += s2250-board.o
 # Uncomment when the saa7134 patches get into upstream
 #ifneq ($(CONFIG_VIDEO_SAA7134),)
 #obj-$(CONFIG_VIDEO_SAA7134) += saa7134-go7007.o
-#EXTRA_CFLAGS += -Idrivers/media/video/saa7134 -DSAA7134_MPEG_GO7007=3
+#ccflags-y += -Idrivers/media/video/saa7134 -DSAA7134_MPEG_GO7007=3
 #endif
 
 # S2250 needs cypress ezusb loader from dvb-usb
 ifneq ($(CONFIG_VIDEO_GO7007_USB_S2250_BOARD),)
-EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-usb
+ccflags-y += -Idrivers/media/dvb/dvb-usb
 endif
 
-EXTRA_CFLAGS += -Idrivers/media/dvb/frontends
-EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core
+ccflags-y += -Idrivers/media/dvb/frontends
+ccflags-y += -Idrivers/media/dvb/dvb-core
-- 
1.7.3

