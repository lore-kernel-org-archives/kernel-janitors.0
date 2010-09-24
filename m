From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:28:01 +0000
Subject: [PATCH v2 13/22] Staging: rtl8192su: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-13-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/rtl8192su/Makefile |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192su/Makefile b/drivers/staging/rtl8192su/Makefile
index 7133894..88bcd97 100644
--- a/drivers/staging/rtl8192su/Makefile
+++ b/drivers/staging/rtl8192su/Makefile
@@ -1,12 +1,12 @@
 NIC_SELECT = RTL8192SU
 
-EXTRA_CFLAGS += -std=gnu89
-EXTRA_CFLAGS += -O2
+ccflags-y := -std=gnu89
+ccflags-y := -O2
 
-EXTRA_CFLAGS += -DJACKSON_NEW_RX
-EXTRA_CFLAGS += -DTHOMAS_BEACON
+ccflags-y := -DJACKSON_NEW_RX
+ccflags-y := -DTHOMAS_BEACON
 
-#EXTRA_CFLAGS += -DMUTIPLE_BULK_OUT
+#ccflags-y := -DMUTIPLE_BULK_OUT
 
 r8192s_usb-objs :=		\
 	r8192U_wx.o		\
-- 
1.7.3

