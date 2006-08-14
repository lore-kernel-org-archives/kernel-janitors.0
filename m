From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 14 Aug 2006 05:28:24 +0000
Subject: Re: [KJ] [PATCH] Add poll_event* interfaces (was Re: [patch] fix
Message-Id: <20060814052824.GH4919@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060812062818.GD4919@us.ibm.com>
In-Reply-To: <20060812062818.GD4919@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 14.08.2006 [14:34:58 +1000], Darren Jenkins wrote:
> G'day,
> 
> On 8/14/06, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> >On 14.08.2006 [00:42:12 +0200], Pavel Machek wrote:
> >> Well, someone will want to do usleep here, right? poll_msec()?
> >
> >A good point... there is no usleep() that I can see, though. msleep()
> >uses schedule_timeout() which is at best jiffy-granularity, meaning
> >order of milliseconds for the foreseeable future. I was going to add a
> >units suffix to all the macros, but I decided to hold off still for two
> >reasons: 1) poll_event_interruptible_timeout() is already pretty long :)
> >and 2) the msecs suffix would only apply to interval parameter, not the
> >timeout one, which is an absolute time in jiffies. I suppose I could
> >rework the macros, since they would mostly be used in drivers, to pass
> >in a relative millisecond value as the timeout and covert it in the
> >macros to an absolute time in jiffies. Would that be preferred?
> 
> I think while you are hiding complexity in a macro, you should hide
> the absolute time to jiffies conversion complexity(although not that
> complex) too. It _is_ closely related to the interfaces you are
> writing and in a lot of cases will probably be the only place the
> conversion is used. So I say, bung it in there.

Ok, below is my attempt at incorporating this. Also fixed a typo in
poll_event_interruptible_timeout() and made a similar fix as 2) for
the interruptible variants, where the condition takes precendence over a
signal.

> >Updated patch, which is what you changed, Darren, with a small
> >difference (checking for !condition, rather than condition) is below.
> >
> >Thanks,
> >Nish
> 
> This patch looks much better. Can't see anything wrong with it.
> 
> Also after seeing the problems people have had with polling loops
> these macro's do seem like a good idea.

That was the thought many kernels ago, as well :)

Description: Add the poll_event(), poll_event_timeout(),
poll_event_interruptible() and poll_event_interruptible_timeout()
interfaces. These macros encapsulate typical sleeping code usage in a
sane way, accounting for a common bug which could indicate a timeout
when, in fact, the condition is true (and always takes precedent when
returning to the caller).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

diff -urpN 2.6.18-rc4/include/linux/delay.h 2.6.18-rc4-dev/include/linux/delay.h
--- 2.6.18-rc4/include/linux/delay.h	2006-08-11 22:40:57.000000000 -0700
+++ 2.6.18-rc4-dev/include/linux/delay.h	2006-08-13 22:26:14.000000000 -0700
@@ -44,4 +44,107 @@ static inline void ssleep(unsigned int s
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
+ * @timeout: Number of milliseconds from now to stop checking at
+ * returns: 0, if condition caused return
+ * 	    -ETIME, if timeout
+ */
+#define poll_event_timeout(condition, interval, timeout)		\
+({									\
+	int __ret = 0;							\
+ 	unsigned long __timeout = jiffies +				\
+ 					msecs_to_jiffies(timeout) + 1;	\
+ 									\
+	for (;;) {							\
+		if (condition)						\
+			break;						\
+ 		msleep(interval);					\
+		if (time_after(jiffies, __timeout)) {			\
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
+ 			if (!(condition))			\
+				__ret = -EINTR;			\
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
+ * @timeout: Number of milliseconds from now to stop checking at
+ * returns 0, if condition caused return
+ * 	   -EINTR, if a signal
+ * 	   -ETIME, if timeout
+ */
+#define poll_event_interruptible_timeout(condition, interval, timeout)	\
+({									\
+	int __ret = 0;							\
+ 	unsigned long __timeout = jiffies +				\
+ 					msecs_to_jiffies(timeout) + 1;	\
+									\
+	for (;;) {							\
+		if (condition)						\
+			break;						\
+ 		msleep_interruptible(interval);				\
+		if (signal_pending(current)) {				\
+ 			if (!(condition))				\
+				__ret = -EINTR;				\
+			break;						\
+		}							\
+		if (time_after(jiffies, __timeout)) {			\
+ 			if (!(condition))				\
+				__ret = -ETIME;				\
+			break;						\
+		}							\
+	}								\
+	__ret;								\
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
