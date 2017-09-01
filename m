From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 01 Sep 2017 19:44:45 +0000
Subject: [PATCH 3/4] [media] sp2: Adjust a jump target in sp2_probe()
Message-Id: <88ff94f8-ee01-7a11-f98e-92b3944dc930@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6142ca34-fcda-f2b6-bc35-dbbde0d34378@users.sourceforge.net>
In-Reply-To: <6142ca34-fcda-f2b6-bc35-dbbde0d34378@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Olli Salonen <olli.salonen@iki.fi>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 1 Sep 2017 21:08:38 +0200

* Adjust a jump target so that a null pointer will not be passed to a call
  of the function "kfree".

* Move this function call into an if branch.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/sp2.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index dd556012ceb6..b2a7a54174ae 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -384,7 +384,7 @@ static int sp2_probe(struct i2c_client *client,
 	s = kzalloc(sizeof(*s), GFP_KERNEL);
 	if (!s) {
 		ret = -ENOMEM;
-		goto err;
+		goto report_failure;
 	}
 
 	s->client = client;
@@ -395,15 +395,16 @@ static int sp2_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, s);
 
 	ret = sp2_init(s);
-	if (ret)
-		goto err;
+	if (ret) {
+		kfree(s);
+		goto report_failure;
+	}
 
 	dev_info(&s->client->dev, "CIMaX SP2 successfully attached\n");
 	return 0;
-err:
-	dev_dbg(&client->dev, "init failed=%d\n", ret);
-	kfree(s);
 
+report_failure:
+	dev_dbg(&client->dev, "init failed=%d\n", ret);
 	return ret;
 }
 
-- 
2.14.1

