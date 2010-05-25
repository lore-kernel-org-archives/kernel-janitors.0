From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:19:53 +0000
Subject: [patch v3 1/2] video/saa7134: change dprintk() to i2cdprintk()
Message-Id: <20100525091816.GA13034@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, hermann pitton <hermann-pitton@arcor.de>, Douglas Schilling Landgraf <dougsland@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is that dprintk() dereferences "dev" which is null here.
The i2cdprintk() uses "ir" so that's OK.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Jean Delvare suggested that I use i2cdprintk() instead of modifying
dprintk().
v3: V2 had a bonus cleanup that I removed from v3

diff --git a/drivers/media/video/saa7134/saa7134-input.c b/drivers/media/video/saa7134/saa7134-input.c
index e5565e2..7691bf2 100644
--- a/drivers/media/video/saa7134/saa7134-input.c
+++ b/drivers/media/video/saa7134/saa7134-input.c
@@ -141,8 +141,8 @@ static int get_key_flydvb_trio(struct IR_i2c *ir, u32 *ir_key, u32 *ir_raw)
 	struct saa7134_dev *dev = ir->c->adapter->algo_data;
 
 	if (dev = NULL) {
-		dprintk("get_key_flydvb_trio: "
-			 "gir->c->adapter->algo_data is NULL!\n");
+		i2cdprintk("get_key_flydvb_trio: "
+			   "gir->c->adapter->algo_data is NULL!\n");
 		return -EIO;
 	}
 
@@ -195,8 +195,8 @@ static int get_key_msi_tvanywhere_plus(struct IR_i2c *ir, u32 *ir_key,
 	/* <dev> is needed to access GPIO. Used by the saa_readl macro. */
 	struct saa7134_dev *dev = ir->c->adapter->algo_data;
 	if (dev = NULL) {
-		dprintk("get_key_msi_tvanywhere_plus: "
-			"gir->c->adapter->algo_data is NULL!\n");
+		i2cdprintk("get_key_msi_tvanywhere_plus: "
+			   "gir->c->adapter->algo_data is NULL!\n");
 		return -EIO;
 	}
 

