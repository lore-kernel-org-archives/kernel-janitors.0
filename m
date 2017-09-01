From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Sep 2017 18:20:38 +0000
Subject: [PATCH] [media] si2168: Delete an error message for a failed memory allocation in si2168_probe()
Message-Id: <67e4ee2f-7fd8-5d46-4000-61dae57ca729@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Sep 2017 19:50:45 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/si2168.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 172fc367ccaa..41d9c513b7e8 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -697,6 +697,5 @@ static int si2168_probe(struct i2c_client *client,
 	if (!dev) {
 		ret = -ENOMEM;
-		dev_err(&client->dev, "kzalloc() failed\n");
 		goto err;
 	}
 
-- 
2.14.1

