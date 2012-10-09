From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Oct 2012 07:18:23 +0000
Subject: [patch] time: cast ->raw_interval to u64 to avoid shift overflow
Message-Id: <20121009071823.GA19159@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <johnstul@us.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We fixed a bunch of integer overflows in timekeeping code during the 3.6
cycle.  I did an audit based on that and found this potential overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not super familiar with this code so please review my work
carefully.

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 5ce06a3..1d1ee67 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1113,7 +1113,7 @@ static cycle_t logarithmic_accumulation(struct timekeeper *tk, cycle_t offset,
 	accumulate_nsecs_to_secs(tk);
 
 	/* Accumulate raw time */
-	raw_nsecs = tk->raw_interval << shift;
+	raw_nsecs = (u64)tk->raw_interval << shift;
 	raw_nsecs += tk->raw_time.tv_nsec;
 	if (raw_nsecs >= NSEC_PER_SEC) {
 		u64 raw_secs = raw_nsecs;
