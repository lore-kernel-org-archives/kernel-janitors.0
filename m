From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Sat, 19 Nov 2005 07:22:12 +0000
Subject: [KJ] [PATCH] drivers/cdrom/aztcd.c: busy loop updates + error
Message-Id: <437ED2A4.8040308@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Summary of changes:
* long busy loops now sleeps between each repetition.
* using jiffies for timeout rather than repetitions.
* The return code of aztSendCmd is now checked.

Signed-off-by: Daniel Marjam=E4ki

diff -up a/drivers/cdrom/aztcd.c b/drivers/cdrom/aztcd.c

--- a/drivers/cdrom/aztcd.c	2005-11-17 11:39:53.000000000 +0100
+++ b/drivers/cdrom/aztcd.c	2005-11-19 08:06:18.000000000 +0100
@@ -179,6 +179,7 @@
  #include <linux/ioport.h>
  #include <linux/string.h>
  #include <linux/major.h>
+#include <linux/jiffies.h>

  #include <linux/init.h>

@@ -308,7 +309,7 @@ static char aztDiskChanged =3D 1;
  static char aztTocUpToDate =3D 0;

  static unsigned char aztIndatum;
-static unsigned long aztTimeOutCount;
+static unsigned long aztTimeOutCount, aztTimeOut;
  static int aztCmd =3D 0;

  static DEFINE_SPINLOCK(aztSpin);
@@ -361,14 +362,14 @@ static int azt_bcd2bin(unsigned char bcd
  # define OP_OK op_ok()
  static void op_ok(void)
  {
-	aztTimeOutCount =3D 0;
+	aztTimeOut =3D jiffies + 2;
  	do {
  		aztIndatum =3D inb(DATA_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >=3D AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			printk("aztcd: Error Wait OP_OK\n");
  			break;
  		}
+		schedule_timeout(1);
  	} while (aztIndatum !=3D AFL_OP_OK);
  }

@@ -377,14 +378,14 @@ static void op_ok(void)
  # define PA_OK pa_ok()
  static void pa_ok(void)
  {
-	aztTimeOutCount =3D 0;
+	aztTimeOut =3D jiffies + 2;
  	do {
  		aztIndatum =3D inb(DATA_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >=3D AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			printk("aztcd: Error Wait PA_OK\n");
  			break;
  		}
+		schedule_timeout(1);
  	} while (aztIndatum !=3D AFL_PA_OK);
  }
  #endif
@@ -393,17 +394,17 @@ static void pa_ok(void)
  # define STEN_LOW  sten_low()
  static void sten_low(void)
  {
-	aztTimeOutCount =3D 0;
+	aztTimeOut =3D jiffies + 2;
  	do {
  		aztIndatum =3D inb(STATUS_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >=3D AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			if (azt_init_end)
  				printk
  				    ("aztcd: Error Wait STEN_LOW commands:%x\n",
  				     aztCmd);
  			break;
  		}
+		schedule_timeout(1);
  	} while (aztIndatum & AFL_STATUS);
  }

@@ -411,14 +412,14 @@ static void sten_low(void)
  # define DTEN_LOW dten_low()
  static void dten_low(void)
  {
-	aztTimeOutCount =3D 0;
+	aztTimeOut =3D jiffies + 2;
  	do {
  		aztIndatum =3D inb(STATUS_PORT);
-		aztTimeOutCount++;
-		if (aztTimeOutCount >=3D AZT_TIMEOUT) {
+		if (time_after(jiffies, aztTimeOut)) {
  			printk("aztcd: Error Wait DTEN_OK\n");
  			break;
  		}
+		schedule_timeout(1);
  	} while (aztIndatum & AFL_DATA);
  }

@@ -520,7 +521,8 @@ static int sendAztCmd(int cmd, struct az
  	       params->end.min, params->end.sec, params->end.frame);
  #endif
  	for (retry =3D 0; retry < AZT_RETRY_ATTEMPTS; retry++) {
-		aztSendCmd(cmd);
+		if (aztSendCmd(cmd))
+			continue;
  		outb(params->start.min, CMD_PORT);
  		outb(params->start.sec, CMD_PORT);
  		outb(params->start.frame, CMD_PORT);
@@ -560,7 +562,8 @@ static int aztSeek(struct azt_Play_msf *
  	       params->start.min, params->start.sec, params->start.frame);
  #endif
  	for (retry =3D 0; retry < AZT_RETRY_ATTEMPTS; retry++) {
-		aztSendCmd(ACMD_SEEK);
+		if (aztSendCmd(ACMD_SEEK))
+			continue;
  		outb(params->start.min, CMD_PORT);
  		outb(params->start.sec, CMD_PORT);
  		outb(params->start.frame, CMD_PORT);
@@ -595,7 +598,8 @@ static int aztSetDiskType(int type)
  	printk("aztcd: set disk type command: type=3D %i\n", type);
  #endif
  	for (retry =3D 0; retry < AZT_RETRY_ATTEMPTS; retry++) {
-		aztSendCmd(ACMD_SET_DISK_TYPE);
+		if (aztSendCmd(ACMD_SET_DISK_TYPE))
+			continue;
  		outb(type, CMD_PORT);
  		STEN_LOW;
  		data =3D inb(DATA_PORT);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
