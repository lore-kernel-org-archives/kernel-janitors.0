From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:27:52 +0000
Subject: [PATCH v2 04/22] Staging: dream: camera: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-4-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use the proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/dream/camera/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/dream/camera/Makefile b/drivers/staging/dream/camera/Makefile
index db228d7..03711dc 100644
--- a/drivers/staging/dream/camera/Makefile
+++ b/drivers/staging/dream/camera/Makefile
@@ -1,4 +1,4 @@
-EXTRA_CFLAGS=-Idrivers/staging/dream/include
+ccflags-y:=-Idrivers/staging/dream/include
 obj-$(CONFIG_MT9T013) += mt9t013.o mt9t013_reg.o
 obj-$(CONFIG_MT9D112) += mt9d112.o mt9d112_reg.o
 obj-$(CONFIG_MT9P012) += mt9p012_fox.o mt9p012_reg.o
-- 
1.7.3

