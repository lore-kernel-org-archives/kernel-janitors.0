From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 01:06:43 +0000
Subject: [PATCH] media: allegro: fix spelling mistake "to" -> "too"
Message-Id: <20200123010643.2834801-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a v4l2_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 3be41698df4c..9908d851d4be 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -781,7 +781,7 @@ static int allegro_mbox_write(struct allegro_dev *dev,
 
 	if (size > mbox->size) {
 		v4l2_err(&dev->v4l2_dev,
-			 "message (%zu bytes) to large for mailbox (%zu bytes)\n",
+			 "message (%zu bytes) too large for mailbox (%zu bytes)\n",
 			 size, mbox->size);
 		return -EINVAL;
 	}
-- 
2.24.0
