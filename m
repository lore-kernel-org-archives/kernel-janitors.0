From: Tracey Dent <tdent48227@gmail.com>
Date: Sat, 02 Oct 2010 16:38:06 +0000
Subject: [PATCH v3 17/20] Staging: vt6655: Makefile: cleaned up Makefile cflag lines
Message-Id: <1286037489-28439-17-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/vt6655/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/Makefile b/drivers/staging/vt6655/Makefile
index 824c971..f7544a6 100644
--- a/drivers/staging/vt6655/Makefile
+++ b/drivers/staging/vt6655/Makefile
@@ -1,6 +1,6 @@
 # TODO: all of these should be removed
-EXTRA_CFLAGS += -DLINUX -D__KERNEL__ -D__NO_VERSION__
-EXTRA_CFLAGS += -DHOSTAP
+ccflags-y := -DLINUX -D__KERNEL__ -D__NO_VERSION__
+ccflags-y += -DHOSTAP
 
 vt6655_stage-y +=	device_main.o \
 	card.o \
-- 
1.7.3.1.50.g1e633

