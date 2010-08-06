From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 06 Aug 2010 06:46:09 +0000
Subject: Re: [patch] input: cy8ctmg100_ts: signedness bug
Message-Id: <20100806064609.GA27764@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806063006.GM9031@bicker>
In-Reply-To: <20100806063006.GM9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Alan Cox <alan@linux.intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 06, 2010 at 08:30:06AM +0200, Dan Carpenter wrote:
> "ret" should be signed here or the error handling doesn't work.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
> index 4eb7df0..f4e893f 100644
> --- a/drivers/input/touchscreen/cy8ctmg110_ts.c
> +++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
> @@ -96,7 +96,7 @@ static int cy8ctmg110_read_regs(struct cy8ctmg110 *tsc,
>  		unsigned char *data, unsigned char len, unsigned char cmd)
>  {
>  	struct i2c_client *client = tsc->client;
> -	unsigned int ret;
> +	int ret;
>  	struct i2c_msg msg[2] = {
>  		/* first write slave position to i2c devices */
>  		{ client->addr, 0, 1, &cmd },

Thanks Dan. It looks like cy8ctmg110_write_regs has siilar issue. Do you
thiks the following will work?

Thanks.

-- 
Dmitry

Input: cy8ctmg100_ts - signedness bug

From: Dan Carpenter <error27@gmail.com>

"ret" should be signed here or the error handling doesn't work.

Signed-off-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/input/touchscreen/cy8ctmg110_ts.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)


diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index 4eb7df0..5ec0946 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -75,7 +75,7 @@ static int cy8ctmg110_write_regs(struct cy8ctmg110 *tsc, unsigned char reg,
 		unsigned char len, unsigned char *value)
 {
 	struct i2c_client *client = tsc->client;
-	unsigned int ret;
+	int ret;
 	unsigned char i2c_data[6];
 
 	BUG_ON(len > 5);
@@ -86,7 +86,7 @@ static int cy8ctmg110_write_regs(struct cy8ctmg110 *tsc, unsigned char reg,
 	ret = i2c_master_send(client, i2c_data, len + 1);
 	if (ret != 1) {
 		dev_err(&client->dev, "i2c write data cmd failed\n");
-		return ret;
+		return ret ? ret : -EIO;
 	}
 
 	return 0;
@@ -96,7 +96,7 @@ static int cy8ctmg110_read_regs(struct cy8ctmg110 *tsc,
 		unsigned char *data, unsigned char len, unsigned char cmd)
 {
 	struct i2c_client *client = tsc->client;
-	unsigned int ret;
+	int ret;
 	struct i2c_msg msg[2] = {
 		/* first write slave position to i2c devices */
 		{ client->addr, 0, 1, &cmd },
