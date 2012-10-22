From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Mon, 22 Oct 2012 08:08:36 +0000
Subject: [PATCH] staging: media: as102: Replace deprecated EXTRA_CFLAGS with ccflags-y
Message-Id: <1350893316-9234-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

EXTRA_CFLAGS is deprecated and hence replace EXTRA_CFLAGS with
ccflags-y compiler flag from the Makefile.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/media/as102/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/as102/Makefile b/drivers/staging/media/as102/Makefile
index d8dfb75..8916d8a 100644
--- a/drivers/staging/media/as102/Makefile
+++ b/drivers/staging/media/as102/Makefile
@@ -3,4 +3,4 @@ dvb-as102-objs := as102_drv.o as102_fw.o as10x_cmd.o as10x_cmd_stream.o \
 
 obj-$(CONFIG_DVB_AS102) += dvb-as102.o
 
-EXTRA_CFLAGS += -Idrivers/media/dvb-core
+ccflags-y += -Idrivers/media/dvb-core
-- 
1.7.9.5

