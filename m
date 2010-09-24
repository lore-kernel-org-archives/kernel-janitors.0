From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:27:51 +0000
Subject: [PATCH v2 03/22] Staging: dream: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-3-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/dream/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/dream/Makefile b/drivers/staging/dream/Makefile
index fbea0ab..87de1a5 100644
--- a/drivers/staging/dream/Makefile
+++ b/drivers/staging/dream/Makefile
@@ -1,4 +1,4 @@
-EXTRA_CFLAGS=-Idrivers/staging/dream/include
+ccflags-y:=-Idrivers/staging/dream/include
 obj-$(CONFIG_MSM_ADSP)		+= qdsp5/
 obj-$(CONFIG_MSM_CAMERA)	+= camera/
 obj-$(CONFIG_INPUT_GPIO)	+= gpio_axis.o gpio_event.o gpio_input.o gpio_matrix.o gpio_output.o
-- 
1.7.3

