From: Dan Carpenter <error27@gmail.com>
Date: Sun, 06 Mar 2011 13:40:11 +0000
Subject: [patch 1/2] [media] stv0367: signedness bug in
Message-Id: <20110306134011.GO3416@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: "Igor M. Liplianin" <liplianin@netup.ru>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We use err to store negative error codes so it should be signed.  And
if we return an error from stv0367_get_tuner_freq() that needs to be
handled properly as well.  (param->frequency is a u32).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/frontends/stv0367.c b/drivers/media/dvb/frontends/stv0367.c
index eecdf23..7117ce9 100644
--- a/drivers/media/dvb/frontends/stv0367.c
+++ b/drivers/media/dvb/frontends/stv0367.c
@@ -913,7 +913,7 @@ static u32 stv0367_get_tuner_freq(struct dvb_frontend *fe)
 	struct dvb_frontend_ops	*frontend_ops = NULL;
 	struct dvb_tuner_ops	*tuner_ops = NULL;
 	u32 freq = 0;
-	u32 err = 0;
+	int err = 0;
 
 	dprintk("%s:\n", __func__);
 
diff --git a/drivers/media/dvb/frontends/stv0367.c b/drivers/media/dvb/frontends/stv0367.c
index ec9de40..1304618 100644
--- a/drivers/media/dvb/frontends/stv0367.c
+++ b/drivers/media/dvb/frontends/stv0367.c
@@ -1940,7 +1940,7 @@ static int stv0367ter_get_frontend(struct dvb_frontend *fe,
 	int constell = 0,/* snr = 0,*/ Data = 0;
 
 	param->frequency = stv0367_get_tuner_freq(fe);
-	if (param->frequency < 0)
+	if ((int)param->frequency < 0)
 		param->frequency = c->frequency;
 
 	constell = stv0367_readbits(state, F367TER_TPS_CONST);
