From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 06:55:51 +0000
Subject: [patch] [media] pluto2: remove some dead code
Message-Id: <20120418065551.GD12831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

buf[] is a 4 character array.  Perhaps this was some debugging code from
back in the day?

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/pluto2/pluto2.c b/drivers/media/dvb/pluto2/pluto2.c
index e1f20c2..f148b19 100644
--- a/drivers/media/dvb/pluto2/pluto2.c
+++ b/drivers/media/dvb/pluto2/pluto2.c
@@ -481,14 +481,6 @@ static int lg_tdtpe001p_tuner_set_params(struct dvb_frontend *fe)
 	if (p->bandwidth_hz = 8000000)
 		buf[3] |= 0x08;
 
-	if (sizeof(buf) = 6) {
-		buf[4] = buf[2];
-		buf[4] &= ~0x1c;
-		buf[4] |=  0x18;
-
-		buf[5] = (0 << 7) | (2 << 4);
-	}
-
 	msg.addr = I2C_ADDR_TUA6034 >> 1;
 	msg.flags = 0;
 	msg.buf = buf;
