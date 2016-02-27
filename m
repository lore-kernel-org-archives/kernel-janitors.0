From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 27 Feb 2016 10:51:09 +0000
Subject: [patch 1/2] [media] tvp5150: off by one
Message-Id: <20160227105109.GD14086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The ->input_ent[] array has TVP5150_INPUT_NUM elements so the > here
should be >=.

Fixes: f7b4b54e6364 ('[media] tvp5150: add HW input connectors support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index ef393f5..ff18444 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1386,7 +1386,7 @@ static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 			goto err_connector;
 		}
 
-		if (input_type > TVP5150_INPUT_NUM) {
+		if (input_type >= TVP5150_INPUT_NUM) {
 			ret = -EINVAL;
 			goto err_connector;
 		}
