From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 18 Jan 2005 03:45:17 +0000
Subject: [KJ] [PATCH 5/22] block/swim3: replace schedule_timeout() with
Message-Id: <20050118034517.GB17009@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0056420877364993238=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0056420877364993238==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Change the delay logic to use time_before() and
msleep_interruptible(). Rather than depend on the number of
iterations of the loop for timing accuracy, I rely on the current value of
jiffies relative to a static timeout (end_jiffies).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/block/swim3.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/block/swim3.c	2005-01-17 11:42:09.000000000 -0800
@@ -820,20 +820,21 @@ static void release_drive(struct floppy_
 
 static int fd_eject(struct floppy_state *fs)
 {
-	int err, n;
+	int err;
+	unsigned long end_jiffies;
 
 	err = grab_drive(fs, ejecting, 1);
 	if (err)
 		return err;
 	swim3_action(fs, EJECT);
-	for (n = 20; n > 0; --n) {
+	end_jiffies = jiffies + 20;
+	while (time_before(jiffies, end_jiffies)) {
 		if (signal_pending(current)) {
 			err = -EINTR;
 			break;
 		}
 		swim3_select(fs, RELAX);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1);
+		msleep_interruptible(10);
 		if (swim3_readbit(fs, DISK_IN) == 0)
 			break;
 	}
@@ -878,7 +879,8 @@ static int floppy_open(struct inode *ino
 {
 	struct floppy_state *fs = inode->i_bdev->bd_disk->private_data;
 	struct swim3 __iomem *sw = fs->swim3;
-	int n, err = 0;
+	int err = 0;
+	unsigned long end_jiffies, check_jiffies;
 
 	if (fs->ref_count == 0) {
 		if (fs->media_bay && check_media_bay(fs->media_bay, MB_FD))
@@ -892,16 +894,17 @@ static int floppy_open(struct inode *ino
 		swim3_action(fs, MOTOR_ON);
 		fs->write_prot = -1;
 		fs->cur_cyl = -1;
-		for (n = 0; n < 2 * HZ; ++n) {
-			if (n >= HZ/30 && swim3_readbit(fs, SEEK_COMPLETE))
+		end_jiffies = jiffies + 2 * HZ;
+		check_jiffies = jiffies + HZ/30;
+		while (time_before(jiffies,end_jiffies)) {
+			if (time_after(jiffies,check_jiffies) && swim3_readbit(fs, SEEK_COMPLETE))
 				break;
 			if (signal_pending(current)) {
 				err = -EINTR;
 				break;
 			}
 			swim3_select(fs, RELAX);
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1);
+			msleep_interruptible(10);
 		}
 		if (err == 0 && (swim3_readbit(fs, SEEK_COMPLETE) == 0
 				 || swim3_readbit(fs, DISK_IN) == 0))
@@ -965,7 +968,8 @@ static int floppy_revalidate(struct gend
 {
 	struct floppy_state *fs = disk->private_data;
 	struct swim3 __iomem *sw;
-	int ret, n;
+	int ret;
+	unsigned long end_jiffies;
 
 	if (fs->media_bay && check_media_bay(fs->media_bay, MB_FD))
 		return -ENXIO;
@@ -978,14 +982,14 @@ static int floppy_revalidate(struct gend
 	fs->write_prot = -1;
 	fs->cur_cyl = -1;
 	mdelay(1);
-	for (n = HZ; n > 0; --n) {
+	end_jiffies = jiffies + HZ;
+	while (time_before(jiffies,end_jiffies)) {
 		if (swim3_readbit(fs, SEEK_COMPLETE))
 			break;
 		if (signal_pending(current))
 			break;
 		swim3_select(fs, RELAX);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1);
+		msleep_interruptible(10);
 	}
 	ret = swim3_readbit(fs, SEEK_COMPLETE) == 0
 		|| swim3_readbit(fs, DISK_IN) == 0;

--===============0056420877364993238==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0056420877364993238==--
