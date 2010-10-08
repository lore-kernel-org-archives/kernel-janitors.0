From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:24 +0000
Subject: [PATCH 04/33] Staging: comedi: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-4-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/comedi/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/comedi/Makefile b/drivers/staging/comedi/Makefile
index 20afea3..8dbd306 100644
--- a/drivers/staging/comedi/Makefile
+++ b/drivers/staging/comedi/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_COMEDI) += comedi.o
 obj-$(CONFIG_COMEDI)	+= kcomedilib/
 obj-$(CONFIG_COMEDI)	+= drivers/
 
-comedi-objs :=		\
+comedi-y :=		\
 	comedi_fops.o	\
 	proc.o		\
 	range.o		\
-- 
1.7.3.1.50.g1e633

