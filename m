From: Tracey Dent <tdent48227@gmail.com>
Date: Sat, 02 Oct 2010 16:37:53 +0000
Subject: [PATCH v3 04/20] Staging: dream: camera: Makefile: cleaned up Makefile cflag lines
Message-Id: <1286037489-28439-4-git-send-email-tdent48227@gmail.com>
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
1.7.3.1.50.g1e633

