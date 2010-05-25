From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:21:50 +0000
Subject: [patch v3 2/2] video/saa7134: remove duplicate break
Message-Id: <20100525092149.GA13089@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, hermann pitton <hermann-pitton@arcor.de>, Douglas Schilling Landgraf <dougsland@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code had two break statements in a row.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v3: Put this in a seperate patch.

diff --git a/drivers/media/video/saa7134/saa7134-input.c b/drivers/media/video/saa7134/saa7134-input.c
index e5565e2..7691bf2 100644
--- a/drivers/media/video/saa7134/saa7134-input.c
+++ b/drivers/media/video/saa7134/saa7134-input.c
@@ -815,7 +815,6 @@ int saa7134_input_init1(struct saa7134_dev *dev)
 		mask_keyup   = 0x020000;
 		polling      = 50; /* ms */
 		break;
-	break;
 	}
 	if (NULL = ir_codes) {
 		printk("%s: Oops: IR config error [card=%d]\n",

