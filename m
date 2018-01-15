From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 14:02:05 +0000
Subject: [PATCH 2/2] mfd/rc5t583: Improve a size determination in rc5t583_i2c_probe()
Message-Id: <144ca5ca-1cfd-28a7-7bf3-8f513d567abc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <681cd296-5d05-cdf8-f031-162d7f837b36@users.sourceforge.net>
In-Reply-To: <681cd296-5d05-cdf8-f031-162d7f837b36@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 14:50:25 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/rc5t583.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 411dba636a53..fd46de02b715 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -258,7 +258,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c,
 		return -EINVAL;
 	}
 
-	rc5t583 = devm_kzalloc(&i2c->dev, sizeof(struct rc5t583), GFP_KERNEL);
+	rc5t583 = devm_kzalloc(&i2c->dev, sizeof(*rc5t583), GFP_KERNEL);
 	if (!rc5t583)
 		return -ENOMEM;
 
-- 
2.15.1

