From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:21:41 +0000
Subject: [PATCH 01/21] Staging: cx25821: Makefile: cleaned up makefile cflag lines
Message-Id: <1285352501-6011-1-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use proper ccflags-y option.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/cx25821/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/cx25821/Makefile b/drivers/staging/cx25821/Makefile
index d0eb16e..77cbb83 100644
--- a/drivers/staging/cx25821/Makefile
+++ b/drivers/staging/cx25821/Makefile
@@ -7,7 +7,7 @@ cx25821-objs   := cx25821-core.o cx25821-cards.o cx25821-i2c.o \
 obj-$(CONFIG_VIDEO_CX25821) += cx25821.o
 obj-$(CONFIG_VIDEO_CX25821_ALSA) += cx25821-alsa.o
 
-EXTRA_CFLAGS += -Idrivers/media/video
-EXTRA_CFLAGS += -Idrivers/media/common/tuners
-EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core
-EXTRA_CFLAGS += -Idrivers/media/dvb/frontends
+ccflags-y += -Idrivers/media/video
+ccflags-y += -Idrivers/media/common/tuners
+ccflags-y += -Idrivers/media/dvb/dvb-core
+ccflags-y += -Idrivers/media/dvb/frontends
-- 
1.7.3

