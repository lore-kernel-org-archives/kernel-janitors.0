From: Pratyush Patel <pratyushpatel.1995@gmail.com>
Date: Tue, 14 Jun 2016 09:00:42 +0000
Subject: [PATCH] alarmtimer: fixed comments describing structure fields
Message-Id: <20160614090042.GA4665@cyborg>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: john.stultz@linaro.org
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Updated struct alarm and struct alarm_timer descriptions.

Signed-off-by: Pratyush Patel <pratyushpatel.1995@gmail.com>
---
 include/linux/alarmtimer.h | 6 +++---
 kernel/time/alarmtimer.c   | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/linux/alarmtimer.h b/include/linux/alarmtimer.h
index 52f3b7d..9d80312 100644
--- a/include/linux/alarmtimer.h
+++ b/include/linux/alarmtimer.h
@@ -26,10 +26,10 @@ enum alarmtimer_restart {
  * struct alarm - Alarm timer structure
  * @node:	timerqueue node for adding to the event list this value
  *		also includes the expiration time.
- * @period:	Period for recuring alarms
+ * @timer:	hrtimer used to schedule events while running
  * @function:	Function pointer to be executed when the timer fires.
- * @type:	Alarm type (BOOTTIME/REALTIME)
- * @enabled:	Flag that represents if the alarm is set to fire or not
+ * @type:	Alarm type (BOOTTIME/REALTIME).
+ * @state:	Flag that represents if the alarm is set to fire or not.
  * @data:	Internal data value.
  */
 struct alarm {
diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index e840ed8..c3aad68 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -30,7 +30,6 @@
  * struct alarm_base - Alarm timer bases
  * @lock:		Lock for syncrhonized access to the base
  * @timerqueue:		Timerqueue head managing the list of events
- * @timer: 		hrtimer used to schedule events while running
  * @gettime:		Function to read the time correlating to the base
  * @base_clockid:	clockid for the base
  */
-- 
2.7.4

