From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:28:00 +0000
Subject: [PATCH v2 12/22] Staging: rt8192e: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-12-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/rtl8192e/Makefile |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/Makefile b/drivers/staging/rtl8192e/Makefile
index 41cb4d3..96e7abf 100644
--- a/drivers/staging/rtl8192e/Makefile
+++ b/drivers/staging/rtl8192e/Makefile
@@ -1,13 +1,13 @@
 NIC_SELECT = RTL8192E
 
-EXTRA_CFLAGS += -DRTL8192E
-EXTRA_CFLAGS += -std=gnu89
-EXTRA_CFLAGS += -O2
-EXTRA_CFLAGS += -DTHOMAS_TURBO
-EXTRA_CFLAGS += -DENABLE_DOT11D
+ccflags-y := -DRTL8192E
+ccflags-y := -std=gnu89
+ccflags-y := -O2
+ccflags-y := -DTHOMAS_TURBO
+ccflags-y := -DENABLE_DOT11D
 
-EXTRA_CFLAGS += -DENABLE_IPS
-EXTRA_CFLAGS += -DENABLE_LPS
+ccflags-y := -DENABLE_IPS
+ccflags-y := -DENABLE_LPS
 
 r8192e_pci-objs :=		\
 	r8192E_core.o		\
-- 
1.7.3

