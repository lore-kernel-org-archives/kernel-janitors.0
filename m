From: Tracey Dent <tdent48227@gmail.com>
Date: Fri, 08 Oct 2010 00:01:50 +0000
Subject: [PATCH 30/33] Staging: winbond: Makefile: replace the use of <module>-objs with <module>-y
Message-Id: <1286496113-11897-30-git-send-email-tdent48227@gmail.com>
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
 drivers/staging/winbond/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/winbond/Makefile b/drivers/staging/winbond/Makefile
index fb2b7d4..79fa227 100644
--- a/drivers/staging/winbond/Makefile
+++ b/drivers/staging/winbond/Makefile
@@ -1,4 +1,4 @@
-w35und-objs :=			\
+w35und-y :=			\
 	mds.o			\
 	mlmetxrx.o		\
 	mto.o			\
-- 
1.7.3.1.50.g1e633

