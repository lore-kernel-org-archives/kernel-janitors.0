From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:28:07 +0000
Subject: [PATCH v2 19/22] Staging:  vt6655: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-19-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/vt6655/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/Makefile b/drivers/staging/vt6655/Makefile
index 824c971..b7cb1d5 100644
--- a/drivers/staging/vt6655/Makefile
+++ b/drivers/staging/vt6655/Makefile
@@ -1,6 +1,6 @@
 # TODO: all of these should be removed
-EXTRA_CFLAGS += -DLINUX -D__KERNEL__ -D__NO_VERSION__
-EXTRA_CFLAGS += -DHOSTAP
+ccflags-y := -DLINUX -D__KERNEL__ -D__NO_VERSION__
+ccflags-y := -DHOSTAP
 
 vt6655_stage-y +=	device_main.o \
 	card.o \
-- 
1.7.3

