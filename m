From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:57:44 +0000
Subject: [KJ] [PATCH] char/snsc: reorder set_current_state() and
Message-Id: <20041022235744.GN18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1812745081074949=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1812745081074949==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Reorder add_wait_queue() and set_current_state() as a
signal could be lost in between the two functions.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/char/snsc.c	2004-10-22 10:40:59.000000000 -0700
+++ 2.6.9-bk7/drivers/char/snsc.c	2004-10-22 14:50:14.000000000 -0700
@@ -192,8 +192,8 @@ scdrv_read(struct file *file, char __use
 		}
 
 		len = CHUNKSIZE;
-		add_wait_queue(&sd->sd_rq, &wait);
 		set_current_state(TASK_INTERRUPTIBLE);
+		add_wait_queue(&sd->sd_rq, &wait);
 		spin_unlock_irqrestore(&sd->sd_rlock, flags);
 
 		schedule_timeout(SCDRV_TIMEOUT);
@@ -288,8 +288,8 @@ scdrv_write(struct file *file, const cha
 			return -EAGAIN;
 		}
 
-		add_wait_queue(&sd->sd_wq, &wait);
 		set_current_state(TASK_INTERRUPTIBLE);
+		add_wait_queue(&sd->sd_wq, &wait);
 		spin_unlock_irqrestore(&sd->sd_wlock, flags);
 
 		schedule_timeout(SCDRV_TIMEOUT);

--===============1812745081074949==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1812745081074949==--
