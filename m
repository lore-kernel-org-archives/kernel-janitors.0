From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:22:38 +0000
Subject: [KJ] [RFC][PATCH 1/5] add poll_event*()
Message-Id: <20050303182238.GD11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61179029901525328=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61179029901525328==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: Add the poll_event(), poll_event_timeout(),
poll_event_interruptible() and poll_event_interruptible_timeout()
interfaces. These macros encapsulate typical sleeping code usage in a
sane way.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/include/linux/delay.h	2005-03-01 23:37:51.000000000 -0800
+++ 2.6.11-kj/include/linux/delay.h	2005-03-02 17:28:06.000000000 -0800
@@ -47,4 +47,43 @@ static inline void ssleep(unsigned int s
 	msleep(seconds * 1000);
 }
 
+/*
+ * poll_event* check if an @cond is true every interval milliseconds, up
+ * to a @timeout maximum, if specified.
+ * The *_interruptible versions will sleep in TASK_INTERRUPTIBLE
+ * (instead of TASK_UNINTERRUPTIBLE) and will return early on signals
+ */
+
+#define poll_event(cond, interval)				\
+do {								\
+	while (cond)						\
+		msleep(interval);				\
+} while(0)
+
+#define poll_event_timeout(cond, interval, timeout)			\
+do {									\
+	unsigned long stop = jiffies + msecs_to_jiffies(timeout);	\
+	while (cond && time_before(jiffies, stop))			\
+		msleep(interval);					\
+} while(0)
+
+#define poll_event_interruptible(cond, interval)		\
+do {								\
+	while (cond) {						\
+		msleep_interruptible(interval);			\
+		if (signal_pending(current))			\
+			break;					\
+	}							\
+} while(0);
+
+#define poll_event_interruptible_timeout(cond, interval, timeout)	\
+do {									\
+	unsigned long stop = jiffies + msecs_to_jiffies(timeout);	\
+	while (cond && time_before(jiffies, stop)) {			\
+		msleep_interruptible(interval);				\
+		if (signal_pending(current))				\
+			break;						\
+	}								\
+} while(0);
+
 #endif /* defined(_LINUX_DELAY_H) */

--===============61179029901525328==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61179029901525328==--
