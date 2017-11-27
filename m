From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 13:47:22 +0000
Subject: [PATCH] atm: suni: remove extraneous space to fix indentation
Message-Id: <20171127134722.11552-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove a leading space, fixes indentation

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/suni.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/suni.c b/drivers/atm/suni.c
index b8825f2d79e0..4b044710a8cf 100644
--- a/drivers/atm/suni.c
+++ b/drivers/atm/suni.c
@@ -177,7 +177,7 @@ static int set_loopback(struct atm_dev *dev,int mode)
 		default:
 			return -EINVAL;
 	}
-	 dev->ops->phy_put(dev, control, reg);
+	dev->ops->phy_put(dev, control, reg);
 	PRIV(dev)->loop_mode = mode;
 	return 0;
 }
-- 
2.14.1

