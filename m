From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:40 +0000
Subject: [PATCH 20/33] Staging: rtl8187se: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-20-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/rtl8187se/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rtl8187se/Makefile b/drivers/staging/rtl8187se/Makefile
index adc3849..11a9226 100644
--- a/drivers/staging/rtl8187se/Makefile
+++ b/drivers/staging/rtl8187se/Makefile
@@ -16,7 +16,7 @@ ccflags-y += -DENABLE_LPS
 
 #ccflags-y := -mhard-float -DCONFIG_FORCE_HARD_FLOAT=y
 
-r8187se-objs :=			\
+r8187se-y :=			\
 		r8180_core.o		\
 		r8180_wx.o		\
 		r8180_rtl8225z2.o	\
-- 
1.7.3.1.50.g1e633

