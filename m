From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jan 2018 09:36:23 +0000
Subject: [PATCH] media: lirc: Fix uninitialized variable in ir_lirc_transmit_ir()
Message-Id: <20180110093623.z5kqrsnu72stchu5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>
Cc: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "txbuf" is uninitialized when we call ir_raw_encode_scancode() so
this failure path would lead to a crash.

Fixes: a74b2bff5945 ("media: lirc: do not pass ERR_PTR to kfree")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index fae42f120aa4..5efe9cd2309a 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -295,7 +295,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 		ret = ir_raw_encode_scancode(scan.rc_proto, scan.scancode,
 					     raw, LIRCBUF_SIZE);
 		if (ret < 0)
-			goto out_kfree;
+			goto out_free_raw;
 
 		count = ret;
 
@@ -366,6 +366,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 	return n;
 out_kfree:
 	kfree(txbuf);
+out_free_raw:
 	kfree(raw);
 out_unlock:
 	mutex_unlock(&dev->lock);
