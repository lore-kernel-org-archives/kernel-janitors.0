From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 14 Aug 2006 04:12:40 +0000
Subject: Re: [KJ] [PATCH] Add poll_event* interfaces (was Re: [patch] fix
Message-Id: <20060814041240.GG4919@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060812062818.GD4919@us.ibm.com>
In-Reply-To: <20060812062818.GD4919@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 14.08.2006 [00:42:12 +0200], Pavel Machek wrote:
> Well, someone will want to do usleep here, right? poll_msec()?

A good point... there is no usleep() that I can see, though. msleep()
uses schedule_timeout() which is at best jiffy-granularity, meaning
order of milliseconds for the foreseeable future. I was going to add a
units suffix to all the macros, but I decided to hold off still for two
reasons: 1) poll_event_interruptible_timeout() is already pretty long :)
and 2) the msecs suffix would only apply to interval parameter, not the
timeout one, which is an absolute time in jiffies. I suppose I could
rework the macros, since they would mostly be used in drivers, to pass
in a relative millisecond value as the timeout and covert it in the
macros to an absolute time in jiffies. Would that be preferred?


On 14.08.2006 [09:41:41 +1000], Darren Jenkins wrote:
> Sorry I missed Nishanth Aravamudan's mail
> 
> On 8/14/06, Pavel Machek <pavel@suse.cz> wrote:
> 
> >> FWIW, here is my poll_event() patch from some time ago updated to
> >> 2.6.18-rc4. I think it's closest in spirit to 3). Comments, thoughts?
> 
> Was that the right patch ? because it doesn't seem to implement the fix in 
> 3).
> I think the easiest fix for this patch would be using number 2)

Yes, that was my fault, I sent the wrong patch. That's what I get for
sending a patch on a Friday night :)

Updated patch, which is what you changed, Darren, with a small
difference (checking for !condition, rather than condition) is below.

Thanks,
Nish

Description: Add the poll_event(), poll_event_timeout(),
poll_event_interruptible() and poll_event_interruptible_timeout()
interfaces. These macros encapsulate typical sleeping code usage in a
sane way, accounting for a common bug which could indicate a timeout
when, in fact, the condition is true (and takes precedent).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

diff -urpN 2.6.18-rc4/include/linux/delay.h 2.6.18-rc4-dev/include/linux/delay.h
--- 2.6.18-rc4/include/linux/delay.h	2006-08-11 22:40:57.000000000 -0700
+++ 2.6.18-rc4-dev/include/linux/delay.h	2006-08-13 21:06:28.000000000 -0700
@@ -44,4 +44,101 @@ static inline void ssleep(unsigned int s
 	msleep(seconds * 1000);
 }
 
+/*
+ * poll_event* check if a @condition is true every @interval milliseconds,
+ * up to a @timeout maximum, if specified, else forever.
+ * The *_interruptible versions will sleep in TASK_INTERRUPTIBLE
+ * (instead of TASK_UNINTERRUPTIBLE) and will return early on signals
+ * These interfaces are intentionally very similar to wait_event*
+ */
+
+/**
+ * poll_event - check a condition at regular intervals
+ * @condition: Condition to check
+ * @interval: Number of milliseconds between checks
+ */
+#define poll_event(condition, interval)				\
+do {								\
+	while (!(condition))					\
+		msleep(interval);				\
+} while(0)
+
+/**
+ * poll_event_timeout - check a condition at regular intervals with a timeout
+ * @condition: Condition to check
+ * @interval: Number of milliseconds between checks
+ * @timeout: Time in jiffies to stop checking at
+ * returns: 0, if condition caused return
+ * 	    -ETIME, if timeout
+ */
+#define poll_event_timeout(condition, interval, timeout)		\
+({									\
+	int __ret = 0;							\
+ 									\
+	for (;;) {							\
+		if (condition)						\
+			break;						\
+ 		msleep(interval);					\
+		if (time_after(jiffies, timeout)) {			\
+ 			if (!(condition))				\
+				__ret = -ETIME;				\
+ 			break;						\
+		}							\
+	}								\
+	__ret;								\
+})
+
+/**
+ * poll_event_interruptible - check a condition at regular intervals, returning early on signals
+ * @condition: Condition to check
+ * @interval: Number of milliseconds between checks
+ * returns: 0, if condition caused return
+ * 	    -EINTR, if a signal
+ */
+#define poll_event_interruptible(condition, interval)		\
+({								\
+	int __ret = 0;						\
+								\
+	for (;;) {						\
+		if (condition)					\
+			break;					\
+ 		msleep_interruptible(interval);			\
+		if (signal_pending(current)) {			\
+			__ret = -EINTR;				\
+ 			break;					\
+		}						\
+	}							\
+	__ret;
+})
+
+/**
+ * poll_event_interruptible_timeout - check a condition at regular intervals with a timeout, returning early on signals
+ * @condition: Condition to check
+ * @interval: Number of milliseconds between checks
+ * @timeout: Time in jiffies to stop checking at
+ * returns 0, if condition caused return
+ * 	   -EINTR, if a signal
+ * 	   -ETIME, if timeout
+ */
+#define poll_event_interruptible_timeout(conditition, interval, timeout)	\
+({										\
+	int __ret = 0;								\
+										\
+	for (;;) {								\
+		if (condition)							\
+			break;							\
+ 		msleep_interruptible(interval);					\
+		if (signal_pending(current)) {					\
+			__ret = -EINTR;						\
+			break;							\
+		}								\
+		if (time_after(jiffies, timeout)) {				\
+ 			if (!(condition))					\
+				__ret = -ETIME;					\
+			break;							\
+		}								\
+	}									\
+	__ret;									\
+})
+
 #endif /* defined(_LINUX_DELAY_H) */

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
