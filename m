From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 25 Jul 2019 06:55:40 +0000
Subject: [PATCH net-next] can: ti_hecc: remove set but not used variable 'mbx_mask'
Message-Id: <20190725070044.2692-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Grandegger <wg@grandegger.com>, Jeroen Hofstee <jhofstee@victronenergy.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-can@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/can/ti_hecc.c: In function 'ti_hecc_mailbox_read':
drivers/net/can/ti_hecc.c:533:12: warning:
 variable 'mbx_mask' set but not used [-Wunused-but-set-variable]

It is never used so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/can/ti_hecc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/can/ti_hecc.c b/drivers/net/can/ti_hecc.c
index b62f75fa03f0..e63e2f86c289 100644
--- a/drivers/net/can/ti_hecc.c
+++ b/drivers/net/can/ti_hecc.c
@@ -530,9 +530,8 @@ static unsigned int ti_hecc_mailbox_read(struct can_rx_offload *offload,
 					 u32 *timestamp, unsigned int mbxno)
 {
 	struct ti_hecc_priv *priv = rx_offload_to_priv(offload);
-	u32 data, mbx_mask;
+	u32 data;
 
-	mbx_mask = BIT(mbxno);
 	data = hecc_read_mbx(priv, mbxno, HECC_CANMID);
 	if (data & HECC_CANMID_IDE)
 		cf->can_id = (data & CAN_EFF_MASK) | CAN_EFF_FLAG;
