From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Nov 2013 07:51:47 +0000
Subject: [patch] [media] cx18: check for allocation failure in cx18_read_eeprom()
Message-Id: <20131122075146.GB15726@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

It upsets static checkers when we don't check for allocation failure.  I
moved the memset() of "tv" earlier so we don't use uninitialized data on
error.

Fixes: 1d212cf0c2d8 ('[media] cx18: struct i2c_client is too big for stack')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index c1f8cc6f14b2..716bdc57fac6 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -327,13 +327,16 @@ void cx18_read_eeprom(struct cx18 *cx, struct tveeprom *tv)
 	struct i2c_client *c;
 	u8 eedata[256];
 
+	memset(tv, 0, sizeof(*tv));
+
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return;
 
 	strlcpy(c->name, "cx18 tveeprom tmp", sizeof(c->name));
 	c->adapter = &cx->i2c_adap[0];
 	c->addr = 0xa0 >> 1;
 
-	memset(tv, 0, sizeof(*tv));
 	if (tveeprom_read(c, eedata, sizeof(eedata)))
 		goto ret;
 
