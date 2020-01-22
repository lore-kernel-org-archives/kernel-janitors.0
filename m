From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jan 2020 23:55:47 +0000
Subject: [PATCH] media: rc: fix spelling mistake "to" -> "too"
Message-Id: <20200122235547.2830605-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/rc/ir-xmp-decoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-xmp-decoder.c b/drivers/media/rc/ir-xmp-decoder.c
index 74a1d30fae6e..4c3d03876200 100644
--- a/drivers/media/rc/ir-xmp-decoder.c
+++ b/drivers/media/rc/ir-xmp-decoder.c
@@ -166,7 +166,7 @@ static int ir_xmp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		} else if (geq_margin(ev.duration, XMP_NIBBLE_PREFIX, XMP_UNIT)) {
 			/* store nibble raw data, decode after trailer */
 			if (data->count = 16) {
-				dev_dbg(&dev->dev, "to many pulses (%d) ignoring: %u\n",
+				dev_dbg(&dev->dev, "too many pulses (%d) ignoring: %u\n",
 					data->count, ev.duration);
 				data->state = STATE_INACTIVE;
 				return -EINVAL;
-- 
2.24.0
