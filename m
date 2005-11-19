From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Sat, 19 Nov 2005 16:43:44 +0000
Subject: Re: [KJ] [PATCH] drivers/cdrom/aztcd.c: busy loop updates + error
Message-Id: <437F5640.1040300@comhem.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12096504181996615=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <437ED2A4.8040308@comhem.se>
In-Reply-To: <437ED2A4.8040308@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============12096504181996615==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Thanks for the feedback Nish!


 > Nope, you *must* set the state before calling schedule_timeout. We
 > have even simplified this further by adding
 > schedule_timeout_interruptible() and
 > schedule_timeout_uninterruptible(). Same for all the others.

I wasn't aware of that. I've changed to schedule_timeout_interruptible..
I cannot find any attempts to disable interrupts during the busy loops in the
original code. Therefore I think it should be safe to say "interruptible".


 > Is this fixing a bug you've actually seen? Otherwise you're changing
 > functionality without a real reason.

I thought it was a bad idea not to handle errors.
But I can really see your point and therefore I removed these changes from my patch.



The new suggested patch looks like this:
Changes:
* Sleep during busy loops
* Time out is based on elapsed time


--- a/drivers/cdrom/aztcd.c	2005-11-17 11:39:53.000000000 +0100
+++ b/drivers/cdrom/aztcd.c	2005-11-19 17:14:58.000000000 +0100
@@ -179,6 +179,7 @@
  #include <linux/ioport.h>
  #include <linux/string.h>
  #include <linux/major.h>
+#include <linux/jiffies.h>

  #include <linux/init.h>

@@ -308,7 +309,7 @@ static char aztDiskChanged = 1;
  static char aztTocUpToDate = 0;

  static unsigned char aztIndatum;
-static unsigned long aztTimeOutCount;
+static unsigned long aztTimeOutCount, aztTimeOut;
  static int aztCmd = 0;

  static DEFINE_SPINLOCK(aztSpin);
@@ -361,14 +362,14 @@ static int azt_bcd2bin(unsigned char bcd
  # define OP_OK op_ok()
  static void op_ok(void)
  {
-	aztTimeOutCount = 0;
+	aztTimeOut = jiffies + 2;
  	do {
  		aztIndatum = inb(DATA_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >= AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			printk("aztcd: Error Wait OP_OK\n");
  			break;
  		}
+		schedule_timeout_interruptible(1);
  	} while (aztIndatum != AFL_OP_OK);
  }

@@ -377,14 +378,14 @@ static void op_ok(void)
  # define PA_OK pa_ok()
  static void pa_ok(void)
  {
-	aztTimeOutCount = 0;
+	aztTimeOut = jiffies + 2;
  	do {
  		aztIndatum = inb(DATA_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >= AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			printk("aztcd: Error Wait PA_OK\n");
  			break;
  		}
+		schedule_timeout_interruptible(1);
  	} while (aztIndatum != AFL_PA_OK);
  }
  #endif
@@ -393,17 +394,17 @@ static void pa_ok(void)
  # define STEN_LOW  sten_low()
  static void sten_low(void)
  {
-	aztTimeOutCount = 0;
+	aztTimeOut = jiffies + 2;
  	do {
  		aztIndatum = inb(STATUS_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >= AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			if (azt_init_end)
  				printk
  				    ("aztcd: Error Wait STEN_LOW commands:%x\n",
  				     aztCmd);
  			break;
  		}
+		schedule_timeout_interruptible(1);
  	} while (aztIndatum & AFL_STATUS);
  }

@@ -411,14 +412,14 @@ static void sten_low(void)
  # define DTEN_LOW dten_low()
  static void dten_low(void)
  {
-	aztTimeOutCount = 0;
+	aztTimeOut = jiffies + 2;
  	do {
  		aztIndatum = inb(STATUS_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >= AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			printk("aztcd: Error Wait DTEN_OK\n");
  			break;
  		}
+		schedule_timeout_interruptible(1);
  	} while (aztIndatum & AFL_DATA);
  }










--===============12096504181996615==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12096504181996615==--
