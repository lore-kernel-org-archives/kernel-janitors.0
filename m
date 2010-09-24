From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:18:29 +0000
Subject: [PATCH 16/21] Staging: tm6000: Makefile: cleaned up makefile cflag lines
Message-Id: <1285352314-5939-16-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/tm6000/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/tm6000/Makefile b/drivers/staging/tm6000/Makefile
index 77e06bf..f69a4fc 100644
--- a/drivers/staging/tm6000/Makefile
+++ b/drivers/staging/tm6000/Makefile
@@ -9,7 +9,7 @@ obj-$(CONFIG_VIDEO_TM6000) += tm6000.o
 obj-$(CONFIG_VIDEO_TM6000_ALSA) += tm6000-alsa.o
 obj-$(CONFIG_VIDEO_TM6000_DVB) += tm6000-dvb.o
 
-EXTRA_CFLAGS = -Idrivers/media/video
-EXTRA_CFLAGS += -Idrivers/media/common/tuners
-EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core
-EXTRA_CFLAGS += -Idrivers/media/dvb/frontends
+ccflags-y = -Idrivers/media/video
+ccflags-y += -Idrivers/media/common/tuners
+ccflags-y += -Idrivers/media/dvb/dvb-core
+ccflags-y += -Idrivers/media/dvb/frontends
-- 
1.7.3

