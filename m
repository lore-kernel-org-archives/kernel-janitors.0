From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:18:30 +0000
Subject: [PATCH 17/21] Staging: usbip: Makefile: cleaned up makefile cflag lines
Message-Id: <1285352314-5939-17-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/usbip/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/usbip/Makefile b/drivers/staging/usbip/Makefile
index 6f2916b..0627d09 100644
--- a/drivers/staging/usbip/Makefile
+++ b/drivers/staging/usbip/Makefile
@@ -8,5 +8,5 @@ obj-$(CONFIG_USB_IP_HOST) += usbip.o
 usbip-objs := stub_dev.o stub_main.o stub_rx.o stub_tx.o
 
 ifeq ($(CONFIG_USB_IP_DEBUG_ENABLE),y)
-	EXTRA_CFLAGS += -DDEBUG
+	ccflags-y += -DDEBUG
 endif
-- 
1.7.3

