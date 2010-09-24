From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:27:50 +0000
Subject: [PATCH v2 02/22] Staging: cxlel: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-2-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/cxt1e1/Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/cxt1e1/Makefile b/drivers/staging/cxt1e1/Makefile
index 10020d7..451f59f 100644
--- a/drivers/staging/cxt1e1/Makefile
+++ b/drivers/staging/cxt1e1/Makefile
@@ -1,8 +1,8 @@
 obj-$(CONFIG_CXT1E1)	+= cxt1e1.o
 
-EXTRA_CFLAGS += -DSBE_PMCC4_ENABLE
-EXTRA_CFLAGS += -DSBE_ISR_TASKLET
-EXTRA_CFLAGS += -DSBE_INCLUDE_SYMBOLS
+ccflags-y := -DSBE_PMCC4_ENABLE
+ccflags-y := -DSBE_ISR_TASKLET
+ccflags-y := -DSBE_INCLUDE_SYMBOLS
 
 cxt1e1-objs += 	\
   ossiRelease.o 	\
-- 
1.7.3

