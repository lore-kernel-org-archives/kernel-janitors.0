From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:48:08 +0000
Subject: [PATCH 10/15] arch/mips: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021047480.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 arch/mips/nxp/pnx8550/common/time.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/nxp/pnx8550/common/time.c b/arch/mips/nxp/pnx8550/common/time.c
index 8df43e9..18b1927 100644
--- a/arch/mips/nxp/pnx8550/common/time.c
+++ b/arch/mips/nxp/pnx8550/common/time.c
@@ -138,7 +138,7 @@ __init void plat_time_init(void)
 	 * HZ timer interrupts per second.
 	 */
 	mips_hpt_frequency = 27UL * ((1000000UL * n)/(m * pow2p));
-	cpj = (mips_hpt_frequency + HZ / 2) / HZ;
+	cpj = DIV_ROUND_CLOSEST(mips_hpt_frequency, HZ);
 	write_c0_count(0);
 	timer_ack();
 
