From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 18 Aug 2012 21:25:59 +0000
Subject: [PATCH 5/5] drivers/media/video/m5mols/m5mols_core.c: introduce missing initialization
Message-Id: <1345325159-7365-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Heungjun Kim <riverful.kim@samsung.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/media/video/m5mols/m5mols_core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/video/m5mols/m5mols_core.c b/drivers/media/video/m5mols/m5mols_core.c
index ac7d28b..0f521f5 100644
--- a/drivers/media/video/m5mols/m5mols_core.c
+++ b/drivers/media/video/m5mols/m5mols_core.c
@@ -937,7 +937,7 @@ static int __devinit m5mols_probe(struct i2c_client *client,
 	if (!ret)
 		ret = m5mols_init_controls(sd);
 
-	m5mols_sensor_power(info, false);
+	ret = m5mols_sensor_power(info, false);
 	if (!ret)
 		return 0;
 out_me:

