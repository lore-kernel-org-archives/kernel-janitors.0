From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Nov 2005 22:54:42 +0000
Subject: [KJ] [PATCH] atari: time.c: use msleep_interruptible()
Message-Id: <20051129225442.GC7696@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============058953072357110337=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <29495f1d0511291443o328a8fcbs89d925a0a0fef7dc@mail.gmail.com>
In-Reply-To: <29495f1d0511291443o328a8fcbs89d925a0a0fef7dc@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============058953072357110337==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan

The comments preceding the schedule_timeout() call in time.c below
indicated a 50ms delay is desired. The current code implictly assumes
HZ==100 and requests a delay of 5 ticks. This is clearly broken in
higher HZ models. Using msleep_interruptible() makes HZ changes
transparent. Change the corresponding constant appropriately and add a
comment to indicate units.
 
Signed-off-by: Nishanth Aravamudan
Signed-off-by: Domen Puncer
Signed-off-by: Alexey Dobriyan

Index: linux-kj/arch/m68k/atari/time.c
===================================================================
--- linux-kj.orig/arch/m68k/atari/time.c	2005-11-29 12:27:05.000000000 +0300
+++ linux-kj/arch/m68k/atari/time.c	2005-11-30 01:52:08.000000000 +0300
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/rtc.h>
 #include <linux/bcd.h>
+#include <linux/delay.h>
 
 #include <asm/atariints.h>
 
@@ -97,7 +98,7 @@ static void mste_write(struct MSTE_RTC *
 	} while(0)
 
 
-#define HWCLK_POLL_INTERVAL	5
+#define HWCLK_POLL_INTERVAL	50	/* ms */
 
 int atari_mste_hwclk( int op, struct rtc_time *t )
 {
@@ -213,7 +214,7 @@ int atari_tt_hwclk( int op, struct rtc_t
      */
 
     while( RTC_READ(RTC_FREQ_SELECT) & RTC_UIP )
-        schedule_timeout_interruptible(HWCLK_POLL_INTERVAL);
+        msleep_interruptible(HWCLK_POLL_INTERVAL);
 
     local_irq_save(flags);
     RTC_WRITE( RTC_CONTROL, ctrl | RTC_SET );


--===============058953072357110337==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============058953072357110337==--
