From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Sep 2008 12:33:26 +0000
Subject: [PATCH 2/5] drivers/media/common/tuners: Drop code after return or
Message-Id: <Pine.LNX.4.64.0809111433020.9593@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com, vigneshbabu@gmail.com, richard.genoud@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The break after the return or goto serves no purpose.

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/media/common/tuners/mxl5007t.c     |    1 -
 drivers/media/common/tuners/tda18271-fe.c  |    1 -
 drivers/media/common/tuners/tda9887.c      |    1 -
 drivers/media/common/tuners/tuner-simple.c |    1 -
 4 files changed, 4 deletions(-)

diff -u -p a/drivers/media/common/tuners/tuner-simple.c b/drivers/media/common/tuners/tuner-simple.c
--- a/drivers/media/common/tuners/tuner-simple.c
+++ b/drivers/media/common/tuners/tuner-simple.c
@@ -1038,7 +1038,6 @@ struct dvb_frontend *simple_tuner_attach
 	case 0:
 		mutex_unlock(&tuner_simple_list_mutex);
 		return NULL;
-		break;
 	case 1:
 		fe->tuner_priv = priv;
 
diff -u -p a/drivers/media/common/tuners/tda18271-fe.c b/drivers/media/common/tuners/tda18271-fe.c
--- a/drivers/media/common/tuners/tda18271-fe.c
+++ b/drivers/media/common/tuners/tda18271-fe.c
@@ -1155,7 +1155,6 @@ struct dvb_frontend *tda18271_attach(str
 	switch (instance) {
 	case 0:
 		goto fail;
-		break;
 	case 1:
 		/* new tuner instance */
 		priv->gate = (cfg) ? cfg->gate : TDA18271_GATE_AUTO;
diff -u -p a/drivers/media/common/tuners/mxl5007t.c b/drivers/media/common/tuners/mxl5007t.c
--- a/drivers/media/common/tuners/mxl5007t.c
+++ b/drivers/media/common/tuners/mxl5007t.c
@@ -979,7 +979,6 @@ struct dvb_frontend *mxl5007t_attach(str
 	switch (instance) {
 	case 0:
 		goto fail;
-		break;
 	case 1:
 		/* new tuner instance */
 		state->config = cfg;
diff -u -p a/drivers/media/common/tuners/tda9887.c b/drivers/media/common/tuners/tda9887.c
--- a/drivers/media/common/tuners/tda9887.c
+++ b/drivers/media/common/tuners/tda9887.c
@@ -686,7 +686,6 @@ struct dvb_frontend *tda9887_attach(stru
 	case 0:
 		mutex_unlock(&tda9887_list_mutex);
 		return NULL;
-		break;
 	case 1:
 		fe->analog_demod_priv = priv;
 		priv->mode = T_STANDBY;
