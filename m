From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 24 Jan 2005 16:40:53 +0000
Subject: [KJ] [UPDATE PATCH 4/22] block/swim_iop: replace schedule_timeout()
Message-Id: <20050124164053.GD2685@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41190690859010171=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41190690859010171==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 12:11:47PM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Change the delay logic of swimiop_eject() to use 
> msleep_interruptible() and time_before(). Rather than depend on the number of
> iterations of the loop for timing accuracy, I rely on the current value of
> jiffies relative to a static timeout (end_jiffies).
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Compile failure; fixed below.

Description: Change the delay logic of swimiop_eject() to use
msleep_interruptible() and time_before(). Rather than depend on the number of
iterations of the loop for timing accuracy, I rely on the current value of
jiffies relative to a static timeout (end_jiffies).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/block/swim_iop.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/block/swim_iop.c	2005-01-23 15:36:39.000000000 -0800
@@ -317,7 +317,8 @@ static void swimiop_status_update(int dr
 
 static int swimiop_eject(struct floppy_state *fs)
 {
-	int err, n;
+	int err;
+	unsigned long end_jiffies;
 	struct swim_iop_req req;
 	struct swimcmd_eject *cmd = (struct swimcmd_eject *) &req.command[0];
 
@@ -332,14 +333,13 @@ static int swimiop_eject(struct floppy_s
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

--===============41190690859010171==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41190690859010171==--
