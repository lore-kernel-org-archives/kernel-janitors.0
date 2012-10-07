From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Oct 2012 15:38:41 +0000
Subject: [PATCH 10/13] drivers/media/tuners/tda8290.c: use macros for i2c_msg initialization
Message-Id: <1349624323-15584-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michael Krufky <mkrufky@linuxtv.org>
Cc: kernel-janitors@vger.kernel.org, rmallon@gmail.com, shubhrajyoti@ti.com, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Introduce use of I2c_MSG_READ/WRITE/OP, for readability.

A length expressed as an explicit constant is also re-expressed as the size
of the bufferin each case.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x - {.addr =3D a, .buf =3D b, .len =3D c, .flags =3D I2C_M_R=
D}
+ I2C_MSG_READ(a,b,c)
 ;

@@
expression a,b,c;
identifier x;
@@

struct i2c_msg x - {.addr =3D a, .buf =3D b, .len =3D c, .flags =3D 0}
+ I2C_MSG_WRITE(a,b,c)
 ;

@@
expression a,b,c,d;
identifier x;
@@

struct i2c_msg x =3D=20
- {.addr =3D a, .buf =3D b, .len =3D c, .flags =3D d}
+ I2C_MSG_OP(a,b,c,d)
 ;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/tuners/tda8290.c |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/tuners/tda8290.c b/drivers/media/tuners/tda8290.c
index 8c48521..83ecee2 100644
--- a/drivers/media/tuners/tda8290.c
+++ b/drivers/media/tuners/tda8290.c
@@ -463,7 +463,8 @@ static void tda8290_standby(struct dvb_frontend *fe)
 	unsigned char cb1[] =3D { 0x30, 0xD0 };
 	unsigned char tda8290_standby[] =3D { 0x00, 0x02 };
 	unsigned char tda8290_agc_tri[] =3D { 0x02, 0x20 };
-	struct i2c_msg msg =3D {.addr =3D priv->tda827x_addr, .flags=3D0, .buf=CB=
1, .len =3D 2};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->tda827x_addr, cb1,
+					   sizeof(cb1));
=20
 	tda8290_i2c_bridge(fe, 1);
 	if (priv->ver & TDA8275A)
@@ -532,8 +533,8 @@ static void tda8290_init_tuner(struct dvb_frontend *fe)
 					  0x3F, 0x2A, 0x04, 0xFF, 0x00, 0x00, 0x40 };
 	unsigned char tda8275a_init[] =3D { 0x00, 0x00, 0x00, 0x00, 0xdC, 0x05, 0=
x8b,
 					  0x0c, 0x04, 0x20, 0xFF, 0x00, 0x00, 0x4b };
-	struct i2c_msg msg =3D {.addr =3D priv->tda827x_addr, .flags=3D0,
-			      .buf=3Dtda8275_init, .len =3D 14};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->tda827x_addr, tda8275_init,
+					   sizeof(tda8275_init));
 	if (priv->ver & TDA8275A)
 		msg.buf =3D tda8275a_init;
=20
@@ -569,7 +570,7 @@ static int tda829x_find_tuner(struct dvb_frontend *fe)
 	int i, ret, tuners_found;
 	u32 tuner_addrs;
 	u8 data;
-	struct i2c_msg msg =3D { .flags =3D I2C_M_RD, .buf =3D &data, .len =3D 1 =
};
+	struct i2c_msg msg =3D I2C_MSG_READ(0, &data, sizeof(data));
=20
 	if (!analog_ops->i2c_gate_ctrl) {
 		printk(KERN_ERR "tda8290: no gate control were provided!\n");
@@ -658,8 +659,8 @@ static int tda8290_probe(struct tuner_i2c_props *i2c_pr=
ops)
 #define TDA8290_ID 0x89
 	u8 reg =3D 0x1f, id;
 	struct i2c_msg msg_read[] =3D {
-		{ .addr =3D i2c_props->addr, .flags =3D 0, .len =3D 1, .buf =3D &reg },
-		{ .addr =3D i2c_props->addr, .flags =3D I2C_M_RD, .len =3D 1, .buf =3D &=
id },
+		I2C_MSG_WRITE(i2c_props->addr, &reg, sizeof(reg)),
+		I2C_MSG_READ(i2c_props->addr, &id, sizeof(id)),
 	};
=20
 	/* detect tda8290 */
@@ -685,8 +686,8 @@ static int tda8295_probe(struct tuner_i2c_props *i2c_pr=
ops)
 #define TDA8295C2_ID 0x8b
 	u8 reg =3D 0x2f, id;
 	struct i2c_msg msg_read[] =3D {
-		{ .addr =3D i2c_props->addr, .flags =3D 0, .len =3D 1, .buf =3D &reg },
-		{ .addr =3D i2c_props->addr, .flags =3D I2C_M_RD, .len =3D 1, .buf =3D &=
id },
+		I2C_MSG_WRITE(i2c_props->addr, &reg, sizeof(reg)),
+		I2C_MSG_READ(i2c_props->addr, &id, sizeof(id)),
 	};
=20
 	/* detect tda8295 */

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
