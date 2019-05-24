From: Mathieu Malaterre <malat@debian.org>
Date: Fri, 24 May 2019 10:33:39 +0000
Subject: [PATCH] clocksource: Move inline keyword to the beginning of function declarations
Message-Id: <20190524103339.28787-1-malat@debian.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org

The inline keyword was not at the beginning of the function declarations.
Fix the following warnings triggered when using W=1:

  kernel/time/clocksource.c:108:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
  kernel/time/clocksource.c:113:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 kernel/time/clocksource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 3bcc19ceb073..fff5f64981c6 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -105,12 +105,12 @@ static DEFINE_SPINLOCK(watchdog_lock);
 static int watchdog_running;
 static atomic_t watchdog_reset_pending;
 
-static void inline clocksource_watchdog_lock(unsigned long *flags)
+static inline void clocksource_watchdog_lock(unsigned long *flags)
 {
 	spin_lock_irqsave(&watchdog_lock, *flags);
 }
 
-static void inline clocksource_watchdog_unlock(unsigned long *flags)
+static inline void clocksource_watchdog_unlock(unsigned long *flags)
 {
 	spin_unlock_irqrestore(&watchdog_lock, *flags);
 }
-- 
2.20.1
