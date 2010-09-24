From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:27:54 +0000
Subject: [PATCH v2 06/22] Staging: easycap: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-6-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/easycap/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/easycap/Makefile b/drivers/staging/easycap/Makefile
index d93bd6b..d3133f8 100644
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
+ccflags-y := -DEASYCAP_IS_VIDEODEV_CLIENT
+ccflags-y := -DEASYCAP_NEEDS_V4L2_DEVICE_H
+ccflags-y := -DEASYCAP_NEEDS_V4L2_FOPS
 
-- 
1.7.3

