From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Mar 2005 19:33:30 +0000
Subject: [KJ] [PATCH] m68k/time: replace schedule_timeout() with
Message-Id: <20050302193330.GE2741@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34352417175006211=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34352417175006211==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: The comments preceding the schedule_timeout() call
in time.c below indicated a 50ms delay is desired. The current code
implictly assumes HZ==100 and requests a delay of 5 ticks. This is
clearly broken in higher HZ models. Using msleep_interruptible() makes
HZ changes transparent. Change the corresponding constant appropriately
and add a comment to indicate units.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/arch/m68k/atari/time.c	2005-03-01 23:38:18.000000000 -0800
+++ 2.6.11-kj/arch/m68k/atari/time.c	2005-03-02 11:06:14.000000000 -0800
@@ -97,7 +97,7 @@ static void mste_write(struct MSTE_RTC *
 	} while(0)
 
 
-#define HWCLK_POLL_INTERVAL	5
+#define HWCLK_POLL_INTERVAL	50	/* ms */
 
 int atari_mste_hwclk( int op, struct rtc_time *t )
 {
@@ -212,10 +212,8 @@ int atari_tt_hwclk( int op, struct rtc_t
      * additionally the RTC_SET bit is set to prevent an update cycle.
      */
 
-    while( RTC_READ(RTC_FREQ_SELECT) & RTC_UIP ) {
-        current->state = TASK_INTERRUPTIBLE;
-        schedule_timeout(HWCLK_POLL_INTERVAL);
-    }
+    while( RTC_READ(RTC_FREQ_SELECT) & RTC_UIP )
+	msleep_interruptible(HWCLK_POLL_INTERVAL);
 
     local_irq_save(flags);
     RTC_WRITE( RTC_CONTROL, ctrl | RTC_SET );

--===============34352417175006211==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34352417175006211==--
