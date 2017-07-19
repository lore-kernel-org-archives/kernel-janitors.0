From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jul 2017 09:51:57 +0000
Subject: [PATCH] staging: pi433: fix a precedence bug
Message-Id: <20170719095157.3e2rnskjqbva2kwo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We had intended to do the mask first and then the shift.  Shift has
higher precedence so we need to add parenthesis.

Fixes: 874bcba65f9a ("staging: pi433: New driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index e391ce777bc7..5089449bf775 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -387,7 +387,7 @@ enum lnaGain rf69_get_lna_gain(struct spi_device *spi)
 
 	currentValue = READ_REG(REG_LNA);
 
-	switch (currentValue & MASK_LNA_CURRENT_GAIN >> 3)  // improvement: change 3 to define
+	switch ((currentValue & MASK_LNA_CURRENT_GAIN) >> 3)  // improvement: change 3 to define
 	{
 	case LNA_GAIN_AUTO:	    return automatic;
 	case LNA_GAIN_MAX:	    return max;
