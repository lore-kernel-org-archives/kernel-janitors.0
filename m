From: Tracey Dent <tdent48227@gmail.com>
Date: Sat, 02 Oct 2010 16:38:04 +0000
Subject: [PATCH v3 15/20] Staging: tm6000: Makefile: cleaned up Makefile cflag lines
Message-Id: <1286037489-28439-15-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/tm6000/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/tm6000/Makefile b/drivers/staging/tm6000/Makefile
index 77e06bf..d8ccdaa 100644
--- a/drivers/staging/tm6000/Makefile
+++ b/drivers/staging/tm6000/Makefile
@@ -9,7 +9,7 @@ obj-$(CONFIG_VIDEO_TM6000) += tm6000.o
 obj-$(CONFIG_VIDEO_TM6000_ALSA) += tm6000-alsa.o
 obj-$(CONFIG_VIDEO_TM6000_DVB) += tm6000-dvb.o
 
-EXTRA_CFLAGS = -Idrivers/media/video
-EXTRA_CFLAGS += -Idrivers/media/common/tuners
-EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core
-EXTRA_CFLAGS += -Idrivers/media/dvb/frontends
+ccflags-y := -Idrivers/media/video
+ccflags-y += -Idrivers/media/common/tuners
+ccflags-y += -Idrivers/media/dvb/dvb-core
+ccflags-y += -Idrivers/media/dvb/frontends
-- 
1.7.3.1.50.g1e633

