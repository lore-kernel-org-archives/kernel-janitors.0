From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 20 Dec 2005 16:43:20 +0000
Subject: [KJ] [Patch] Remove MOD_{INC,DEC}_USE_COUNT in em28xx-i2c
Message-Id: <1135097000.27486.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88537590209952488=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88537590209952488==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

em28xx-i2c.c is one of the last two users of 
MOD_{INC,DEC}_USE_COUNT in the kernel, this patch removes
its usage. 

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/drivers/media/video/em28xx/em28xx-i2c.c.orig	2005-12-20 17:35:17.000000000 +0100
+++ linux-2.6.15-rc6/drivers/media/video/em28xx/em28xx-i2c.c	2005-12-20 17:35:36.000000000 +0100
@@ -398,18 +398,6 @@ static u32 functionality(struct i2c_adap
 	return I2C_FUNC_SMBUS_EMUL;
 }
 
-#ifndef I2C_PEC
-static void inc_use(struct i2c_adapter *adap)
-{
-	MOD_INC_USE_COUNT;
-}
-
-static void dec_use(struct i2c_adapter *adap)
-{
-	MOD_DEC_USE_COUNT;
-}
-#endif
-
 static int em28xx_set_tuner(int check_eeprom, struct i2c_client *client)
 {
 	struct em28xx *dev = client->adapter->algo_data;
@@ -480,12 +468,7 @@ static struct i2c_algorithm em28xx_algo 
 };
 
 static struct i2c_adapter em28xx_adap_template = {
-#ifdef I2C_PEC
 	.owner = THIS_MODULE,
-#else
-	.inc_use = inc_use,
-	.dec_use = dec_use,
-#endif
 #ifdef I2C_CLASS_TV_ANALOG
 	.class = I2C_CLASS_TV_ANALOG,
 #endif



--===============88537590209952488==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88537590209952488==--
