From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:52:09 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 7/17] media/msp3400: replace
Message-Id: <20040920215209.GM2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32984629404394861=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32984629404394861==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/msp3400.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/msp3400.c	2004-09-14 16:45:35.000000000 -0700
@@ -191,8 +191,7 @@ msp3400c_read(struct i2c_client *client,
 		err++;
 		printk(KERN_WARNING "msp34xx: I/O error #%d (read 0x%02x/0x%02x)\n",
 		       err, dev, addr);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 	}
 	if (3 == err) {
 		printk(KERN_WARNING "msp34xx: giving up, reseting chip. Sound will go off, sorry folks :-|\n");
@@ -220,8 +219,7 @@ msp3400c_write(struct i2c_client *client
 		err++;
 		printk(KERN_WARNING "msp34xx: I/O error #%d (write 0x%02x/0x%02x)\n",
 		       err, dev, addr);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 	}
 	if (3 == err) {
 		printk(KERN_WARNING "msp34xx: giving up, reseting chip. Sound will go off, sorry folks :-|\n");
@@ -740,11 +738,12 @@ static int msp34xx_sleep(struct msp3400c
 
 	add_wait_queue(&msp->wq, &wait);
 	if (!msp->rmmod) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (timeout < 0)
+		if (timeout < 0) {
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule();
+		}
 		else
-			schedule_timeout(timeout);
+			msleep_interruptible(jiffies_to_msecs(timeout));
 	}
 	remove_wait_queue(&msp->wq, &wait);
 	return msp->rmmod || signal_pending(current);

--===============32984629404394861==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32984629404394861==--
