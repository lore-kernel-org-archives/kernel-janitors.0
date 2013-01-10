From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Jan 2013 09:00:57 +0000
Subject: [patch] [media] staging: go7007: print the audio input type
Message-Id: <20130110090057.GD23063@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: YAMANE Toshiaki <yamanetoshi@gmail.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

Smatch complains that the "Audio input:" printk isn't reachable.  Hiding
the "return 0;" behind another statement is a style violation.

It looks like audio_input is normally configured so I've enabled the
print statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/go7007/s2250-board.c b/drivers/staging/media/go7007/s2250-board.c
index d60e065..37400bf 100644
--- a/drivers/staging/media/go7007/s2250-board.c
+++ b/drivers/staging/media/go7007/s2250-board.c
@@ -534,7 +534,7 @@ static int s2250_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Brightness: %d\n", state->brightness);
 	v4l2_info(sd, "Contrast: %d\n", state->contrast);
 	v4l2_info(sd, "Saturation: %d\n", state->saturation);
-	v4l2_info(sd, "Hue: %d\n", state->hue);	return 0;
+	v4l2_info(sd, "Hue: %d\n", state->hue);
 	v4l2_info(sd, "Audio input: %s\n", state->audio_input = 0 ? "Line In" :
 					state->audio_input = 1 ? "Mic" :
 					state->audio_input = 2 ? "Mic Boost" :
