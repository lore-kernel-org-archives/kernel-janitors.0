From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:44:32 +0000
Subject: [PATCH 1/15] arch/alpha: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021044000.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 arch/alpha/kernel/sys_ruffian.c     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/sys_ruffian.c b/arch/alpha/kernel/sys_ruffian.c
index d9f9cfe..8de1046 100644
--- a/arch/alpha/kernel/sys_ruffian.c
+++ b/arch/alpha/kernel/sys_ruffian.c
@@ -66,7 +66,7 @@ ruffian_init_irq(void)
 	common_init_isa_dma();
 }
 
-#define RUFFIAN_LATCH	((PIT_TICK_RATE + HZ / 2) / HZ)
+#define RUFFIAN_LATCH	DIV_ROUND_CLOSEST(PIT_TICK_RATE, HZ)
 
 static void __init
 ruffian_init_rtc(void)
