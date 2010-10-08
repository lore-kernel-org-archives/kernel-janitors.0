From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:26 +0000
Subject: [PATCH 06/33] Staging: cx25821: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-6-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/cx25821/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/cx25821/Makefile b/drivers/staging/cx25821/Makefile
index 6448364..aedde18 100644
--- a/drivers/staging/cx25821/Makefile
+++ b/drivers/staging/cx25821/Makefile
@@ -1,4 +1,4 @@
-cx25821-objs   := cx25821-core.o cx25821-cards.o cx25821-i2c.o \
+cx25821-y   := cx25821-core.o cx25821-cards.o cx25821-i2c.o \
 		       cx25821-gpio.o cx25821-medusa-video.o \
 		       cx25821-video.o cx25821-video-upstream.o \
 		       cx25821-video-upstream-ch2.o \
-- 
1.7.3.1.50.g1e633

