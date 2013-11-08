From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:43:17 +0000
Subject: [patch] usb: phy: twl6030-usb: signedness bug in twl6030_readb()
Message-Id: <20131108094317.GA27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"ret" needs to be signed for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 30e8a61..bad57ce 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -127,7 +127,8 @@ static inline int twl6030_writeb(struct twl6030_usb *twl, u8 module,
 
 static inline u8 twl6030_readb(struct twl6030_usb *twl, u8 module, u8 address)
 {
-	u8 data, ret = 0;
+	u8 data;
+	int ret;
 
 	ret = twl_i2c_read_u8(module, &data, address);
 	if (ret >= 0)
