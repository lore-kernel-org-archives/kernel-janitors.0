From: Tracey Dent <tdent48227@gmail.com>
Date: Sat, 02 Oct 2010 16:37:59 +0000
Subject: [PATCH v3 10/20] Staging: rtl8192e: Makefile: cleaned up Makefile cflag lines
Message-Id: <1286037489-28439-10-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/rtl8192e/Makefile |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/Makefile b/drivers/staging/rtl8192e/Makefile
index 41cb4d3..6e41067 100644
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
+ccflags-y += -std=gnu89
+ccflags-y += -O2
+ccflags-y += -DTHOMAS_TURBO
+ccflags-y += -DENABLE_DOT11D
 
-EXTRA_CFLAGS += -DENABLE_IPS
-EXTRA_CFLAGS += -DENABLE_LPS
+ccflags-y += -DENABLE_IPS
+ccflags-y += -DENABLE_LPS
 
 r8192e_pci-objs :=		\
 	r8192E_core.o		\
-- 
1.7.3.1.50.g1e633

