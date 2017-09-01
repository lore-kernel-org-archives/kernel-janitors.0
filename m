From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Sep 2017 19:42:38 +0000
Subject: [PATCH 1/4] [media] sp2: Delete an error message for a failed memory allocation in sp2_probe()
Message-Id: <22129d4f-f26c-c63b-6704-0e5f5d9f854e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6142ca34-fcda-f2b6-bc35-dbbde0d34378@users.sourceforge.net>
In-Reply-To: <6142ca34-fcda-f2b6-bc35-dbbde0d34378@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Olli Salonen <olli.salonen@iki.fi>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Sep 2017 20:44:05 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/sp2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index 43d47dfcc7b8..d3b4f8822096 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -385,6 +385,5 @@ static int sp2_probe(struct i2c_client *client,
 	if (!s) {
 		ret = -ENOMEM;
-		dev_err(&client->dev, "kzalloc() failed\n");
 		goto err;
 	}
 
-- 
2.14.1

