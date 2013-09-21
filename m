From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 21 Sep 2013 22:27:33 +0000
Subject: [PATCH 01/19] arm: Change variable type to bool
Message-Id: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The variable pll_overclock is only assigned the values true and false.
Change its type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 arch/arm/mach-at91/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/clock.c b/arch/arm/mach-at91/clock.c
index 6b2630a..936480d 100644
--- a/arch/arm/mach-at91/clock.c
+++ b/arch/arm/mach-at91/clock.c
@@ -749,7 +749,7 @@ static int __init at91_pmc_init(unsigned long main_clock)
 {
 	unsigned tmp, freq, mckr;
 	int i;
-	int pll_overclock = false;
+	bool pll_overclock = false;
 
 	/*
 	 * When the bootloader initialized the main oscillator correctly,
-- 
1.8.3.1

