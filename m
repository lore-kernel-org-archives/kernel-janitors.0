From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 10 Jan 2005 18:19:05 +0000
Subject: [KJ] [UPDATE PATCH] scsi/osst: replace schedule_timeout() with
Message-Id: <20050110181905.GE3099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66293518556440212=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============66293518556440212==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> all patches:
> ------------

<snip>

> msleep-drivers_scsi_osst.patch

Consider replacing with the following patch, as signals are not dealt with in
the existing code:

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. Although TASK_INTERRUPTIBLE is used in the current code,
there is no code dealing with an early return / signals_pending().


--- 2.6.10-v/drivers/scsi/osst.c	2004-12-24 13:34:45.000000000 -0800
+++ 2.6.10/drivers/scsi/osst.c	2005-01-05 14:23:05.000000000 -0800
@@ -1488,8 +1488,7 @@ static int osst_reposition_and_retry(OS_
 			osst_set_frame_position(STp, aSRpnt, frame + skip, 1);
 			flag = 0;
 			attempts--;
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ / 10);
+			msleep(100);
 		}
 		if (osst_get_frame_position(STp, aSRpnt) < 0) {		/* additional write error */
 #if DEBUG
@@ -1550,7 +1549,7 @@ static int osst_reposition_and_retry(OS_
 			debugging = 0;
 		}
 #endif
-		schedule_timeout(HZ / 10);
+		msleep(100);
 	}
 	printk(KERN_ERR "%s:E: Failed to find valid tape media\n", name);
 #if DEBUG

--===============66293518556440212==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66293518556440212==--
