From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 08 May 2018 06:14:15 +0000
Subject: [PATCH] media: i2c: tda1997: Fix an error handling path 'tda1997x_probe()'
Message-Id: <20180508061415.10945-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tharvey@gateworks.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'media_entity_pads_init()' fails, we must free the resources allocated
by 'v4l2_ctrl_handler_init()', as already done in the previous error
handling path.

'goto' the right label to fix it.

Fixes: 9ac0038db9a7 ("media: i2c: Add TDA1997x HDMI receiver driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/tda1997x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 31bdab96f380..039a92c3294a 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2723,7 +2723,7 @@ static int tda1997x_probe(struct i2c_client *client,
 		state->pads);
 	if (ret) {
 		v4l_err(client, "failed entity_init: %d", ret);
-		goto err_free_mutex;
+		goto err_free_handler;
 	}
 
 	ret = v4l2_async_register_subdev(sd);
-- 
2.17.0

