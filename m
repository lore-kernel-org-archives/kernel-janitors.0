From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 14:01:09 +0000
Subject: [PATCH 1/2] mfd/rc5t583: Delete an error message for a failed memory allocation in rc5t583_i2c_probe
Message-Id: <c9a59f0e-5219-8e23-209a-300a8b2e65f3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <681cd296-5d05-cdf8-f031-162d7f837b36@users.sourceforge.net>
In-Reply-To: <681cd296-5d05-cdf8-f031-162d7f837b36@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 14:48:57 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/rc5t583.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index d12243d5ecb8..411dba636a53 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -259,10 +259,8 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c,
 	}
 
 	rc5t583 = devm_kzalloc(&i2c->dev, sizeof(struct rc5t583), GFP_KERNEL);
-	if (!rc5t583) {
-		dev_err(&i2c->dev, "Memory allocation failed\n");
+	if (!rc5t583)
 		return -ENOMEM;
-	}
 
 	rc5t583->dev = &i2c->dev;
 	i2c_set_clientdata(i2c, rc5t583);
-- 
2.15.1

