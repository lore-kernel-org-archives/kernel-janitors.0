From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:25 +0000
Subject: [PATCH 05/33] Staging: crystalhd: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-5-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/crystalhd/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/crystalhd/Makefile b/drivers/staging/crystalhd/Makefile
index e2af0ce..c31657a 100644
--- a/drivers/staging/crystalhd/Makefile
+++ b/drivers/staging/crystalhd/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_CRYSTALHD)	+= crystalhd.o
 
-crystalhd-objs		:= crystalhd_cmds.o	\
+crystalhd-y		:= crystalhd_cmds.o	\
 			   crystalhd_hw.o	\
 			   crystalhd_lnx.o	\
 			   crystalhd_misc.o
-- 
1.7.3.1.50.g1e633

