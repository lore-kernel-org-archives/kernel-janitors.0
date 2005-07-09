From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 09 Jul 2005 00:09:27 +0000
Subject: [KJ] [PATCH 5/14] x86_64/smpboot: use msleep() instead of
Message-Id: <20050709000927.GK2596@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76369845379552781=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76369845379552781==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan <nacc@us.ibm.com>

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 smpboot.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)

diff -urpN 2.6.13-rc2-kj/arch/x86_64/kernel/smpboot.c 2.6.13-rc2-kj-dev/arch/x86_64/kernel/smpboot.c
--- 2.6.13-rc2-kj/arch/x86_64/kernel/smpboot.c	2005-07-06 07:57:18.000000000 -0700
+++ 2.6.13-rc2-kj-dev/arch/x86_64/kernel/smpboot.c	2005-07-06 13:35:10.000000000 -0700
@@ -1189,8 +1189,7 @@ void __cpu_die(unsigned int cpu)
 			printk ("CPU %d is now offline\n", cpu);
 			return;
 		}
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep(100);
 	}
  	printk(KERN_ERR "CPU %u didn't die...\n", cpu);
 }

--===============76369845379552781==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76369845379552781==--
