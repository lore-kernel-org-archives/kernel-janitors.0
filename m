From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 23:01:35 +0000
Subject: [KJ] [PATCH 12/21] i386/traps: replace schedule_timeout() with
Message-Id: <20050117230135.GS24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9056279796086073=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9056279796086073==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use ssleep() instead of schedule_timeout() to guarantee the task
delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/arch/i386/kernel/traps.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/i386/kernel/traps.c	2005-01-15 17:11:32.000000000 -0800
@@ -345,8 +345,7 @@ void die(const char * str, struct pt_reg
 
 	if (panic_on_oops) {
 		printk(KERN_EMERG "Fatal exception: panic in 5 seconds\n");
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(5 * HZ);
+		ssleep(5);
 		panic("Fatal exception");
 	}
 	do_exit(SIGSEGV);

--===============9056279796086073==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9056279796086073==--
