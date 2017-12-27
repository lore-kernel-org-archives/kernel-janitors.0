From: JI-HUN KIM <jihuun.k@gmail.com>
Date: Wed, 27 Dec 2017 05:55:16 +0000
Subject: [PATCH 3/3] staging: irda: separate multiple assignments
Message-Id: <20171227055512.GA32731@MacBook-Air>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, shreeya.patel23498@gmail.com, netdev@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Clean up checkpatch warning:
CHECK: multiple assignments should be avoided

Signed-off-by: JI-HUN KIM <jihuun.k@gmail.com>
---
 drivers/staging/irda/drivers/esi-sir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/irda/drivers/esi-sir.c b/drivers/staging/irda/drivers/esi-sir.c
index 00866a3..01097f1 100644
--- a/drivers/staging/irda/drivers/esi-sir.c
+++ b/drivers/staging/irda/drivers/esi-sir.c
@@ -104,7 +104,8 @@ static int esi_change_speed(struct sir_dev *dev, unsigned int speed)
 		rts = FALSE;
 		break;
 	case 115200:
-		dtr = rts = TRUE;
+		dtr = TRUE;
+		rts = TRUE;
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.10.1 (Apple Git-78)

