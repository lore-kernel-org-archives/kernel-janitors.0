From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:46:25 +0000
Subject: [PATCH 6/15] arch/arm/mach-shark: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021046060.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alex@shark-linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
but is perhaps more readable.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression x,__divisor;
@@

- (((x) + ((__divisor) / 2)) / (__divisor))
+ DIV_ROUND_CLOSEST(x,__divisor)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/arm/mach-shark/core.c          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-shark/core.c b/arch/arm/mach-shark/core.c
index 358d875..a4eae65 100644
--- a/arch/arm/mach-shark/core.c
+++ b/arch/arm/mach-shark/core.c
@@ -119,7 +119,7 @@ static void __init shark_map_io(void)
 }
 
 #define IRQ_TIMER 0
-#define HZ_TIME ((1193180 + HZ/2) / HZ)
+#define HZ_TIME DIV_ROUND_CLOSEST(1193180, HZ)
 
 static irqreturn_t
 shark_timer_interrupt(int irq, void *dev_id)
