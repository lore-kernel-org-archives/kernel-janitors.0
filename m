From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 11 Oct 2018 07:37:07 +0000
Subject: [PATCH net-next] octeontx2-af: Remove set but not used variable 'dev'
Message-Id: <1539243427-25309-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/marvell/octeontx2/af/cgx.c: In function 'cgx_fwi_event_handler':
drivers/net/ethernet/marvell/octeontx2/af/cgx.c:257:17: warning:
 variable 'dev' set but not used [-Wunused-but-set-variable]

It never be used since introduction in
commit 1463f382f58d ("octeontx2-af: Add support for CGX link management")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/cgx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
index f290b1d..2cf8e40 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/cgx.c
@@ -254,7 +254,6 @@ static inline bool cgx_event_is_linkevent(u64 event)
 static irqreturn_t cgx_fwi_event_handler(int irq, void *data)
 {
 	struct lmac *lmac = data;
-	struct device *dev;
 	struct cgx *cgx;
 	u64 event;
 
@@ -265,8 +264,6 @@ static irqreturn_t cgx_fwi_event_handler(int irq, void *data)
 	if (!FIELD_GET(EVTREG_ACK, event))
 		return IRQ_NONE;
 
-	dev = &cgx->pdev->dev;
-
 	switch (FIELD_GET(EVTREG_EVT_TYPE, event)) {
 	case CGX_EVT_CMD_RESP:
 		/* Copy the response. Since only one command is active at a
