From: Garrit Franke <garritfranke@gmail.com>
Date: Mon, 15 Jun 2020 13:55:41 +0000
Subject: [PATCH] staging: comedi: fix up missing whitespace in comment
Message-Id: <20200615135541.46986-1-garritfranke@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Cc: Garrit Franke <garritfranke+kernel@gmail.com>, Garrit Franke <garritfranke@gmail.com>

From: Garrit Franke <garritfranke+kernel@gmail.com>

I noticed this missing whitespace in a comment inside ni_mio_common.c

Signed-off-by: Garrit Franke <garritfranke@gmail.com>
---
 drivers/staging/comedi/drivers/ni_mio_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/ni_mio_common.c b/drivers/staging/comedi/drivers/ni_mio_common.c
index d99f4065b96d..9266e13f6271 100644
--- a/drivers/staging/comedi/drivers/ni_mio_common.c
+++ b/drivers/staging/comedi/drivers/ni_mio_common.c
@@ -2390,7 +2390,7 @@ static int ni_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 #endif
 			break;
 		case AIMODE_SAMPLE:
-			/*generate FIFO interrupts on non-empty */
+			/* generate FIFO interrupts on non-empty */
 			ni_stc_writew(dev, NISTC_AI_MODE3_FIFO_MODE_NE,
 				      NISTC_AI_MODE3_REG);
 			break;
-- 
2.25.1
