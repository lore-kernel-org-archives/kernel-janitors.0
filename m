From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 20:31:22 +0000
Subject: [Kernel-janitors] [PATCH 7/8] block/swim_iop: replace direct
Message-Id: <20040915203122.GC5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60138560471953828=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60138560471953828==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: set_current_state() is used instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/block/swim_iop.c	2004-09-09 23:05:54.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/block/swim_iop.c	2004-09-10 10:04:16.000000000 -0700
@@ -338,7 +338,7 @@ static int swimiop_eject(struct floppy_s
 			err = -EINTR;
 			break;
 		}
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 	}
 	release_drive(fs);

--===============60138560471953828==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60138560471953828==--
