From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 23:03:36 +0000
Subject: [KJ] [PATCH 13/21] ia64/smpboot: replace schedule_timeout() with
Message-Id: <20050117230336.GT24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99111102615227553=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99111102615227553==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc1-kj-v/arch/ia64/kernel/smpboot.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/ia64/kernel/smpboot.c	2005-01-15 17:12:46.000000000 -0800
@@ -612,8 +612,7 @@ void __cpu_die(unsigned int cpu)
 			 */
 			return;
 		}
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
  	printk(KERN_ERR "CPU %u didn't die...\n", cpu);
 }

--===============99111102615227553==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99111102615227553==--
