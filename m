From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 21:38:29 +0000
Subject: [Kernel-janitors] [PATCH] hvc_console: replace schedule_timeout()
Message-Id: <20040722213828.GG2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077091951867906072=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============077091951867906072==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/hvc_console.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/char/hvc_console.c	2004-07-10 18:37:15.000000000 +0000
@@ -40,7 +40,7 @@ extern int hvc_put_chars(int index, cons
 
 #define MAX_NR_HVC_CONSOLES	4
 
-#define TIMEOUT		((HZ + 99) / 100)
+#define TIMEOUT		10
 
 static struct tty_driver *hvc_driver;
 static int hvc_offset;
@@ -276,8 +276,7 @@ int khvcd(void *unused)
 			for (i = 0; i < MAX_NR_HVC_CONSOLES; ++i)
 				hvc_poll(i);
 		}
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(TIMEOUT);
+		msleep(TIMEOUT);
 	}
 }
 

--===============077091951867906072==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077091951867906072==--
