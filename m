From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 19 Jul 2004 17:35:32 +0000
Subject: [Kernel-janitors] [PATCH] firestream: replace schedule_timeout()
Message-Id: <20040719173532.GA3035@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75339889121146753=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75339889121146753==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. If this is ok, I
have many (almost 200) more with similar fixes.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/atm/firestream.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/atm/firestream.c	2004-07-02 17:15:16.000000000 +0000
@@ -1704,8 +1704,7 @@ static int __devinit fs_init (struct fs_
 		}
 
 		/* Try again after 10ms. */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout ((HZ+99)/100);
+		msleep(10);
 	}
 
 	if (!to) {

--===============75339889121146753==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75339889121146753==--
