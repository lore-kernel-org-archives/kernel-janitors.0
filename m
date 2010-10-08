From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:53 +0000
Subject: [PATCH 33/33] Staging: zram: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-33-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/zram/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/zram/Makefile b/drivers/staging/zram/Makefile
index c01160a..b1709c5 100644
--- a/drivers/staging/zram/Makefile
+++ b/drivers/staging/zram/Makefile
@@ -1,3 +1,3 @@
-zram-objs	:=	zram_drv.o zram_sysfs.o xvmalloc.o
+zram-y	:=	zram_drv.o zram_sysfs.o xvmalloc.o
 
 obj-$(CONFIG_ZRAM)	+=	zram.o
-- 
1.7.3.1.50.g1e633

