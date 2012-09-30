From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Sep 2012 07:33:06 +0000
Subject: [PATCH 2/3] drivers/media/tuners: introduce macros for i2c_msg initialization
Message-Id: <1348990388-7413-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Introduce use of I2c_MSG_READ/WRITE/OP, for readability.

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
 drivers/media/tuners/e4000.c           |   20 +++-----------------
 drivers/media/tuners/fc0012.c          |    8 +++-----
 drivers/media/tuners/fc0013.c          |    8 +++-----
 drivers/media/tuners/fc2580.c          |   20 +++-----------------
 drivers/media/tuners/max2165.c         |    6 +++---
 drivers/media/tuners/mc44s803.c        |    7 ++-----
 drivers/media/tuners/mt2060.c          |   12 ++++--------
 drivers/media/tuners/mt2063.c          |   21 ++++-----------------
 drivers/media/tuners/mt2131.c          |   12 ++++--------
 drivers/media/tuners/mt2266.c          |   12 ++++--------
 drivers/media/tuners/mxl5005s.c        |    6 ++----
 drivers/media/tuners/mxl5007t.c        |   14 ++++----------
 drivers/media/tuners/qt1010.c          |    9 +++------
 drivers/media/tuners/tda18212.c        |   20 +++-----------------
 drivers/media/tuners/tda18218.c        |   19 +++----------------
 drivers/media/tuners/tda18271-common.c |   15 +++++----------
 drivers/media/tuners/tda827x.c         |   29 +++++++++++------------------
 drivers/media/tuners/tda8290.c         |   16 ++++++++--------
 drivers/media/tuners/tua9001.c         |    7 +------
 drivers/media/tuners/tuner-simple.c    |    5 +----
 drivers/media/tuners/xc4000.c          |    9 +++------
 drivers/media/tuners/xc5000.c          |   12 ++++--------
 22 files changed, 81 insertions(+), 206 deletions(-)

diff --git a/drivers/media/tuners/e4000.c b/drivers/media/tuners/e4000.c
index ffaa482..898adc9 100644
--- a/drivers/media/tuners/e4000.c
+++ b/drivers/media/tuners/e4000.c
@@ -26,12 +26,7 @@ static int e4000_wr_regs(struct e4000_priv *priv, u8 reg=
, u8 *val, int len)
 	int ret;
 	u8 buf[1 + len];
 	struct i2c_msg msg[1] =3D {
-		{
-			.addr =3D priv->cfg->i2c_addr,
-			.flags =3D 0,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_addr, buf, sizeof(buf))
 	};
=20
 	buf[0] =3D reg;
@@ -54,17 +49,8 @@ static int e4000_rd_regs(struct e4000_priv *priv, u8 reg=
, u8 *val, int len)
 	int ret;
 	u8 buf[len];
 	struct i2c_msg msg[2] =3D {
-		{
-			.addr =3D priv->cfg->i2c_addr,
-			.flags =3D 0,
-			.len =3D 1,
-			.buf =3D &reg,
-		}, {
-			.addr =3D priv->cfg->i2c_addr,
-			.flags =3D I2C_M_RD,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_addr, &reg, 1),
+		I2C_MSG_READ(priv->cfg->i2c_addr, buf, sizeof(buf))
 	};
=20
 	ret =3D i2c_transfer(priv->i2c, msg, 2);
diff --git a/drivers/media/tuners/fc0012.c b/drivers/media/tuners/fc0012.c
index 308135a..8e955e3 100644
--- a/drivers/media/tuners/fc0012.c
+++ b/drivers/media/tuners/fc0012.c
@@ -24,9 +24,7 @@
 static int fc0012_writereg(struct fc0012_priv *priv, u8 reg, u8 val)
 {
 	u8 buf[2] =3D {reg, val};
-	struct i2c_msg msg =3D {
-		.addr =3D priv->addr, .flags =3D 0, .buf =3D buf, .len =3D 2
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->addr, buf, 2);
=20
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		err("I2C write reg failed, reg: %02x, val: %02x", reg, val);
@@ -38,8 +36,8 @@ static int fc0012_writereg(struct fc0012_priv *priv, u8 r=
eg, u8 val)
 static int fc0012_readreg(struct fc0012_priv *priv, u8 reg, u8 *val)
 {
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->addr, .flags =3D 0, .buf =3D &reg, .len =3D 1 },
-		{ .addr =3D priv->addr, .flags =3D I2C_M_RD, .buf =3D val, .len =3D 1 },
+		I2C_MSG_WRITE(priv->addr, &reg, 1),
+		I2C_MSG_READ(priv->addr, val, 1),
 	};
