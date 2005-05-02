From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 02 May 2005 06:34:57 +0000
Subject: [KJ] [PATCH] net/slip: replace schedule_timeout() with
Message-Id: <20050502063457.GG10173@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66490907043917158=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050502061446.GB10173@us.ibm.com>
In-Reply-To: <20050502061446.GB10173@us.ibm.com>
To: loz@holmes.demon.co.uk, waltje@uwalt.nl.mugnet.org
Cc: netdev@oss.sgi.com, Kernel-Janitors <kernel-janitors@lists.osdl.org>

--===============66490907043917158==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use msleep_interruptible() instead of schedule_timeout() to guarantee
the task delays as expected.

--- 2.6.12-rc3/drivers/net/slip.c	2005-03-01 23:38:33.000000000 -0800
+++ 2.6.12-rc3-dev/drivers/net/slip.c	2005-05-01 20:53:08.000000000 -0700
@@ -1395,10 +1395,8 @@ static void __exit slip_exit(void)
 	/* First of all: check for active disciplines and hangup them.
 	 */
 	do {
-		if (busy) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ / 10);
-		}
+		if (busy)
+			msleep_interruptible(100);
 
 		busy = 0;
 		for (i = 0; i < slip_maxdev; i++) {

--===============66490907043917158==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66490907043917158==--
