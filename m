From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:45 +0000
Subject: [PATCH 25/33] Staging: solo6x10: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-25-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/solo6x10/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/solo6x10/Makefile b/drivers/staging/solo6x10/Makefile
index 7e70044..1616b55 100644
--- a/drivers/staging/solo6x10/Makefile
+++ b/drivers/staging/solo6x10/Makefile
@@ -1,4 +1,4 @@
-solo6x10-objs	:= solo6010-core.o solo6010-i2c.o solo6010-p2m.o \
+solo6x10-y	:= solo6010-core.o solo6010-i2c.o solo6010-p2m.o \
 		   solo6010-v4l2.o solo6010-tw28.o solo6010-gpio.o \
 		   solo6010-disp.o solo6010-enc.o solo6010-v4l2-enc.o \
 		   solo6010-g723.o
-- 
1.7.3.1.50.g1e633

