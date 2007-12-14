From: Francisco Alecrim <francisco.alecrim@indt.org.br>
Date: Fri, 14 Dec 2007 18:56:48 +0000
Subject: [PATCH 4/6] drivers/input: clean up remove duplicated headers
Message-Id: <1197658610-4558-5-git-send-email-francisco.alecrim@indt.org.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: "Francisco Alecrim <francisco.alecrim@indt.org.br>"
 <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
 <1197658610-4558-4-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-4-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, dmitry.torokhov@gmail.com, hcegtvedt@atmel.com, Francisco Alecrim <francisco.alecrim@indt.org.br>

Remove duplicated headers in drivers/input:
drivers/input/keyboard/bf54x-keys.c: linux/irq.h is included more than once.
drivers/input/keyboard/jornada720_kbd.c: linux/init.h is included more than once.
drivers/input/gameport/gameport.c: linux/sched.h is included more than once.

Signed-off-by: Francisco Alecrim <francisco.alecrim@indt.org.br>
---
 drivers/input/gameport/gameport.c       |    1 -
 drivers/input/keyboard/bf54x-keys.c     |    1 -
 drivers/input/keyboard/jornada720_kbd.c |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/input/gameport/gameport.c b/drivers/input/gameport/gameport.c
index bfc6061..682a70e 100644
--- a/drivers/input/gameport/gameport.c
+++ b/drivers/input/gameport/gameport.c
@@ -17,7 +17,6 @@
 #include <linux/init.h>
 #include <linux/gameport.h>
 #include <linux/wait.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
diff --git a/drivers/input/keyboard/bf54x-keys.c b/drivers/input/keyboard/bf54x-keys.c
index e5f4da9..05e3494 100644
--- a/drivers/input/keyboard/bf54x-keys.c
+++ b/drivers/input/keyboard/bf54x-keys.c
@@ -42,7 +42,6 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/input.h>
-#include <linux/irq.h>
 
 #include <asm/portmux.h>
 #include <asm/mach/bf54x_keys.h>
diff --git a/drivers/input/keyboard/jornada720_kbd.c b/drivers/input/keyboard/jornada720_kbd.c
index e6696b3..4dfdfef 100644
--- a/drivers/input/keyboard/jornada720_kbd.c
+++ b/drivers/input/keyboard/jornada720_kbd.c
@@ -19,7 +19,6 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/init.h>
 #include <linux/input.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
1.5.3.7

