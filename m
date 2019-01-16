From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 16 Jan 2019 05:44:17 +0000
Subject: [PATCH -next] soc: bcm: bcm2835-pm: Make local symbol static
Message-Id: <1547617457-60066-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

Fixes the following sparse warning:

drivers/soc/bcm/bcm2835-power.c:556:32: warning:
 symbol 'bcm2835_reset_ops' was not declared. Should it be static?

Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains under a new binding.")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/soc/bcm/bcm2835-power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/bcm/bcm2835-power.c b/drivers/soc/bcm/bcm2835-power.c
index 4841295..9351349 100644
--- a/drivers/soc/bcm/bcm2835-power.c
+++ b/drivers/soc/bcm/bcm2835-power.c
@@ -553,7 +553,7 @@ static int bcm2835_reset_status(struct reset_controller_dev *rcdev,
 	}
 }
 
-const struct reset_control_ops bcm2835_reset_ops = {
+static const struct reset_control_ops bcm2835_reset_ops = {
 	.reset = bcm2835_reset_reset,
 	.status = bcm2835_reset_status,
 };
