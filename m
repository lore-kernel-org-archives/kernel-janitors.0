From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:09:50 +0000
Subject: [Kernel-janitors] [PATCH 2/5] atm/firestream: replace
Message-Id: <20040915180950.GC4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58796880375193128=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58796880375193128==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch I sent
19 July but the changes haven't appared in either 2.6.9-rc1-mm5 or
2.6.9-rc2.

Description: msleep() is used instead of schedule_timeout() to guarantee
the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/atm/firestream.c	2004-09-13 17:16:06.000000000 -0700
+++ 2.6.9-rc2/drivers/atm/firestream.c	2004-09-14 11:23:07.000000000 -0700
@@ -1704,8 +1704,7 @@ static int __devinit fs_init (struct fs_
 		}
 
 		/* Try again after 10ms. */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout ((HZ+99)/100);
+		msleep(10);
 	}
 
 	if (!to) {

--===============58796880375193128==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58796880375193128==--
