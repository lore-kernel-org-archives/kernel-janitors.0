From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 11:25:54 +0000
Subject: [PATCH] media: cx231xx: remove redundant assignment to variable err
Message-Id: <20200424112554.12456-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index b0cd51134654..c5e21785fafe 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1734,7 +1734,7 @@ static void cx231xx_video_dev_init(
 int cx231xx_417_register(struct cx231xx *dev)
 {
 	/* FIXME: Port1 hardcoded here */
-	int err = -ENODEV;
+	int err;
 	struct cx231xx_tsport *tsport = &dev->ts1;
 	struct vb2_queue *q;
 
-- 
2.25.1
