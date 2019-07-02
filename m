From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jul 2019 13:16:42 +0000
Subject: [PATCH] nfc: st-nci: remove redundant assignment to variable r
Message-Id: <20190702131642.9865-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable r is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/st-nci/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 67a685adfd44..55d600cd3861 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -72,7 +72,7 @@ static void st_nci_i2c_disable(void *phy_id)
  */
 static int st_nci_i2c_write(void *phy_id, struct sk_buff *skb)
 {
-	int r = -1;
+	int r;
 	struct st_nci_i2c_phy *phy = phy_id;
 	struct i2c_client *client = phy->i2c_dev;
 
-- 
2.20.1
