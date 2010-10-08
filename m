From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:36 +0000
Subject: [PATCH 16/33] Staging: line6: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-16-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/line6/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/line6/Makefile b/drivers/staging/line6/Makefile
index a1c93ed..de6bd12 100644
--- a/drivers/staging/line6/Makefile
+++ b/drivers/staging/line6/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_LINE6_USB)		+= line6usb.o
 
-line6usb-objs := 		\
+line6usb-y := 		\
 		audio.o		\
 		capture.o	\
 		control.o	\
-- 
1.7.3.1.50.g1e633

