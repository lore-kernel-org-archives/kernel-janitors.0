From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:46:45 +0000
Subject: [PATCH 7/15] arch/arm/plat-iop: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021046260.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel@wantstofly.org, dan.j.williams@intel.com, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 arch/arm/plat-iop/time.c            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-iop/time.c b/arch/arm/plat-iop/time.c
index 3695bbe..8da95d5 100644
--- a/arch/arm/plat-iop/time.c
+++ b/arch/arm/plat-iop/time.c
@@ -85,7 +85,7 @@ void __init iop_init_time(unsigned long tick_rate)
 {
 	u32 timer_ctl;
 
-	ticks_per_jiffy = (tick_rate + HZ/2) / HZ;
+	ticks_per_jiffy = DIV_ROUND_CLOSEST(tick_rate, HZ);
 	ticks_per_usec = tick_rate / 1000000;
 	next_jiffy_time = 0xffffffff;
 	iop_tick_rate = tick_rate;