=20
 	if (i2c_transfer(priv->i2c, msg, 2) !=3D 2) {
diff --git a/drivers/media/tuners/fc0013.c b/drivers/media/tuners/fc0013.c
index bd8f0f1..569e995 100644
--- a/drivers/media/tuners/fc0013.c
+++ b/drivers/media/tuners/fc0013.c
@@ -27,9 +27,7 @@
 static int fc0013_writereg(struct fc0013_priv *priv, u8 reg, u8 val)
 {
 	u8 buf[2] =3D {reg, val};
-	struct i2c_msg msg =3D {
-		.addr =3D priv->addr, .flags =3D 0, .buf =3D buf, .len =3D 2
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->addr, buf, 2);
=20
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		err("I2C write reg failed, reg: %02x, val: %02x", reg, val);
@@ -41,8 +39,8 @@ static int fc0013_writereg(struct fc0013_priv *priv, u8 r=
eg, u8 val)
 static int fc0013_readreg(struct fc0013_priv *priv, u8 reg, u8 *val)
 {
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->addr, .flags =3D 0, .buf =3D &reg, .len =3D 1 },
-		{ .addr =3D priv->addr, .flags =3D I2C_M_RD, .buf =3D val, .len =3D 1 },
+		I2C_MSG_WRITE(priv->addr, &reg, 1),
+		I2C_MSG_READ(priv->addr, val, 1),
 	};
=20
 	if (i2c_transfer(priv->i2c, msg, 2) !=3D 2) {
diff --git a/drivers/media/tuners/fc2580.c b/drivers/media/tuners/fc2580.c
index afc0491..fe04fd5 100644
--- a/drivers/media/tuners/fc2580.c
+++ b/drivers/media/tuners/fc2580.c
@@ -45,12 +45,7 @@ static int fc2580_wr_regs(struct fc2580_priv *priv, u8 r=
eg, u8 *val, int len)
 	int ret;
 	u8 buf[1 + len];
 	struct i2c_msg msg[1] =3D {
-		{
-			.addr =3D priv->cfg->i2c_addr,
-			.flags =3D 0,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_addr, buf, sizeof(buf))
 	};
=20
 	buf[0] =3D reg;
@@ -73,17 +68,8 @@ static int fc2580_rd_regs(struct fc2580_priv *priv, u8 r=
eg, u8 *val, int len)
 	int ret;
 	u8 buf[len];
 	struct i2c_msg msg[2] =3D {
-		{
-			.addr =3D priv->cfg->i2c_addr,
-			.flags =3D 0,
-			.len =3D 1,
-			.buf =3D &reg,
-		}, {
-			.addr =3D priv->cfg->i2c_addr,
-			.flags =3D I2C_M_RD,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_addr, &reg, 1),
+		I2C_MSG_READ(priv->cfg->i2c_addr, buf, sizeof(buf))
 	};
=20
 	ret =3D i2c_transfer(priv->i2c, msg, 2);
diff --git a/drivers/media/tuners/max2165.c b/drivers/media/tuners/max2165.c
index ba84936..3606117 100644
--- a/drivers/media/tuners/max2165.c
+++ b/drivers/media/tuners/max2165.c
@@ -47,7 +47,7 @@ static int max2165_write_reg(struct max2165_priv *priv, u=
8 reg, u8 data)
 {
 	int ret;
 	u8 buf[] =3D { reg, data };
-	struct i2c_msg msg =3D { .flags =3D 0, .buf =3D buf, .len =3D 2 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(0, buf, 2);
=20
 	msg.addr =3D priv->config->i2c_address;
=20
@@ -71,8 +71,8 @@ static int max2165_read_reg(struct max2165_priv *priv, u8=
 reg, u8 *p_data)
 	u8 b0[] =3D { reg };
 	u8 b1[] =3D { 0 };
 	struct i2c_msg msg[] =3D {
-		{ .addr =3D dev_addr, .flags =3D 0, .buf =3D b0, .len =3D 1 },
-		{ .addr =3D dev_addr, .flags =3D I2C_M_RD, .buf =3D b1, .len =3D 1 },
+		I2C_MSG_WRITE(dev_addr, b0, 1),
+		I2C_MSG_READ(dev_addr, b1, 1),
 	};
=20
 	ret =3D i2c_transfer(priv->i2c, msg, 2);
diff --git a/drivers/media/tuners/mc44s803.c b/drivers/media/tuners/mc44s80=
3.c
index f1b7640..e09ba2b 100644
--- a/drivers/media/tuners/mc44s803.c
+++ b/drivers/media/tuners/mc44s803.c
@@ -37,9 +37,7 @@
 static int mc44s803_writereg(struct mc44s803_priv *priv, u32 val)
 {
 	u8 buf[3];
-	struct i2c_msg msg =3D {
-		.addr =3D priv->cfg->i2c_address, .flags =3D 0, .buf =3D buf, .len =3D 3
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, 3);
=20
 	buf[0] =3D (val & 0xff0000) >> 16;
 	buf[1] =3D (val & 0xff00) >> 8;
@@ -59,8 +57,7 @@ static int mc44s803_readreg(struct mc44s803_priv *priv, u=
8 reg, u32 *val)
 	u8 buf[3];
 	int ret;
 	struct i2c_msg msg[] =3D {
-		{ .addr =3D priv->cfg->i2c_address, .flags =3D I2C_M_RD,
-		  .buf =3D buf, .len =3D 3 },
+		I2C_MSG_READ(priv->cfg->i2c_address, buf, 3),
 	};
=20
 	wval =3D MC44S803_REG_SM(MC44S803_REG_DATAREG, MC44S803_ADDR) |
diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.c
index 13381de..bd0556a 100644
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -42,8 +42,8 @@ MODULE_PARM_DESC(debug, "Turn on/off debugging (default:o=
ff).");
 static int mt2060_readreg(struct mt2060_priv *priv, u8 reg, u8 *val)
 {
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->cfg->i2c_address, .flags =3D 0,        .buf =3D &reg, =
.len =3D 1 },
-		{ .addr =3D priv->cfg->i2c_address, .flags =3D I2C_M_RD, .buf =3D val,  =
.len =3D 1 },
+		I2C_MSG_WRITE(priv->cfg->i2c_address, &reg, 1),
+		I2C_MSG_READ(priv->cfg->i2c_address, val, 1),
 	};
=20
 	if (i2c_transfer(priv->i2c, msg, 2) !=3D 2) {
@@ -57,9 +57,7 @@ static int mt2060_readreg(struct mt2060_priv *priv, u8 re=
g, u8 *val)
 static int mt2060_writereg(struct mt2060_priv *priv, u8 reg, u8 val)
 {
 	u8 buf[2] =3D { reg, val };
-	struct i2c_msg msg =3D {
-		.addr =3D priv->cfg->i2c_address, .flags =3D 0, .buf =3D buf, .len =3D 2
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, 2);
=20
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		printk(KERN_WARNING "mt2060 I2C write failed\n");
@@ -71,9 +69,7 @@ static int mt2060_writereg(struct mt2060_priv *priv, u8 r=
eg, u8 val)
 // Writes a set of consecutive registers
 static int mt2060_writeregs(struct mt2060_priv *priv,u8 *buf, u8 len)
 {
-	struct i2c_msg msg =3D {
-		.addr =3D priv->cfg->i2c_address, .flags =3D 0, .buf =3D buf, .len =3D l=
en
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, len);
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		printk(KERN_WARNING "mt2060 I2C write failed (len=3D%i)\n",(int)len);
 		return -EREMOTEIO;
diff --git a/drivers/media/tuners/mt2063.c b/drivers/media/tuners/mt2063.c
index 0ed9091..e45186f 100644
--- a/drivers/media/tuners/mt2063.c
+++ b/drivers/media/tuners/mt2063.c
@@ -250,12 +250,8 @@ static u32 mt2063_write(struct mt2063_state *state, u8=
 reg, u8 *data, u32 len)
 	struct dvb_frontend *fe =3D state->frontend;
 	int ret;
 	u8 buf[60];
-	struct i2c_msg msg =3D {
-		.addr =3D state->config->tuner_address,
-		.flags =3D 0,
-		.buf =3D buf,
-		.len =3D len + 1
-	};
+	struct i2c_msg msg +		I2C_MSG_WRITE(state->config->tuner_address, buf, le=
n + 1);
=20
 	dprintk(2, "\n");
=20
@@ -313,17 +309,8 @@ static u32 mt2063_read(struct mt2063_state *state,
 	for (i =3D 0; i < cnt; i++) {
 		u8 b0[] =3D { subAddress + i };
 		struct i2c_msg msg[] =3D {
-			{
-				.addr =3D state->config->tuner_address,
-				.flags =3D 0,
-				.buf =3D b0,
-				.len =3D 1
-			}, {
-				.addr =3D state->config->tuner_address,
-				.flags =3D I2C_M_RD,
-				.buf =3D pData + i,
-				.len =3D 1
-			}
+			I2C_MSG_WRITE(state->config->tuner_address, b0, 1),
+			I2C_MSG_READ(state->config->tuner_address, pData + i, 1)
 		};
=20
 		status =3D i2c_transfer(state->i2c, msg, 2);
diff --git a/drivers/media/tuners/mt2131.c b/drivers/media/tuners/mt2131.c
index f83b0c1..cdc32b7 100644
--- a/drivers/media/tuners/mt2131.c
+++ b/drivers/media/tuners/mt2131.c
@@ -53,10 +53,8 @@ static u8 mt2131_config2[] =3D {
 static int mt2131_readreg(struct mt2131_priv *priv, u8 reg, u8 *val)
 {
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->cfg->i2c_address, .flags =3D 0,
-		  .buf =3D &reg, .len =3D 1 },
-		{ .addr =3D priv->cfg->i2c_address, .flags =3D I2C_M_RD,
-		  .buf =3D val,  .len =3D 1 },
+		I2C_MSG_WRITE(priv->cfg->i2c_address, &reg, 1),
+		I2C_MSG_READ(priv->cfg->i2c_address, val, 1),
 	};
=20
 	if (i2c_transfer(priv->i2c, msg, 2) !=3D 2) {
@@ -69,8 +67,7 @@ static int mt2131_readreg(struct mt2131_priv *priv, u8 re=
g, u8 *val)
 static int mt2131_writereg(struct mt2131_priv *priv, u8 reg, u8 val)
 {
 	u8 buf[2] =3D { reg, val };
-	struct i2c_msg msg =3D { .addr =3D priv->cfg->i2c_address, .flags =3D 0,
-			       .buf =3D buf, .len =3D 2 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, 2);
=20
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		printk(KERN_WARNING "mt2131 I2C write failed\n");
@@ -81,8 +78,7 @@ static int mt2131_writereg(struct mt2131_priv *priv, u8 r=
eg, u8 val)
=20
 static int mt2131_writeregs(struct mt2131_priv *priv,u8 *buf, u8 len)
 {
-	struct i2c_msg msg =3D { .addr =3D priv->cfg->i2c_address,
-			       .flags =3D 0, .buf =3D buf, .len =3D len };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, len);
=20
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		printk(KERN_WARNING "mt2131 I2C write failed (len=3D%i)\n",
diff --git a/drivers/media/tuners/mt2266.c b/drivers/media/tuners/mt2266.c
index bca4d75..4159e6b 100644
--- a/drivers/media/tuners/mt2266.c
+++ b/drivers/media/tuners/mt2266.c
@@ -57,8 +57,8 @@ MODULE_PARM_DESC(debug, "Turn on/off debugging (default:o=
ff).");
 static int mt2266_readreg(struct mt2266_priv *priv, u8 reg, u8 *val)
 {
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->cfg->i2c_address, .flags =3D 0,        .buf =3D &reg, =
.len =3D 1 },
-		{ .addr =3D priv->cfg->i2c_address, .flags =3D I2C_M_RD, .buf =3D val,  =
.len =3D 1 },
+		I2C_MSG_WRITE(priv->cfg->i2c_address, &reg, 1),
+		I2C_MSG_READ(priv->cfg->i2c_address, val, 1),
 	};
 	if (i2c_transfer(priv->i2c, msg, 2) !=3D 2) {
 		printk(KERN_WARNING "MT2266 I2C read failed\n");
@@ -71,9 +71,7 @@ static int mt2266_readreg(struct mt2266_priv *priv, u8 re=
g, u8 *val)
 static int mt2266_writereg(struct mt2266_priv *priv, u8 reg, u8 val)
 {
 	u8 buf[2] =3D { reg, val };
-	struct i2c_msg msg =3D {
-		.addr =3D priv->cfg->i2c_address, .flags =3D 0, .buf =3D buf, .len =3D 2
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, 2);
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		printk(KERN_WARNING "MT2266 I2C write failed\n");
 		return -EREMOTEIO;
@@ -84,9 +82,7 @@ static int mt2266_writereg(struct mt2266_priv *priv, u8 r=
eg, u8 val)
 // Writes a set of consecutive registers
 static int mt2266_writeregs(struct mt2266_priv *priv,u8 *buf, u8 len)
 {
-	struct i2c_msg msg =3D {
-		.addr =3D priv->cfg->i2c_address, .flags =3D 0, .buf =3D buf, .len =3D l=
en
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, len);
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		printk(KERN_WARNING "MT2266 I2C write failed (len=3D%i)\n",(int)len);
 		return -EREMOTEIO;
diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005=
s.c
index b473b76..ff7ba97 100644
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -3848,8 +3848,7 @@ static int mxl5005s_reset(struct dvb_frontend *fe)
 	int ret =3D 0;
=20
 	u8 buf[2] =3D { 0xff, 0x00 };
-	struct i2c_msg msg =3D { .addr =3D state->config->i2c_address, .flags =3D=
 0,
-			       .buf =3D buf, .len =3D 2 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(state->config->i2c_address, buf, 2);
=20
 	dprintk(2, "%s()\n", __func__);
=20
@@ -3874,8 +3873,7 @@ static int mxl5005s_writereg(struct dvb_frontend *fe,=
 u8 reg, u8 val, int latch)
 {
 	struct mxl5005s_state *state =3D fe->tuner_priv;
 	u8 buf[3] =3D { reg, val, MXL5005S_LATCH_BYTE };
-	struct i2c_msg msg =3D { .addr =3D state->config->i2c_address, .flags =3D=
 0,
-			       .buf =3D buf, .len =3D 3 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(state->config->i2c_address, buf, 3);
=20
 	if (latch =3D 0)
 		msg.len =3D 2;
diff --git a/drivers/media/tuners/mxl5007t.c b/drivers/media/tuners/mxl5007=
t.c
index 69e453e..62774aa 100644
--- a/drivers/media/tuners/mxl5007t.c
+++ b/drivers/media/tuners/mxl5007t.c
@@ -464,8 +464,7 @@ reg_pair_t *mxl5007t_calc_rf_tune_regs(struct mxl5007t_=
state *state,
 static int mxl5007t_write_reg(struct mxl5007t_state *state, u8 reg, u8 val)
 {
 	u8 buf[] =3D { reg, val };
-	struct i2c_msg msg =3D { .addr =3D state->i2c_props.addr, .flags =3D 0,
-			       .buf =3D buf, .len =3D 2 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(state->i2c_props.addr, buf, 2);
 	int ret;
=20
 	ret =3D i2c_transfer(state->i2c_props.adap, &msg, 1);
@@ -494,10 +493,8 @@ static int mxl5007t_read_reg(struct mxl5007t_state *st=
ate, u8 reg, u8 *val)
 {
 	u8 buf[2] =3D { 0xfb, reg };
 	struct i2c_msg msg[] =3D {
-		{ .addr =3D state->i2c_props.addr, .flags =3D 0,
-		  .buf =3D buf, .len =3D 2 },
-		{ .addr =3D state->i2c_props.addr, .flags =3D I2C_M_RD,
-		  .buf =3D val, .len =3D 1 },
+		I2C_MSG_WRITE(state->i2c_props.addr, buf, 2),
+		I2C_MSG_READ(state->i2c_props.addr, val, 1),
 	};
 	int ret;
=20
@@ -512,10 +509,7 @@ static int mxl5007t_read_reg(struct mxl5007t_state *st=
ate, u8 reg, u8 *val)
 static int mxl5007t_soft_reset(struct mxl5007t_state *state)
 {
 	u8 d =3D 0xff;
-	struct i2c_msg msg =3D {
-		.addr =3D state->i2c_props.addr, .flags =3D 0,
-		.buf =3D &d, .len =3D 1
-	};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(state->i2c_props.addr, &d, 1);
 	int ret =3D i2c_transfer(state->i2c_props.adap, &msg, 1);
=20
 	if (ret !=3D 1) {
diff --git a/drivers/media/tuners/qt1010.c b/drivers/media/tuners/qt1010.c
index bc419f8..2358300 100644
--- a/drivers/media/tuners/qt1010.c
+++ b/drivers/media/tuners/qt1010.c
@@ -25,10 +25,8 @@
 static int qt1010_readreg(struct qt1010_priv *priv, u8 reg, u8 *val)
 {
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->cfg->i2c_address,
-		  .flags =3D 0, .buf =3D &reg, .len =3D 1 },
-		{ .addr =3D priv->cfg->i2c_address,
-		  .flags =3D I2C_M_RD, .buf =3D val, .len =3D 1 },
+		I2C_MSG_WRITE(priv->cfg->i2c_address, &reg, 1),
+		I2C_MSG_READ(priv->cfg->i2c_address, val, 1),
 	};
=20
 	if (i2c_transfer(priv->i2c, msg, 2) !=3D 2) {
@@ -43,8 +41,7 @@ static int qt1010_readreg(struct qt1010_priv *priv, u8 re=
g, u8 *val)
 static int qt1010_writereg(struct qt1010_priv *priv, u8 reg, u8 val)
 {
 	u8 buf[2] =3D { reg, val };
-	struct i2c_msg msg =3D { .addr =3D priv->cfg->i2c_address,
-			       .flags =3D 0, .buf =3D buf, .len =3D 2 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->cfg->i2c_address, buf, 2);
=20
 	if (i2c_transfer(priv->i2c, &msg, 1) !=3D 1) {
 		dev_warn(&priv->i2c->dev, "%s: i2c wr failed reg=3D%02x\n",
diff --git a/drivers/media/tuners/tda18212.c b/drivers/media/tuners/tda1821=
2.c
index 5d9f028..2d9a459 100644
--- a/drivers/media/tuners/tda18212.c
+++ b/drivers/media/tuners/tda18212.c
@@ -34,12 +34,7 @@ static int tda18212_wr_regs(struct tda18212_priv *priv, =
u8 reg, u8 *val,
 	int ret;
 	u8 buf[len+1];
 	struct i2c_msg msg[1] =3D {
-		{
-			.addr =3D priv->cfg->i2c_address,
-			.flags =3D 0,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_address, buf, sizeof(buf))
 	};
=20
 	buf[0] =3D reg;
@@ -63,17 +58,8 @@ static int tda18212_rd_regs(struct tda18212_priv *priv, =
u8 reg, u8 *val,
 	int ret;
 	u8 buf[len];
 	struct i2c_msg msg[2] =3D {
-		{
-			.addr =3D priv->cfg->i2c_address,
-			.flags =3D 0,
-			.len =3D 1,
-			.buf =3D &reg,
-		}, {
-			.addr =3D priv->cfg->i2c_address,
-			.flags =3D I2C_M_RD,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_address, &reg, 1),
+		I2C_MSG_READ(priv->cfg->i2c_address, buf, sizeof(buf))
 	};
=20
 	ret =3D i2c_transfer(priv->i2c, msg, 2);
diff --git a/drivers/media/tuners/tda18218.c b/drivers/media/tuners/tda1821=
8.c
index 1819853..ecb5406 100644
--- a/drivers/media/tuners/tda18218.c
+++ b/drivers/media/tuners/tda18218.c
@@ -26,11 +26,7 @@ static int tda18218_wr_regs(struct tda18218_priv *priv, =
u8 reg, u8 *val, u8 len)
 	int ret =3D 0, len2, remaining;
 	u8 buf[1 + len];
 	struct i2c_msg msg[1] =3D {
-		{
-			.addr =3D priv->cfg->i2c_address,
-			.flags =3D 0,
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_address, buf, 0)
 	};
=20
 	for (remaining =3D len; remaining > 0;
@@ -65,17 +61,8 @@ static int tda18218_rd_regs(struct tda18218_priv *priv, =
u8 reg, u8 *val, u8 len)
 	int ret;
 	u8 buf[reg+len]; /* we must start read always from reg 0x00 */
 	struct i2c_msg msg[2] =3D {
-		{
-			.addr =3D priv->cfg->i2c_address,
-			.flags =3D 0,
-			.len =3D 1,
-			.buf =3D "\x00",
-		}, {
-			.addr =3D priv->cfg->i2c_address,
-			.flags =3D I2C_M_RD,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_address, "\x00", 1),
+		I2C_MSG_READ(priv->cfg->i2c_address, buf, sizeof(buf))
 	};
=20
 	ret =3D i2c_transfer(priv->i2c, msg, 2);
diff --git a/drivers/media/tuners/tda18271-common.c b/drivers/media/tuners/=
tda18271-common.c
index 221171e..bf7a564 100644
--- a/drivers/media/tuners/tda18271-common.c
+++ b/drivers/media/tuners/tda18271-common.c
@@ -125,10 +125,8 @@ int tda18271_read_regs(struct dvb_frontend *fe)
 	unsigned char buf =3D 0x00;
 	int ret;
 	struct i2c_msg msg[] =3D {
-		{ .addr =3D priv->i2c_props.addr, .flags =3D 0,
-		  .buf =3D &buf, .len =3D 1 },
-		{ .addr =3D priv->i2c_props.addr, .flags =3D I2C_M_RD,
-		  .buf =3D regs, .len =3D 16 }
+		I2C_MSG_WRITE(priv->i2c_props.addr, &buf, 1),
+		I2C_MSG_READ(priv->i2c_props.addr, regs, 16)
 	};
=20
 	tda18271_i2c_gate_ctrl(fe, 1);
@@ -155,10 +153,8 @@ int tda18271_read_extended(struct dvb_frontend *fe)
 	unsigned char buf =3D 0x00;
 	int ret, i;
 	struct i2c_msg msg[] =3D {
-		{ .addr =3D priv->i2c_props.addr, .flags =3D 0,
-		  .buf =3D &buf, .len =3D 1 },
-		{ .addr =3D priv->i2c_props.addr, .flags =3D I2C_M_RD,
-		  .buf =3D regdump, .len =3D TDA18271_NUM_REGS }
+		I2C_MSG_WRITE(priv->i2c_props.addr, &buf, 1),
+		I2C_MSG_READ(priv->i2c_props.addr, regdump, TDA18271_NUM_REGS)
 	};
=20
 	tda18271_i2c_gate_ctrl(fe, 1);
@@ -192,8 +188,7 @@ int tda18271_write_regs(struct dvb_frontend *fe, int id=
x, int len)
 	struct tda18271_priv *priv =3D fe->tuner_priv;
 	unsigned char *regs =3D priv->tda18271_regs;
 	unsigned char buf[TDA18271_NUM_REGS + 1];
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_props.addr, .flags =3D 0,
-			       .buf =3D buf };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_props.addr, buf, 0);
 	int i, ret =3D 1, max;
=20
 	BUG_ON((len =3D 0) || (idx + len > sizeof(buf)));
diff --git a/drivers/media/tuners/tda827x.c b/drivers/media/tuners/tda827x.c
index a0d1762..b75a29e 100644
--- a/drivers/media/tuners/tda827x.c
+++ b/drivers/media/tuners/tda827x.c
@@ -159,8 +159,7 @@ static int tda827xo_set_params(struct dvb_frontend *fe)
 	u8 buf[14];
 	int rc;
=20
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D 0,
-			       .buf =3D buf, .len =3D sizeof(buf) };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, buf, sizeof(buf));
 	int i, tuner_freq, if_freq;
 	u32 N;
=20
@@ -233,8 +232,7 @@ static int tda827xo_sleep(struct dvb_frontend *fe)
 {
 	struct tda827x_priv *priv =3D fe->tuner_priv;
 	static u8 buf[] =3D { 0x30, 0xd0 };
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D 0,
-			       .buf =3D buf, .len =3D sizeof(buf) };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, buf, sizeof(buf));
=20
 	dprintk("%s:\n", __func__);
 	tuner_transfer(fe, &msg, 1);
@@ -255,7 +253,7 @@ static int tda827xo_set_analog_params(struct dvb_fronte=
nd *fe,
 	u32 N;
 	int i;
 	struct tda827x_priv *priv =3D fe->tuner_priv;
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D 0 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, NULL, 0);
 	unsigned int freq =3D params->frequency;
=20
 	tda827x_set_std(fe, params);
@@ -335,8 +333,7 @@ static void tda827xo_agcf(struct dvb_frontend *fe)
 {
 	struct tda827x_priv *priv =3D fe->tuner_priv;
 	unsigned char data[] =3D { 0x80, 0x0c };
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D 0,
-			       .buf =3D data, .len =3D 2};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, data, 2);
=20
 	tuner_transfer(fe, &msg, 1);
 }
@@ -445,8 +442,7 @@ static int tda827xa_sleep(struct dvb_frontend *fe)
 {
 	struct tda827x_priv *priv =3D fe->tuner_priv;
 	static u8 buf[] =3D { 0x30, 0x90 };
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D 0,
-			       .buf =3D buf, .len =3D sizeof(buf) };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, buf, sizeof(buf));
=20
 	dprintk("%s:\n", __func__);
=20
@@ -465,7 +461,7 @@ static void tda827xa_lna_gain(struct dvb_frontend *fe, =
int high,
 	unsigned char buf[] =3D {0x22, 0x01};
 	int arg;
 	int gp_func;
-	struct i2c_msg msg =3D { .flags =3D 0, .buf =3D buf, .len =3D sizeof(buf)=
 };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(0, buf, sizeof(buf));
=20
 	if (NULL =3D priv->cfg) {
 		dprintk("tda827x_config not defined, cannot set LNA gain!\n");
@@ -518,8 +514,7 @@ static int tda827xa_set_params(struct dvb_frontend *fe)
 	struct tda827xa_data *frequency_map =3D tda827xa_dvbt;
 	u8 buf[11];
=20
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D 0,
-			       .buf =3D buf, .len =3D sizeof(buf) };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, buf, sizeof(buf));
=20
 	int i, tuner_freq, if_freq, rc;
 	u32 N;
@@ -665,8 +660,8 @@ static int tda827xa_set_analog_params(struct dvb_fronte=
nd *fe,
 	u32 N;
 	int i;
 	struct tda827x_priv *priv =3D fe->tuner_priv;
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D 0,
-			       .buf =3D tuner_reg, .len =3D sizeof(tuner_reg) };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, tuner_reg,
+					   sizeof(tuner_reg));
 	unsigned int freq =3D params->frequency;
=20
 	tda827x_set_std(fe, params);
@@ -760,8 +755,7 @@ static void tda827xa_agcf(struct dvb_frontend *fe)
 {
 	struct tda827x_priv *priv =3D fe->tuner_priv;
 	unsigned char data[] =3D {0x80, 0x2c};
-	struct i2c_msg msg =3D {.addr =3D priv->i2c_addr, .flags =3D 0,
-			      .buf =3D data, .len =3D 2};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_addr, data, 2);
 	tuner_transfer(fe, &msg, 1);
 }
=20
@@ -855,8 +849,7 @@ static int tda827x_probe_version(struct dvb_frontend *f=
e)
 	u8 data;
 	int rc;
 	struct tda827x_priv *priv =3D fe->tuner_priv;
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_addr, .flags =3D I2C_M_RD,
-			       .buf =3D &data, .len =3D 1 };
+	struct i2c_msg msg =3D I2C_MSG_READ(priv->i2c_addr, &data, 1);
=20
 	rc =3D tuner_transfer(fe, &msg, 1);
=20
diff --git a/drivers/media/tuners/tda8290.c b/drivers/media/tuners/tda8290.c
index 8c48521..cf3dc6f 100644
--- a/drivers/media/tuners/tda8290.c
+++ b/drivers/media/tuners/tda8290.c
@@ -463,7 +463,7 @@ static void tda8290_standby(struct dvb_frontend *fe)
 	unsigned char cb1[] =3D { 0x30, 0xD0 };
 	unsigned char tda8290_standby[] =3D { 0x00, 0x02 };
 	unsigned char tda8290_agc_tri[] =3D { 0x02, 0x20 };
-	struct i2c_msg msg =3D {.addr =3D priv->tda827x_addr, .flags=3D0, .buf=CB=
1, .len =3D 2};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->tda827x_addr, cb1, 2);
=20
 	tda8290_i2c_bridge(fe, 1);
 	if (priv->ver & TDA8275A)
@@ -532,8 +532,8 @@ static void tda8290_init_tuner(struct dvb_frontend *fe)
 					  0x3F, 0x2A, 0x04, 0xFF, 0x00, 0x00, 0x40 };
 	unsigned char tda8275a_init[] =3D { 0x00, 0x00, 0x00, 0x00, 0xdC, 0x05, 0=
x8b,
 					  0x0c, 0x04, 0x20, 0xFF, 0x00, 0x00, 0x4b };
-	struct i2c_msg msg =3D {.addr =3D priv->tda827x_addr, .flags=3D0,
-			      .buf=3Dtda8275_init, .len =3D 14};
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->tda827x_addr, tda8275_init,
+					   14);
 	if (priv->ver & TDA8275A)
 		msg.buf =3D tda8275a_init;
=20
@@ -569,7 +569,7 @@ static int tda829x_find_tuner(struct dvb_frontend *fe)
 	int i, ret, tuners_found;
 	u32 tuner_addrs;
 	u8 data;
-	struct i2c_msg msg =3D { .flags =3D I2C_M_RD, .buf =3D &data, .len =3D 1 =
};
+	struct i2c_msg msg =3D I2C_MSG_READ(0, &data, 1);
=20
 	if (!analog_ops->i2c_gate_ctrl) {
 		printk(KERN_ERR "tda8290: no gate control were provided!\n");
@@ -658,8 +658,8 @@ static int tda8290_probe(struct tuner_i2c_props *i2c_pr=
ops)
 #define TDA8290_ID 0x89
 	u8 reg =3D 0x1f, id;
 	struct i2c_msg msg_read[] =3D {
-		{ .addr =3D i2c_props->addr, .flags =3D 0, .len =3D 1, .buf =3D &reg },
-		{ .addr =3D i2c_props->addr, .flags =3D I2C_M_RD, .len =3D 1, .buf =3D &=
id },
+		I2C_MSG_WRITE(i2c_props->addr, &reg, 1),
+		I2C_MSG_READ(i2c_props->addr, &id, 1),
 	};
=20
 	/* detect tda8290 */
@@ -685,8 +685,8 @@ static int tda8295_probe(struct tuner_i2c_props *i2c_pr=
ops)
 #define TDA8295C2_ID 0x8b
 	u8 reg =3D 0x2f, id;
 	struct i2c_msg msg_read[] =3D {
-		{ .addr =3D i2c_props->addr, .flags =3D 0, .len =3D 1, .buf =3D &reg },
-		{ .addr =3D i2c_props->addr, .flags =3D I2C_M_RD, .len =3D 1, .buf =3D &=
id },
+		I2C_MSG_WRITE(i2c_props->addr, &reg, 1),
+		I2C_MSG_READ(i2c_props->addr, &id, 1),
 	};
=20
 	/* detect tda8295 */
diff --git a/drivers/media/tuners/tua9001.c b/drivers/media/tuners/tua9001.c
index e6394fc..afbfefc 100644
--- a/drivers/media/tuners/tua9001.c
+++ b/drivers/media/tuners/tua9001.c
@@ -27,12 +27,7 @@ static int tua9001_wr_reg(struct tua9001_priv *priv, u8 =
reg, u16 val)
 	int ret;
 	u8 buf[3] =3D { reg, (val >> 8) & 0xff, (val >> 0) & 0xff };
 	struct i2c_msg msg[1] =3D {
-		{
-			.addr =3D priv->cfg->i2c_addr,
-			.flags =3D 0,
-			.len =3D sizeof(buf),
-			.buf =3D buf,
-		}
+		I2C_MSG_WRITE(priv->cfg->i2c_addr, buf, sizeof(buf))
 	};
=20
 	ret =3D i2c_transfer(priv->i2c, msg, 1);
diff --git a/drivers/media/tuners/tuner-simple.c b/drivers/media/tuners/tun=
er-simple.c
index 39e7e58..1d946af 100644
--- a/drivers/media/tuners/tuner-simple.c
+++ b/drivers/media/tuners/tuner-simple.c
@@ -1065,10 +1065,7 @@ struct dvb_frontend *simple_tuner_attach(struct dvb_=
frontend *fe,
 	 */
 	if (i2c_adap !=3D NULL) {
 		u8 b[1];
-		struct i2c_msg msg =3D {
-			.addr =3D i2c_addr, .flags =3D I2C_M_RD,
-			.buf =3D b, .len =3D 1,
-		};
+		struct i2c_msg msg =3D I2C_MSG_READ(i2c_addr, b, 1);
=20
 		if (fe->ops.i2c_gate_ctrl)
 			fe->ops.i2c_gate_ctrl(fe, 1);
diff --git a/drivers/media/tuners/xc4000.c b/drivers/media/tuners/xc4000.c
index 4937712..c4fb078 100644
--- a/drivers/media/tuners/xc4000.c
+++ b/drivers/media/tuners/xc4000.c
@@ -256,8 +256,7 @@ static void xc_debug_dump(struct xc4000_priv *priv);
=20
 static int xc_send_i2c_data(struct xc4000_priv *priv, u8 *buf, int len)
 {
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_props.addr,
-			       .flags =3D 0, .buf =3D buf, .len =3D len };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_props.addr, buf, len);
 	if (i2c_transfer(priv->i2c_props.adap, &msg, 1) !=3D 1) {
 		if (priv->ignore_i2c_write_errors =3D 0) {
 			printk(KERN_ERR "xc4000: I2C write failed (len=3D%i)\n",
@@ -550,10 +549,8 @@ static int xc4000_readreg(struct xc4000_priv *priv, u1=
6 reg, u16 *val)
 	u8 buf[2] =3D { reg >> 8, reg & 0xff };
 	u8 bval[2] =3D { 0, 0 };
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->i2c_props.addr,
-			.flags =3D 0, .buf =3D &buf[0], .len =3D 2 },
-		{ .addr =3D priv->i2c_props.addr,
-			.flags =3D I2C_M_RD, .buf =3D &bval[0], .len =3D 2 },
+		I2C_MSG_WRITE(priv->i2c_props.addr, &buf[0], 2),
+		I2C_MSG_READ(priv->i2c_props.addr, &bval[0], 2),
 	};
=20
 	if (i2c_transfer(priv->i2c_props.adap, msg, 2) !=3D 2) {
diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index dc93cf3..84c9870 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -253,8 +253,7 @@ static int xc5000_TunerReset(struct dvb_frontend *fe);
=20
 static int xc_send_i2c_data(struct xc5000_priv *priv, u8 *buf, int len)
 {
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_props.addr,
-			       .flags =3D 0, .buf =3D buf, .len =3D len };
+	struct i2c_msg msg =3D I2C_MSG_WRITE(priv->i2c_props.addr, buf, len);
=20
 	if (i2c_transfer(priv->i2c_props.adap, &msg, 1) !=3D 1) {
 		printk(KERN_ERR "xc5000: I2C write failed (len=3D%i)\n", len);
@@ -269,8 +268,7 @@ static int xc_send_i2c_data(struct xc5000_priv *priv, u=
8 *buf, int len)
    transaction in case we are on a multi-master bus */
 static int xc_read_i2c_data(struct xc5000_priv *priv, u8 *buf, int len)
 {
-	struct i2c_msg msg =3D { .addr =3D priv->i2c_props.addr,
-		.flags =3D I2C_M_RD, .buf =3D buf, .len =3D len };
+	struct i2c_msg msg =3D I2C_MSG_READ(priv->i2c_props.addr, buf, len);
=20
 	if (i2c_transfer(priv->i2c_props.adap, &msg, 1) !=3D 1) {
 		printk(KERN_ERR "xc5000 I2C read failed (len=3D%i)\n", len);
@@ -285,10 +283,8 @@ static int xc5000_readreg(struct xc5000_priv *priv, u1=
6 reg, u16 *val)
 	u8 buf[2] =3D { reg >> 8, reg & 0xff };
 	u8 bval[2] =3D { 0, 0 };
 	struct i2c_msg msg[2] =3D {
-		{ .addr =3D priv->i2c_props.addr,
-			.flags =3D 0, .buf =3D &buf[0], .len =3D 2 },
-		{ .addr =3D priv->i2c_props.addr,
-			.flags =3D I2C_M_RD, .buf =3D &bval[0], .len =3D 2 },
+		I2C_MSG_WRITE(priv->i2c_props.addr, &buf[0], 2),
+		I2C_MSG_READ(priv->i2c_props.addr, &bval[0], 2),
 	};
=20
 	if (i2c_transfer(priv->i2c_props.adap, msg, 2) !=3D 2) {

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
