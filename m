From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 04 Mar 2005 18:53:31 +0000
Subject: [KJ] [RFC][UPDATE PATCH 1/5] add poll_event*()
Message-Id: <20050304185331.GF2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50043777185674809=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50043777185674809==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 05:05:47PM -0800, Nishanth Aravamudan wrote:
> On Thu, Mar 03, 2005 at 10:22:38AM -0800, Nishanth Aravamudan wrote:
> > Hi,
> > 
> > Description: Add the poll_event(), poll_event_timeout(),
> > poll_event_interruptible() and poll_event_interruptible_timeout()
> > interfaces. These macros encapsulate typical sleeping code usage in a
> > sane way.
> 
> Macros broken in some subtle & not-so-subtle ways. I will try and get a
> cleaned-up new version for everyone to examine by tomorrow.

Hopefully this patch fixes some of the issues and makes the interfaces a
little better, as recommended by Walter Harms and Alexey Dobriyan. I will
update the examples I've given patches 2-5, as appropriate.

A further question, though, should I make the interfaces more similar in
code to wait_event*() and have a called version and then that version
call and __ version?

Thanks,
Nish

Description: Add the poll_event(), poll_event_timeout(),
poll_event_interruptible() and poll_event_interruptible_timeout()
interfaces. These macros encapsulate typical sleeping code usage in
a sane way.


Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/include/linux/delay.h	2005-03-01 23:37:51.000000000 -0800
+++ 2.6.11-kj/include/linux/delay.h	2005-03-04 10:49:55.000000000 -0800
@@ -47,4 +47,81 @@ static inline void ssleep(unsigned int s
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
+/* no return value */
+#define poll_event(condition, interval)				\
+do {								\
+	while (!(condition))					\
+		msleep(interval);				\
+} while(0)
+
+/* return 0 if condition caused return, -ETIME if timeout */
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
+/* return 0 if condition caused return, -EINTR if signal */
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
+/* return 0 if condition caused return, -EINTR if signal, -ETIME if
+ * timeout */
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
+})
+
 #endif /* defined(_LINUX_DELAY_H) */

--===============50043777185674809==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50043777185674809==--
