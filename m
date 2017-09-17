From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 08:20:01 +0000
Subject: [PATCH 1/2] [media] tda18212: Delete an error message for a failed memory allocation in tda18212_pro
Message-Id: <118a0240-23a9-d688-54c2-fc4113a195c4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eb35c033-46b3-4fd6-8398-f1e3869a67a8@users.sourceforge.net>
In-Reply-To: <eb35c033-46b3-4fd6-8398-f1e3869a67a8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 09:33:58 +0200

* Omit an extra message for a memory allocation failure in this function.

  This issue was detected by using the Coccinelle software.

* Add a jump target so that the function "kfree" will be always called
  with a non-null pointer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/tda18212.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/tuners/tda18212.c b/drivers/media/tuners/tda18212.c
index 7b8068354fea..8f89d52cd39c 100644
--- a/drivers/media/tuners/tda18212.c
+++ b/drivers/media/tuners/tda18212.c
@@ -204,6 +204,5 @@ static int tda18212_probe(struct i2c_client *client,
 	if (dev = NULL) {
 		ret = -ENOMEM;
-		dev_err(&client->dev, "kzalloc() failed\n");
-		goto err;
+		goto report_failure;
 	}
 
@@ -250,8 +249,9 @@ static int tda18212_probe(struct i2c_client *client,
 
 	return 0;
 err:
-	dev_dbg(&client->dev, "failed=%d\n", ret);
 	kfree(dev);
+report_failure:
+	dev_dbg(&client->dev, "failed=%d\n", ret);
 	return ret;
 }
 
-- 
2.14.1

