From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 05 Mar 2005 00:05:25 +0000
Subject: [KJ] [RFC][UPDATE PATCH 1/5] add poll_event*()
Message-Id: <20050305000525.GA4552@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96500275886392339=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050304185331.GF2689@us.ibm.com>
In-Reply-To: <20050304185331.GF2689@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============96500275886392339==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2005 at 10:37:40PM +0200, Alexey Dobriyan wrote:
> On Friday 04 March 2005 20:53, Nishanth Aravamudan wrote:
> 
> > Add the poll_event(), poll_event_timeout(), poll_event_interruptible() and
> > poll_event_interruptible_timeout() interfaces. These macros encapsulate
> > typical sleeping code usage in a sane way.
> 
> > --- 2.6.11-kj-v/include/linux/delay.h
> > +++ 2.6.11-kj/include/linux/delay.h
> 
> > +#define poll_event_interruptible_timeout(conditition, interval, timeout)	\
> > +({										\
> > +	int __ret = 0;								\
> > +	unsigned long stop = jiffies + msecs_to_jiffies(timeout);		\
> > +										\
> > +	for (;;) {								\
> > +		if (condition)							\
> > +			break;							\
> > +		msleep_interruptible(interval);					\
> > +		if (signal_pending(current)) {					\
> > +			__ret = -EINTR;						\
> > +			break;							\
> > +		}								\
> > +		if (time_after(jiffies, stop)) {				\
> > +			__ret = -ETIME;						\
> > +			break;							\
> > +		}								\
> > +	}									\
> 
> 	__ret;
> 
> > +})
> 
> Also, can you add kernel-doc comments? Rules are the same as for functions.

Code error fixed below.
This is my first try at kernel-doc style comments. Please indicate any
problems.

Thanks,
Nish

Description: Add the poll_event(), poll_event_timeout(),
poll_event_interruptible() and poll_event_interruptible_timeout()
interfaces. These macros encapsulate typical sleeping code usage in
a sane way.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/include/linux/delay.h	2005-03-01 23:37:51.000000000 -0800
+++ 2.6.11-kj/include/linux/delay.h	2005-03-04 16:03:24.000000000 -0800
@@ -47,4 +47,106 @@ static inline void ssleep(unsigned int s
 	msleep(seconds * 1000);
 }
 
+/*
+ * poll_event* check if an @condition is true every @interval milliseconds,
+ * up to a @timeout maximum, if specified, else forever.
+ * The *_interruptible versions will sleep in TASK_INTERRUPTIBLE
+ * (instead of TASK_UNINTERRUPTIBLE) and will return early on signals
+ * Note that these interfaces are distinctly different than
+ * wait_event*() in two ways:
+ * 	1) No wait-queues
+ * 	2) Specify the time you want to sleep, not when you want to
+ * 	wake-up. Thus, callers should not add the current time to
+ * 	@timeout before calling, as it will be done by the macro.
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
+ * @timeout: Maximum total number of milliseconds to take
+ * returns: 0, if condition caused return
+ * 	    -ETIME, if timeout
+ */
+#define poll_event_timeout(condition, interval, timeout)		\
+({									\
+	int __ret = 0;							\
+	unsigned long stop = jiffies + msecs_to_jiffies(timeout);	\
+ 									\
+	for (;;) {							\
+		if (condition)						\
+			break;						\
+		msleep(interval);					\
+		if (time_after(jiffies, stop)) {			\
+			__ret = -ETIME;					\
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
+#define poll_event_interruptible(condition, interval)	\
+({							\
+	int __ret = 0;					\
+							\
+	for (;;) {					\
+		if (condition)				\
+			break;				\
+		msleep_interruptible(interval);		\
+		if (signal_pending(current)) {		\
+			__ret = -EINTR;			\
+ 			break;				\
+		}					\
+	}						\
+	__ret;
+})
+
+/**
+ * poll_event_interruptible_timeout - check a condition at regular intervals with a timeout, returning early on signals
+ * @condition: Condition to check
+ * @interval: Number of milliseconds between checks
+ * @timeout: Maximum total number of milliseconds to take
+ * returns 0, if condition caused return
+ * 	   -EINTR, if a signal
+ * 	   -ETIME, if timeout
+ */
+#define poll_event_interruptible_timeout(conditition, interval, timeout)	\
+({										\
+	int __ret = 0;								\
+	unsigned long stop = jiffies + msecs_to_jiffies(timeout);		\
+										\
+	for (;;) {								\
+		if (condition)							\
+			break;							\
+		msleep_interruptible(interval);					\
+		if (signal_pending(current)) {					\
+			__ret = -EINTR;						\
+			break;							\
+		}								\
+		if (time_after(jiffies, stop)) {				\
+			__ret = -ETIME;						\
+			break;							\
+		}								\
+	}									\
+	__ret;									\
+})
+
 #endif /* defined(_LINUX_DELAY_H) */

--===============96500275886392339==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96500275886392339==--
