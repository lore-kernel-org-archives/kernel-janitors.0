From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 19 Jul 2004 21:44:05 +0000
Subject: [Kernel-janitors] [PATCH] nbd: replace schedule_timeout() with
Message-Id: <20040719214405.GB5372@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88885640213612827=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88885640213612827==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.


Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/block/nbd.c	2004-06-16 05:19:01.000000000 +0000
+++ linux-dev/drivers/block/nbd.c	2004-07-02 17:24:31.000000000 +0000
@@ -139,8 +139,7 @@ static void nbd_end_request(struct reque
 		spin_unlock(&lo->queue_lock);
 		printk(KERN_DEBUG "%s: request %p still in use (%d), waiting\n",
 		    lo->disk->disk_name, req, req->ref_count);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ); /* wait a second */
+		msleep(1000);
 		spin_lock(&lo->queue_lock);
 	}
 	spin_unlock(&lo->queue_lock);

--===============88885640213612827==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88885640213612827==--
