From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Nov 2011 18:44:12 +0000
Subject: [patch] [media] V4L: mt9t112: use after free in mt9t112_probe()
Message-Id: <20111107184412.GA9207@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Paul Mundt <lethal@linux-sh.org>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

priv gets dereferenced in mt9t112_set_params() so we should return
before calling that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/video/mt9t112.c b/drivers/media/video/mt9t112.c
index 32114a3..7b34b11 100644
--- a/drivers/media/video/mt9t112.c
+++ b/drivers/media/video/mt9t112.c
@@ -1083,8 +1083,10 @@ static int mt9t112_probe(struct i2c_client *client,
 	v4l2_i2c_subdev_init(&priv->subdev, client, &mt9t112_subdev_ops);
 
 	ret = mt9t112_camera_probe(client);
-	if (ret)
+	if (ret) {
 		kfree(priv);
+		return ret;
+	}
 
 	/* Cannot fail: using the default supported pixel code */
 	mt9t112_set_params(priv, &rect, V4L2_MBUS_FMT_UYVY8_2X8);
