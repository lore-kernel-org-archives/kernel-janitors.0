From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:48:27 +0000
Subject: [PATCH 11/15] arch/powerpc: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021048090.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 arch/powerpc/kernel/time.c          |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index eae4511..edb1edb 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -479,7 +479,8 @@ static int __init iSeries_tb_recal(void)
 		unsigned long tb_ticks = tb - iSeries_recal_tb;
 		unsigned long titan_usec = (titan - iSeries_recal_titan) >> 12;
 		unsigned long new_tb_ticks_per_sec   = (tb_ticks * USEC_PER_SEC)/titan_usec;
-		unsigned long new_tb_ticks_per_jiffy = (new_tb_ticks_per_sec+(HZ/2))/HZ;
+		unsigned long new_tb_ticks_per_jiffy +			DIV_ROUND_CLOSEST(new_tb_ticks_per_sec, HZ);
 		long tick_diff = new_tb_ticks_per_jiffy - tb_ticks_per_jiffy;
 		char sign = '+';		
 		/* make sure tb_ticks_per_sec and tb_ticks_per_jiffy are consistent */
