From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Dec 2013 14:07:12 +0000
Subject: [patch] mfd: max14577: cleanup an error message
Message-Id: <20131204140712.GA11681@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"pdata" is a NULL not an ERR_PTR so there is no use printing it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 1337c4527028..a5e1c370c609 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -96,8 +96,7 @@ static int max14577_i2c_probe(struct i2c_client *i2c,
 	}
 
 	if (!pdata) {
-		dev_err(&i2c->dev, "No platform data found: %ld\n",
-				PTR_ERR(pdata));
+		dev_err(&i2c->dev, "No platform data found.\n");
 		return -EINVAL;
 	}
 
