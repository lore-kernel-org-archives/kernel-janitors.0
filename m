From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 30 Jan 2006 21:15:46 +0000
Subject: [KJ] [Patch 3/6] BUG_ON() Conversion in kernel/printk.c
Message-Id: <1138655746.4007.12.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51243746311272798=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51243746311272798==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/kernel/printk.c.orig	2006-01-27 11:49:15.000000000 +0100
+++ linux-2.6.16-rc1-git4/kernel/printk.c	2006-01-27 11:50:02.000000000 +0100
@@ -398,8 +398,7 @@ static void call_console_drivers(unsigne
 	unsigned long cur_index, start_print;
 	static int msg_level = -1;
 
-	if (((long)(start - end)) > 0)
-		BUG();
+	BUG_ON(((long)(start - end)) > 0);
 
 	cur_index = start;
 	start_print = start;
@@ -708,8 +707,7 @@ int __init add_preferred_console(char *n
  */
 void acquire_console_sem(void)
 {
-	if (in_interrupt())
-		BUG();
+	BUG_ON(in_interrupt());
 	down(&console_sem);
 	console_locked = 1;
 	console_may_schedule = 1;



--===============51243746311272798==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51243746311272798==--
