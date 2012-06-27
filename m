From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:06:44 +0000
Subject: [patch -resend] [media] az6007: precedence bug in az6007_i2c_xfer()
Message-Id: <20120627090644.GP31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Jose Alberto Reguero <jareguero@telefonica.net>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent here was to test that the flag was clear but the '!' has
higher precedence than the '&'.  I2C_M_RD is 0x1 so the current code is
equivalent to "&& (!sgs[i].flags) ..."

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I sent this originally on Wed, 25 Jan 2012 and Emil Goode sent the same
fix on Thu, May 3, 2012.

diff --git a/drivers/media/dvb/dvb-usb/az6007.c b/drivers/media/dvb/dvb-usb/az6007.c
index 4008b9c..f6f0cf9 100644
--- a/drivers/media/dvb/dvb-usb/az6007.c
+++ b/drivers/media/dvb/dvb-usb/az6007.c
@@ -711,7 +711,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		addr = msgs[i].addr << 1;
 		if (((i + 1) < num)
 		    && (msgs[i].len = 1)
-		    && (!msgs[i].flags & I2C_M_RD)
+		    && (!(msgs[i].flags & I2C_M_RD))
 		    && (msgs[i + 1].flags & I2C_M_RD)
 		    && (msgs[i].addr = msgs[i + 1].addr)) {
 			/*
