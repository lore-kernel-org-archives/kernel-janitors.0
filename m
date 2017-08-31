From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Aug 2017 13:57:15 +0000
Subject: [PATCH] net: phy: bcm7xxx: make array bcm7xxx_suspend_cfg static, reduces object code size
Message-Id: <20170831135715.27978-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array bcm7xxx_suspend_cfg A on the stack, instead
make it static.  Makes the object code smaller by over 300 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   6351	   8146	      0	  14497	   38a1	drivers/net/phy/bcm7xxx.o

After:
   text	   data	    bss	    dec	    hex	filename
   5986	   8210	      0	  14196	   3774	drivers/net/phy/bcm7xxx.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/phy/bcm7xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/bcm7xxx.c b/drivers/net/phy/bcm7xxx.c
index caa9f6e17f34..8b33f688ac8a 100644
--- a/drivers/net/phy/bcm7xxx.c
+++ b/drivers/net/phy/bcm7xxx.c
@@ -511,7 +511,7 @@ static int bcm7xxx_config_init(struct phy_device *phydev)
 static int bcm7xxx_suspend(struct phy_device *phydev)
 {
 	int ret;
-	const struct bcm7xxx_regs {
+	static const struct bcm7xxx_regs {
 		int reg;
 		u16 value;
 	} bcm7xxx_suspend_cfg[] = {
-- 
2.14.1

