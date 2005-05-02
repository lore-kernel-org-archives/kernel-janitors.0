From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 02 May 2005 06:32:26 +0000
Subject: [KJ] [PATCH] alpha/osf_sys: use helper functions to convert between
Message-Id: <20050502063226.GF10173@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38474042363851324=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38474042363851324==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use helper functions to convert between timeval structure and jiffies
rather than custom logic.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.12-rc3/arch/alpha/kernel/osf_sys.c	2005-04-29 11:03:03.000000000 -0700
+++ 2.6.12-rc3-dev/arch/alpha/kernel/osf_sys.c	2005-05-01 23:10:24.000000000 -0700
@@ -1166,16 +1166,13 @@ osf_usleep_thread(struct timeval32 __use
 	if (get_tv32(&tmp, sleep))
 		goto fault;
 
-	ticks = tmp.tv_usec;
-	ticks = (ticks + (1000000 / HZ) - 1) / (1000000 / HZ);
-	ticks += tmp.tv_sec * HZ;
+	ticks = timeval_to_jiffies(&tmp);
 
 	current->state = TASK_INTERRUPTIBLE;
 	ticks = schedule_timeout(ticks);
 
 	if (remain) {
-		tmp.tv_sec = ticks / HZ;
-		tmp.tv_usec = ticks % HZ;
+		jiffies_to_timeval(ticks, &tmp);
 		if (put_tv32(remain, &tmp))
 			goto fault;
 	}

--===============38474042363851324==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38474042363851324==--
