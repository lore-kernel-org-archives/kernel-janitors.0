From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Jul 2020 12:38:48 +0000
Subject: [PATCH] media: allegro: fix an error pointer vs NULL check
Message-Id: <20200722123848.GA220681@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

The allegro_mbox_init() function returns error pointers, it never
returns NULL.

Fixes: 94dc76560261 ("media: allegro: rework mbox handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 61beae1fca36..9f718f43282b 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2952,7 +2952,7 @@ static int allegro_mcu_hw_init(struct allegro_dev *dev,
 					      info->mailbox_size);
 	dev->mbox_status = allegro_mbox_init(dev, info->mailbox_status,
 					     info->mailbox_size);
-	if (!dev->mbox_command || !dev->mbox_status) {
+	if (IS_ERR(dev->mbox_command) || IS_ERR(dev->mbox_status)) {
 		v4l2_err(&dev->v4l2_dev,
 			 "failed to initialize mailboxes\n");
 		return -EIO;
-- 
2.27.0
