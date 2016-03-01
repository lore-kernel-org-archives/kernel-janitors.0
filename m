From: Pratyush Patel <pratyushpatel.1995@gmail.com>
Date: Tue, 01 Mar 2016 17:40:49 +0000
Subject: [PATCH] hrtimer: redundant #ifdef block
Message-Id: <20160301172849.GA18152@cyborg>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Only need CONFIG_NO_HZ_COMMON as this block is already in a
CONFIG_SMP block.

Signed-off-by: Pratyush Patel <pratyushpatel.1995@gmail.com>

diff -urpN a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
--- a/kernel/time/hrtimer.c	2016-02-28 22:11:20.000000000 +0530
+++ b/kernel/time/hrtimer.c	2016-03-01 22:01:29.538877512 +0530
@@ -177,7 +177,7 @@ hrtimer_check_target(struct hrtimer *tim
 #endif
 }
 
-#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
+#ifdef CONFIG_NO_HZ_COMMON
 static inline
 struct hrtimer_cpu_base *get_target_base(struct hrtimer_cpu_base *base,
 					 int pinned)
