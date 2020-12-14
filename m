From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Dec 2020 11:54:47 +0000
Subject: [PATCH] media: allegro: Fix use after free on error
Message-Id: <X9dShwq8PrThDpn9@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chuhong Yuan <hslester96@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

The "channel" is added to the "dev->channels" but then if
v4l2_m2m_ctx_init() fails then we free "channel" but it's still on the
list so it could lead to a use after free.  Let's not add it to the
list until after v4l2_m2m_ctx_init() succeeds.

Fixes: cc62c74749a3 ("media: allegro: add missed checks in allegro_open()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/staging/media/allegro-dvt/allegro-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 9f718f43282b..640451134072 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2483,8 +2483,6 @@ static int allegro_open(struct file *file)
 	INIT_LIST_HEAD(&channel->buffers_reference);
 	INIT_LIST_HEAD(&channel->buffers_intermediate);
 
-	list_add(&channel->list, &dev->channels);
-
 	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
 						allegro_queue_init);
 
@@ -2493,6 +2491,7 @@ static int allegro_open(struct file *file)
 		goto error;
 	}
 
+	list_add(&channel->list, &dev->channels);
 	file->private_data = &channel->fh;
 	v4l2_fh_add(&channel->fh);
 
-- 
2.29.2
