From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 24 Sep 2010 23:27:53 +0000
Subject: [PATCH v2 05/22] Staging: dream: qdsp5: Makefile: cleaned up makefile cflag lines
Message-Id: <1285370890-8984-5-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1285370890-8984-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed to use proper ccflags-y option
---
 drivers/staging/dream/qdsp5/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/dream/qdsp5/Makefile b/drivers/staging/dream/qdsp5/Makefile
index beedaaf..44ae6b4 100644
--- a/drivers/staging/dream/qdsp5/Makefile
+++ b/drivers/staging/dream/qdsp5/Makefile
@@ -1,4 +1,4 @@
-EXTRA_CFLAGS=-Idrivers/staging/dream/include
+ccflags-y:=-Idrivers/staging/dream/include
 obj-y += adsp.o
 ifeq ($(CONFIG_MSM_AMSS_VERSION_6350),y)
 obj-y += adsp_info.o
-- 
1.7.3

