From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:27:55 +0000
Subject: [PATCH v2 07/22] Staging: go7007: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-7-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/go7007/Makefile |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/go7007/Makefile b/drivers/staging/go7007/Makefile
index d37b7ed..9da150d 100644
--- a/drivers/staging/go7007/Makefile
+++ b/drivers/staging/go7007/Makefile
@@ -22,13 +22,12 @@ s2250-objs += s2250-board.o
 # Uncomment when the saa7134 patches get into upstream
 #ifneq ($(CONFIG_VIDEO_SAA7134),)
 #obj-$(CONFIG_VIDEO_SAA7134) += saa7134-go7007.o
-#EXTRA_CFLAGS += -Idrivers/media/video/saa7134 -DSAA7134_MPEG_GO7007=3
+#ccflags-y := -Idrivers/media/video/saa7134 -DSAA7134_MPEG_GO7007=3
 #endif
 
 # S2250 needs cypress ezusb loader from dvb-usb
-ifneq ($(CONFIG_VIDEO_GO7007_USB_S2250_BOARD),)
-EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-usb
-endif
+ccflags-$(CONFIG_VIDEO_GO7007_USB_S2250_BOARD) := -Idrivers/media/dvb/dvb-usb
 
-EXTRA_CFLAGS += -Idrivers/media/dvb/frontends
-EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core
+
+ccflags-y := -Idrivers/media/dvb/frontends
+ccflags-y := -Idrivers/media/dvb/dvb-core
-- 
1.7.3

