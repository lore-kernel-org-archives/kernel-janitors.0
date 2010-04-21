From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Wed, 21 Apr 2010 21:18:23 +0000
Subject: [PATCH 1/2] arch/avr32: Fix build failure caused by typo
Message-Id: <201004212318.23909.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, John Stultz <johnstul@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

This little patch fixes a build failure[1] caused by a typo.

Patch against linux-next20100421

References:
[1]http://kisskb.ellerman.id.au/kisskb/buildresult/2448162/

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 arch/avr32/kernel/time.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/avr32/kernel/time.c b/arch/avr32/kernel/time.c
index a047d69..668ed28 100644
--- a/arch/avr32/kernel/time.c
+++ b/arch/avr32/kernel/time.c
@@ -112,7 +112,7 @@ static struct clock_event_device comparator = {
 
 void read_persistent_clock(struct timespec *ts)
 {
-	ts->tv.sec = mktime(2007, 1, 1, 0, 0, 0);
+	ts->tv_sec = mktime(2007, 1, 1, 0, 0, 0);
 	ts->tv_nsec = 0;
 }
 
-- 
1.6.4.4

