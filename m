From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 18 Aug 2012 21:25:56 +0000
Subject: [PATCH 2/5] drivers/media/video/mt9m032.c: introduce missing initialization
Message-Id: <1345325159-7365-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The result of one call to a function is tested, and then at the second call
to the same function, the previous result, and not the current result, is
tested again.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ret;
identifier f;
statement S1,S2;
@@

*ret = f(...);
if (\(ret != 0\|ret < 0\|ret = NULL\)) S1
... when any
*f(...);
if (\(ret != 0\|ret < 0\|ret = NULL\)) S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/video/mt9m032.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/video/mt9m032.c b/drivers/media/video/mt9m032.c
index 445359c..f80c1d7 100644
--- a/drivers/media/video/mt9m032.c
+++ b/drivers/media/video/mt9m032.c
@@ -781,7 +781,7 @@ static int mt9m032_probe(struct i2c_client *client,
 	ret = mt9m032_write(client, MT9M032_RESET, 1);	/* reset on */
 	if (ret < 0)
 		goto error_entity;
-	mt9m032_write(client, MT9M032_RESET, 0);	/* reset off */
+	ret = mt9m032_write(client, MT9M032_RESET, 0);	/* reset off */
 	if (ret < 0)
 		goto error_entity;
 

