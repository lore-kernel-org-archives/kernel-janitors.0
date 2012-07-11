From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:36:02 +0000
Subject: [patch] Extcon: Arizona: unlock on an error in arizona_micdet()
Message-Id: <20120711063602.GG11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains about this.  I don't have a way to test this, but it
does look like we should unlock on error here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index b068bc9..4782884 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -154,6 +154,7 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	ret = regmap_read(arizona->regmap, ARIZONA_MIC_DETECT_3, &val);
 	if (ret != 0) {
 		dev_err(arizona->dev, "Failed to read MICDET: %d\n", ret);
+		mutex_unlock(&info->lock);
 		return IRQ_NONE;
 	}
 
