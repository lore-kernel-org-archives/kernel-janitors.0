From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:27 +0000
Subject: [PATCH 07/33] Staging: cxt1e1: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-7-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/cxt1e1/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/cxt1e1/Makefile b/drivers/staging/cxt1e1/Makefile
index a524a62..e99b823 100644
--- a/drivers/staging/cxt1e1/Makefile
+++ b/drivers/staging/cxt1e1/Makefile
@@ -4,7 +4,7 @@ ccflags-y := -DSBE_PMCC4_ENABLE
 ccflags-y += -DSBE_ISR_TASKLET
 ccflags-y += -DSBE_INCLUDE_SYMBOLS
 
-cxt1e1-objs += 	\
+cxt1e1-y := 	\
   ossiRelease.o 	\
   musycc.o 		\
   pmcc4_drv.o 		\
-- 
1.7.3.1.50.g1e633

