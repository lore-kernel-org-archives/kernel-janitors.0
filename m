From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Nov 2010 08:34:16 +0000
Subject: [patch] Staging: cptm1217: move free under dereference
Message-Id: <20101113083416.GL3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We dereference "ts" in the printk so move the kfree() down a line.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/cptm1217/clearpad_tm1217.c b/drivers/staging/cptm1217/clearpad_tm1217.c
index 269503f..76e4b78 100644
--- a/drivers/staging/cptm1217/clearpad_tm1217.c
+++ b/drivers/staging/cptm1217/clearpad_tm1217.c
@@ -460,9 +460,9 @@ static int cp_tm1217_probe(struct i2c_client *client,
 	for (i = 0; i < TOUCH_SUPPORTED; i++) {
 		input_dev = input_allocate_device();
 		if (input_dev = NULL) {
-			kfree(ts);
 			dev_err(ts->dev,
 				"cp_tm1217:Input Device Struct alloc failed\n");
+			kfree(ts);
 			return -ENOMEM;
 		}
 		input_info = &ts->cp_input_info[i];
