From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 08:01:47 +0000
Subject: [PATCH] phy: phy-twl4030-usb: silence an uninitialized variable warning
Message-Id: <20170630080147.hbqbjgaa6bnrtwrw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, Vivek Gautam <vivek.gautam@codeaurora.org>, Matt Ranostay <mranostay@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "check" variable isn't necessarily initialized when we print it out
in the debugging messages.  It's a pretty haphazard affair and it
doesn't matter very much what we initialize "check" to.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index 2990b3965460..0e9013868188 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -185,7 +185,7 @@ struct twl4030_usb {
 static int twl4030_i2c_write_u8_verify(struct twl4030_usb *twl,
 		u8 module, u8 data, u8 address)
 {
-	u8 check;
+	u8 check = 0xFF;
 
 	if ((twl_i2c_write_u8(module, data, address) >= 0) &&
 	    (twl_i2c_read_u8(module, &check, address) >= 0) &&
