From: Francisco Alecrim <francisco.alecrim@indt.org.br>
Date: Fri, 14 Dec 2007 18:56:46 +0000
Subject: [PATCH 2/6] drivers/parisc/ccio-dma.c: clean up remove duplicated headers
Message-Id: <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: "Francisco Alecrim <francisco.alecrim@indt.org.br>"
 <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, dmitry.torokhov@gmail.com, hcegtvedt@atmel.com, Francisco Alecrim <francisco.alecrim@indt.org.br>

Remove duplicated headers in drivers/parisc/ccio-dma.c:
drivers/parisc/ccio-dma.c: linux/proc_fs.h is included more than once.

Signed-off-by: Francisco Alecrim <francisco.alecrim@indt.org.br>
---
 drivers/parisc/ccio-dma.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 7c60cbd..b67b056 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -76,7 +76,6 @@
 #undef CCIO_MAP_STATS
 #endif
 
-#include <linux/proc_fs.h>
 #include <asm/runway.h>		/* for proc_runway_root */
 
 #ifdef DEBUG_CCIO_INIT
-- 
1.5.3.7

