From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 15 Aug 2004 12:18:05 +0000
Subject: [Kernel-janitors] Add msleep_interruptible() function to
Message-Id: <20040815121805.GA15111@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2244296051963266=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kj <kernel-janitors@osdl.org>

--===============2244296051963266==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

while doing kernel-janitor msleep conversion of drivers own (incorrect),
functions, some places would need msleep_interruptible().

this function is equivalent to:
        current->state = TASK_INTERRUPTIBLE;
	schedule_timeout(timeout);

idea from Ingo Molnar:
well, aboves is not 100% equivalent because msleep() is uninterruptible so
stoppage of the md thread (upon shutdown) will occur with only a 250 msec
delay. Someone should add a msleep_interruptible() function to kernel/timer.c.

Signed-off-by: Maximilian Attems <janitor@sternwelten.at>


---

 linux-2.6.8-max/kernel/timer.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+)

diff -puN kernel/timer.c~add-msleep_interruptible kernel/timer.c
--- linux-2.6.8/kernel/timer.c~add-msleep_interruptible	2004-08-14 23:41:46.000000000 +0200
+++ linux-2.6.8-max/kernel/timer.c	2004-08-14 23:41:46.000000000 +0200
@@ -1503,3 +1503,18 @@ void msleep(unsigned int msecs)
 
 EXPORT_SYMBOL(msleep);
 
+/**
+ * msleep_interruptible - sleep waiting for waitqueue interruptions
+ * @msecs: Time in milliseconds to sleep for
+ */
+void msleep_interruptible(unsigned int msecs)
+{
+	unsigned long timeout = msecs_to_jiffies(msecs);
+
+	while (timeout) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		timeout = schedule_timeout(timeout);
+	}
+}
+
+EXPORT_SYMBOL(msleep_interruptible);

_



--===============2244296051963266==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2244296051963266==--
