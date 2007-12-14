From: Francisco Alecrim <francisco.alecrim@indt.org.br>
Date: Fri, 14 Dec 2007 18:56:47 +0000
Subject: [PATCH 3/6] drivers/char/keyboard.c: clean up remove duplicated headers
Message-Id: <1197658610-4558-4-git-send-email-francisco.alecrim@indt.org.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: "Francisco Alecrim <francisco.alecrim@indt.org.br>"
 <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, dmitry.torokhov@gmail.com, hcegtvedt@atmel.com, Francisco Alecrim <francisco.alecrim@indt.org.br>

Remove duplicated headers in drivers/char/keyboard.c:
drivers/char/keyboard.c: linux/consolemap.h is included more than once.

Signed-off-by: Francisco Alecrim <francisco.alecrim@indt.org.br>
---
 drivers/char/keyboard.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/char/keyboard.c b/drivers/char/keyboard.c
index fc54d23..2c21fb1 100644
--- a/drivers/char/keyboard.c
+++ b/drivers/char/keyboard.c
@@ -38,7 +38,6 @@
 #include <linux/kbd_kern.h>
 #include <linux/kbd_diacr.h>
 #include <linux/vt_kern.h>
-#include <linux/consolemap.h>
 #include <linux/sysrq.h>
 #include <linux/input.h>
 #include <linux/reboot.h>
-- 
1.5.3.7

