From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:46:05 +0000
Subject: [PATCH 5/15] arch/arm/mach-ixp2000: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021045400.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel@wantstofly.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 arch/arm/mach-ixp2000/core.c        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-ixp2000/core.c b/arch/arm/mach-ixp2000/core.c
index babb225..037342b 100644
--- a/arch/arm/mach-ixp2000/core.c
+++ b/arch/arm/mach-ixp2000/core.c
@@ -219,7 +219,7 @@ static struct irqaction ixp2000_timer_irq = {
 
 void __init ixp2000_init_time(unsigned long tick_rate)
 {
-	ticks_per_jiffy = (tick_rate + HZ/2) / HZ;
+	ticks_per_jiffy = DIV_ROUND_CLOSEST(tick_rate, HZ);
 	ticks_per_usec = tick_rate / 1000000;
 
 	/*
