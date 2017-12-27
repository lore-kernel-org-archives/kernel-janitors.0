From: JI-HUN KIM <jihuun.k@gmail.com>
Date: Wed, 27 Dec 2017 05:54:16 +0000
Subject: [PATCH 2/3] staging: irda: add spaces around '|' operator
Message-Id: <20171227055412.GA32724@MacBook-Air>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, shreeya.patel23498@gmail.com, netdev@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Clean up checkpatch warning:
CHECK: spaces preferred around that '|' (ctx:VxV)

Signed-off-by: JI-HUN KIM <jihuun.k@gmail.com>
---
 drivers/staging/irda/drivers/esi-sir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/irda/drivers/esi-sir.c b/drivers/staging/irda/drivers/esi-sir.c
index a12cf55..00866a3 100644
--- a/drivers/staging/irda/drivers/esi-sir.c
+++ b/drivers/staging/irda/drivers/esi-sir.c
@@ -69,7 +69,7 @@ static int esi_open(struct sir_dev *dev)
 	/* Power up and set dongle to 9600 baud */
 	sirdev_set_dtr_rts(dev, FALSE, TRUE);
 
-	qos->baud_rate.bits &= IR_9600|IR_19200|IR_115200;
+	qos->baud_rate.bits &= IR_9600 | IR_19200 | IR_115200;
 	qos->min_turn_time.bits = 0x01; /* Needs at least 10 ms */
 	irda_qos_bits_to_value(qos);
 
-- 
2.10.1 (Apple Git-78)

