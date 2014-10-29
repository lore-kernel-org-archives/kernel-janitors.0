From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 08:42:50 +0000
Subject: [patch] hangcheck-timer: cleanup casting in hangcheck_init()
Message-Id: <20141029084250.GA8939@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The 32 bit addition "(hangcheck_margin + hangcheck_tick)" could
potentially overflow.  It triggers a static checker warning to have an
overflowed addition followed by a no-op cast.  I have moved the cast so
that the addition can't overflow.

Also I removed the unneeded cast on the following line since both
"hangcheck_tsc_margin" and "TIMER_FREQ" are already 64 bit types.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/hangcheck-timer.c b/drivers/char/hangcheck-timer.c
index ebc4c73..a7c5c59 100644
--- a/drivers/char/hangcheck-timer.c
+++ b/drivers/char/hangcheck-timer.c
@@ -168,8 +168,8 @@ static int __init hangcheck_init(void)
 	printk("Hangcheck: starting hangcheck timer %s (tick is %d seconds, margin is %d seconds).\n",
 	       VERSION_STR, hangcheck_tick, hangcheck_margin);
 	hangcheck_tsc_margin -		(unsigned long long)(hangcheck_margin + hangcheck_tick);
-	hangcheck_tsc_margin *= (unsigned long long)TIMER_FREQ;
+		(unsigned long long)hangcheck_margin + hangcheck_tick;
+	hangcheck_tsc_margin *= TIMER_FREQ;
 
 	hangcheck_tsc = ktime_get_ns();
 	mod_timer(&hangcheck_ticktock, jiffies + (hangcheck_tick*HZ));
