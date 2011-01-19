From: Dan Carpenter <error27@gmail.com>
Date: Wed, 19 Jan 2011 14:27:58 +0000
Subject: [patch 1/2] [media] dib8000: fix small memory leak on error
Message-Id: <20110119142758.GO2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Patrick Boettcher <patrick.boettcher@dibcom.fr>, Olivier Grenie <olivier.grenie@dibcom.fr>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

kfree(state) if fe allocation fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/frontends/dib8000.c b/drivers/media/dvb/frontends/dib8000.c
index 3e20aa8..c1c3e26 100644
--- a/drivers/media/dvb/frontends/dib8000.c
+++ b/drivers/media/dvb/frontends/dib8000.c
@@ -2514,7 +2514,7 @@ struct dvb_frontend *dib8000_attach(struct i2c_adapter *i2c_adap, u8 i2c_addr, s
 		return NULL;
 	fe = kzalloc(sizeof(struct dvb_frontend), GFP_KERNEL);
 	if (fe = NULL)
-		return NULL;
+		goto error;
 
 	memcpy(&state->cfg, cfg, sizeof(struct dib8000_config));
 	state->i2c.adap = i2c_adap;
