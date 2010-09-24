From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:18:25 +0000
Subject: [PATCH 12/21] Staging: rtl8192su: Makefile: cleaaned up makefile cflag lines
Message-Id: <1285352314-5939-12-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/rtl8192su/Makefile |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192su/Makefile b/drivers/staging/rtl8192su/Makefile
index 7133894..cce7fed 100644
--- a/drivers/staging/rtl8192su/Makefile
+++ b/drivers/staging/rtl8192su/Makefile
@@ -1,12 +1,12 @@
 NIC_SELECT = RTL8192SU
 
-EXTRA_CFLAGS += -std=gnu89
-EXTRA_CFLAGS += -O2
+ccflags-y += -std=gnu89
+ccflags-y += -O2
 
-EXTRA_CFLAGS += -DJACKSON_NEW_RX
-EXTRA_CFLAGS += -DTHOMAS_BEACON
+ccflags-y += -DJACKSON_NEW_RX
+ccflags-y += -DTHOMAS_BEACON
 
-#EXTRA_CFLAGS += -DMUTIPLE_BULK_OUT
+#ccflags-y += -DMUTIPLE_BULK_OUT
 
 r8192s_usb-objs :=		\
 	r8192U_wx.o		\
-- 
1.7.3

