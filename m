From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 06:30:06 +0000
Subject: [patch] input: cy8ctmg100_ts: signedness bug
Message-Id: <20100806063006.GM9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alan Cox <alan@linux.intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" should be signed here or the error handling doesn't work.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index 4eb7df0..f4e893f 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -96,7 +96,7 @@ static int cy8ctmg110_read_regs(struct cy8ctmg110 *tsc,
 		unsigned char *data, unsigned char len, unsigned char cmd)
 {
 	struct i2c_client *client = tsc->client;
-	unsigned int ret;
+	int ret;
 	struct i2c_msg msg[2] = {
 		/* first write slave position to i2c devices */
 		{ client->addr, 0, 1, &cmd },
