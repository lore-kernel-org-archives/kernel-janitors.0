From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:21 +0000
Subject: [PATCH 01/33] Staging: autofs: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed Makefile <module>-objs to <module>-y lines.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/autofs/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/autofs/Makefile b/drivers/staging/autofs/Makefile
index 453a60f..f48781c 100644
--- a/drivers/staging/autofs/Makefile
+++ b/drivers/staging/autofs/Makefile
@@ -4,4 +4,4 @@
 
 obj-$(CONFIG_AUTOFS_FS) += autofs.o
 
-autofs-objs := dirhash.o init.o inode.o root.o symlink.o waitq.o
+autofs-y := dirhash.o init.o inode.o root.o symlink.o waitq.o
-- 
1.7.3.1.50.g1e633

