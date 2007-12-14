From: Francisco Alecrim <francisco.alecrim@indt.org.br>
Date: Fri, 14 Dec 2007 18:56:50 +0000
Subject: [PATCH 6/6] drivers/misc/atmel-ssc.c: clean up remove duplicated headers
Message-Id: <1197658610-4558-7-git-send-email-francisco.alecrim@indt.org.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: "Francisco Alecrim <francisco.alecrim@indt.org.br>"
 <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-4-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-5-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-6-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-6-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, dmitry.torokhov@gmail.com, hcegtvedt@atmel.com, Francisco Alecrim <francisco.alecrim@indt.org.br>

Remove duplicated headers in drivers/misc/atmel-ssc.c:
drivers/misc/atmel-ssc.c: linux/list.h is included more than once.

Signed-off-by: Francisco Alecrim <francisco.alecrim@indt.org.br>
---
 drivers/misc/atmel-ssc.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index 058ccac..992d371 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -13,7 +13,6 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/atmel-ssc.h>
 
-- 
1.5.3.7

