From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 20:08:33 +0000
Subject: [PATCH 1/2] [media] tuners: Delete an error message for a failed memory allocation in m88rs6000t_pro
Message-Id: <feb744ef-7f3f-5005-f208-bd1385678592@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <278b14e0-f717-7471-6dc3-45dc98d64443@users.sourceforge.net>
In-Reply-To: <278b14e0-f717-7471-6dc3-45dc98d64443@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 21:24:27 +0200

* Omit an extra message for a memory allocation failure in this function.

  This issue was detected by using the Coccinelle software.

* Add a jump target so that the function "kfree" will be always called
  with a non-null pointer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/m88rs6000t.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/tuners/m88rs6000t.c b/drivers/media/tuners/m88rs6000t.c
index 9f3e0fd4cad9..d89793a05862 100644
--- a/drivers/media/tuners/m88rs6000t.c
+++ b/drivers/media/tuners/m88rs6000t.c
@@ -626,6 +626,5 @@ static int m88rs6000t_probe(struct i2c_client *client,
 	if (!dev) {
 		ret = -ENOMEM;
-		dev_err(&client->dev, "kzalloc() failed\n");
-		goto err;
+		goto report_failure;
 	}
 
@@ -701,8 +700,9 @@ static int m88rs6000t_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, dev);
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

