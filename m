From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Mar 2005 20:09:34 +0000
Subject: [KJ] [PATCH] block/swim_iop: replace schedule_timeout() with
Message-Id: <20050302200934.GJ2741@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91232297441955446=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91232297441955446==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Re-send of a patch from January 24, 2005, adding Jens this time.

Thanks,
Nish

Description: Change the delay logic of swimiop_eject() to use
msleep_interruptible() and time_before(). Rather than depend on the
number of iterations of the loop for timing accuracy, I rely on the
current value of jiffies relative to a static timeout (end_jiffies).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/drivers/block/swim_iop.c	2005-03-02 11:21:41.000000000 -0800
+++ 2.6.11-kj/drivers/block/swim_iop.c	2005-03-02 12:03:27.000000000 -0800
@@ -318,7 +318,8 @@ static void swimiop_status_update(int dr
 
 static int swimiop_eject(struct floppy_state *fs)
 {
-	int err, n;
+	int err;
+	unsigned long end_jiffies;
 	struct swim_iop_req req;
 	struct swimcmd_eject *cmd = (struct swimcmd_eject *) &req.command[0];
 
@@ -333,14 +334,13 @@ static int swimiop_eject(struct floppy_s
 		release_drive(fs);
 		return err;
 	}
-	for (n = 2*HZ; n > 0; --n) {
-		if (req.complete) break;
-		if (signal_pending(current)) {
+	end_jiffies = jiffies + 2 * HZ;
+	while (!req.complete && time_before(jiffies, end_jiffies)) {
+		msleep_interruptible(10);
+		if (signals_pending(current)) {
 			err = -EINTR;
 			break;
 		}
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1);
 	}
 	release_drive(fs);
 	return cmd->error;


--===============91232297441955446==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91232297441955446==--
