From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:47 +0000
Subject: [PATCH 27/33] Staging: ti-st: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-27-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/ti-st/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/ti-st/Makefile b/drivers/staging/ti-st/Makefile
index 0167d1d..4b6ca18 100644
--- a/drivers/staging/ti-st/Makefile
+++ b/drivers/staging/ti-st/Makefile
@@ -3,5 +3,5 @@
 # and its protocol drivers (BT, FM, GPS)
 #
 obj-$(CONFIG_TI_ST) 		+= st_drv.o
-st_drv-objs			:= st_core.o st_kim.o st_ll.o
+st_drv-y			:= st_core.o st_kim.o st_ll.o
 obj-$(CONFIG_ST_BT) 		+= bt_drv.o
-- 
1.7.3.1.50.g1e633

