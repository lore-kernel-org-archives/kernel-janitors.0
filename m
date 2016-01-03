From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 Jan 2016 12:11:06 +0000
Subject: [PATCH] drivers/media/usb/dvb-usb-v2: constify mxl111sf_tuner_config structure
Message-Id: <1451823066-24300-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Krufky <mkrufky@linuxtv.org>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

This mxl111sf_tuner_config structure is never modified, so declare it as
const.

There are some indentation changes to remain within 80 columns.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c |    6 +++---
 drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.h |    8 ++++----
 drivers/media/usb/dvb-usb-v2/mxl111sf.c       |    2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c b/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c
index 444579b..7d16252 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c
@@ -36,7 +36,7 @@ MODULE_PARM_DESC(debug, "set debugging level (1=info (or-able)).");
 struct mxl111sf_tuner_state {
 	struct mxl111sf_state *mxl_state;
 
-	struct mxl111sf_tuner_config *cfg;
+	const struct mxl111sf_tuner_config *cfg;
 
 	enum mxl_if_freq if_freq;
 
@@ -489,8 +489,8 @@ static struct dvb_tuner_ops mxl111sf_tuner_tuner_ops = {
 };
 
 struct dvb_frontend *mxl111sf_tuner_attach(struct dvb_frontend *fe,
-					   struct mxl111sf_state *mxl_state,
-					   struct mxl111sf_tuner_config *cfg)
+				struct mxl111sf_state *mxl_state,
+				const struct mxl111sf_tuner_config *cfg)
 {
 	struct mxl111sf_tuner_state *state = NULL;
 
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.h b/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.h
index e6caab2..509b550 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.h
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.h
@@ -63,13 +63,13 @@ struct mxl111sf_tuner_config {
 #if IS_ENABLED(CONFIG_DVB_USB_MXL111SF)
 extern
 struct dvb_frontend *mxl111sf_tuner_attach(struct dvb_frontend *fe,
-					   struct mxl111sf_state *mxl_state,
-					   struct mxl111sf_tuner_config *cfg);
+				struct mxl111sf_state *mxl_state,
+				const struct mxl111sf_tuner_config *cfg);
 #else
 static inline
 struct dvb_frontend *mxl111sf_tuner_attach(struct dvb_frontend *fe,
-					   struct mxl111sf_state *mxl_state,
-					   struct mxl111sf_tuner_config *cfg)
+				struct mxl111sf_state *mxl_state,
+				const struct mxl111sf_tuner_config *cfg)
 {
 	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index b669dec..b586e17 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -856,7 +856,7 @@ static int mxl111sf_ant_hunt(struct dvb_frontend *fe)
 	return 0;
 }
 
-static struct mxl111sf_tuner_config mxl_tuner_config = {
+static const struct mxl111sf_tuner_config mxl_tuner_config = {
 	.if_freq         = MXL_IF_6_0, /* applies to external IF output, only */
 	.invert_spectrum = 0,
 	.read_reg        = mxl111sf_read_reg,

