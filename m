From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Feb 2014 08:55:06 +0000
Subject: [patch] Input: remove a duplicative NULL test
Message-Id: <20140221085506.GB13185@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Jingoo Han <jg1.han@samsung.com>, Fugang Duan <B38611@freescale.com>, Benson Leung <bleung@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

"pdata" is non-NULL here.  We verified that at the start of the
function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a70400754e92..40abe90cc924 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1146,7 +1146,7 @@ static int mxt_probe(struct i2c_client *client,
 		goto err_free_mem;
 	}
 
-	data->is_tp = pdata && pdata->is_tp;
+	data->is_tp = pdata->is_tp;
 
 	input_dev->name = (data->is_tp) ? "Atmel maXTouch Touchpad" :
 					  "Atmel maXTouch Touchscreen";
