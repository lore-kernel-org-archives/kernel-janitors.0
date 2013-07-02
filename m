From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jul 2013 21:41:07 +0000
Subject: [patch 2/3] Input: cyttsp4 - silence NULL dereference warning
Message-Id: <20130702214107.GB1598@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Martinez Canillas <javier@dowhile0.org>, Ferruh Yigit <fery@cypress.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

If "cd" were NULL then we would dereference it when we print the error
message.  Fortunately enough, it can't ever be NULL so we can remove
those lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
index 7aa4a34..851e3ff 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -1450,11 +1450,6 @@ static void cyttsp4_watchdog_work(struct work_struct *work)
 	u8 *mode;
 	int retval;
 
-	if (cd = NULL) {
-		dev_err(cd->dev, "%s: NULL context pointer\n", __func__);
-		return;
-	}
-
 	mutex_lock(&cd->system_lock);
 	retval = cyttsp4_load_status_regs(cd);
 	if (retval < 0) {
