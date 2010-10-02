From: Tracey Dent <tdent48227@gmail.com>
Date: Sat, 02 Oct 2010 16:37:55 +0000
Subject: [PATCH v3 06/20] Stagng: easycap: Makefile: cleaned up Makefile cflag lines
Message-Id: <1286037489-28439-6-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/easycap/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/easycap/Makefile b/drivers/staging/easycap/Makefile
index d93bd6b..680f370 100644
--- a/drivers/staging/easycap/Makefile
+++ b/drivers/staging/easycap/Makefile
@@ -5,9 +5,9 @@ easycap-objs	:= easycap_main.o easycap_low.o easycap_sound.o
 easycap-objs	+= easycap_ioctl.o easycap_settings.o
 easycap-objs	+= easycap_testcard.o
 
-EXTRA_CFLAGS += -Wall
+ccflags-y := -Wall
 # Impose all or none of the following:
-EXTRA_CFLAGS += -DEASYCAP_IS_VIDEODEV_CLIENT
-EXTRA_CFLAGS += -DEASYCAP_NEEDS_V4L2_DEVICE_H
-EXTRA_CFLAGS += -DEASYCAP_NEEDS_V4L2_FOPS
+ccflags-y += -DEASYCAP_IS_VIDEODEV_CLIENT
+ccflags-y += -DEASYCAP_NEEDS_V4L2_DEVICE_H
+ccflags-y += -DEASYCAP_NEEDS_V4L2_FOPS
 
-- 
1.7.3.1.50.g1e633

