From: "debian developer" <debiandev@gmail.com>
Date: Sat, 03 May 2008 05:21:23 +0000
Subject: Resend: [Patch 1/1] kernel/time/ntp.c : fix warning
Message-Id: <f24d23310805022209l58e3f227t2ced788a4115139e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, kernelnewbies@nl.linux.org, kernel-janitors@vger.kernel.org
Cc: dmitri.vorobiev@gmail.com

Mailer spoilt the previous send... just realized that copy does'nt
work, sorry for that
Hello,

On compiling on a Xeon machine i get the following warning

kernel/time/ntp.c: In function `do_adjtimex':
kernel/time/ntp.c:328: warning: comparison of distinct pointer types
lacks a cast
kernel/time/ntp.c:329: warning: comparison of distinct pointer types
lacks a cast

This is with gcc version 3.4.3. The following patch fixes this...

--- linux-2.6.25/kernel/time/ntp.c.orig	2008-05-03 04:27:20.000000000 +0530
+++ linux-2.6.25/kernel/time/ntp.c	2008-05-03 04:45:06.000000000 +0530
@@ -325,8 +325,8 @@ int do_adjtimex(struct timex *txc)
 		     * Scale the phase adjustment and
 		     * clamp to the operating range.
 		     */
-		    time_offset = min(time_offset, (s64)MAXPHASE * NSEC_PER_USEC);
-		    time_offset = max(time_offset, (s64)-MAXPHASE * NSEC_PER_USEC);
+		    time_offset = min(time_offset, (s64)(MAXPHASE * NSEC_PER_USEC));
+		    time_offset = max(time_offset, (s64)(-MAXPHASE * NSEC_PER_USEC));

 		    /*
 		     * Select whether the frequency is to be controlled
