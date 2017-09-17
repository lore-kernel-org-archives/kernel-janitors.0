From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 06:57:45 +0000
Subject: [PATCH 1/2] [media] si2157: Delete an error message for a failed memory allocation in si2157_probe()
Message-Id: <e9510d39-2aff-ca78-5e51-1cf97555a2e3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87f4a386-ac11-87f5-2d22-7bfc0593de34@users.sourceforge.net>
In-Reply-To: <87f4a386-ac11-87f5-2d22-7bfc0593de34@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 08:20:04 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/si2157.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e35b1faf0ddc..aefa85718496 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -439,6 +439,5 @@ static int si2157_probe(struct i2c_client *client,
 	if (!dev) {
 		ret = -ENOMEM;
-		dev_err(&client->dev, "kzalloc() failed\n");
 		goto err;
 	}
 
-- 
2.14.1

