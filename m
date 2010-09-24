From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 18:18:32 +0000
Subject: [PATCH 19/21] Staging: vt6656: Makefile: cleaned up makefile cflag lines
Message-Id: <1285352314-5939-19-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285352314-5939-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use the proper ccflags-y option

Signed-off-by: Tracey Dent <tdent48227@gmail>
---
 drivers/staging/vt6656/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6656/Makefile b/drivers/staging/vt6656/Makefile
index 582a35197..46c5d96 100644
--- a/drivers/staging/vt6656/Makefile
+++ b/drivers/staging/vt6656/Makefile
@@ -1,6 +1,6 @@
 # TODO: all of these should be removed
-EXTRA_CFLAGS += -DLINUX -D__KERNEL__ -DEXPORT_SYMTAB -D__NO_VERSION__
-EXTRA_CFLAGS += -DHOSTAP
+ccflags-y += -DLINUX -D__KERNEL__ -DEXPORT_SYMTAB -D__NO_VERSION__
+ccflags-y += -DHOSTAP
 
 vt6656_stage-y +=	main_usb.o \
 			card.o  \
-- 
1.7.3

