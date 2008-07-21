From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Mon, 21 Jul 2008 19:21:58 +0000
Subject: Re: [PATCH] v4l: replace __FUNCTION__ with __func__
Message-Id: <20080721192158.GC18891@orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080720223108.GC31640@orion>
In-Reply-To: <20080720223108.GC31640@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>

v4l/drx397xD: replace __FUNCTION__ with __func__


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

---

 drivers/media/dvb/frontends/drx397xD.c |   34 ++++++++++++++++----------------
 drivers/media/dvb/frontends/drx397xD.h |    2 +-
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/dvb/frontends/drx397xD.c b/drivers/media/dvb/frontends/drx397xD.c
index 3cbed87..e19147b 100644
--- a/drivers/media/dvb/frontends/drx397xD.c
+++ b/drivers/media/dvb/frontends/drx397xD.c
@@ -96,7 +96,7 @@ static void drx_release_fw(struct drx397xD_state *s)
 {
 	fw_ix_t ix = s->chip_rev;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	write_lock(&fw[ix].lock);
 	if (fw[ix].refcnt) {
@@ -113,7 +113,7 @@ static int drx_load_fw(struct drx397xD_state *s, fw_ix_t ix)
 	size_t size, len;
 	int i = 0, j, rc = -EINVAL;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	if (ix < 0 || ix >= ARRAY_SIZE(fw))
 		return -EINVAL;
@@ -197,10 +197,10 @@ static int write_fw(struct drx397xD_state *s, blob_ix_t ix)
 	int len, rc = 0, i = 0;
 
 	if (ix < 0 || ix >= ARRAY_SIZE(blob_name)) {
-		pr_debug("%s drx_fw_ix_t out of range\n", __FUNCTION__);
+		pr_debug("%s drx_fw_ix_t out of range\n", __func__);
 		return -EINVAL;
 	}
-	pr_debug("%s %s\n", __FUNCTION__, blob_name[ix]);
+	pr_debug("%s %s\n", __func__, blob_name[ix]);
 
 	read_lock(&fw[s->chip_rev].lock);
 	data = fw[s->chip_rev].data[ix];
@@ -305,7 +305,7 @@ static int PLL_Set(struct drx397xD_state *s,
 	u32 f_tuner, f = fep->frequency;
 	int rc;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	if ((f > s->frontend.ops.tuner_ops.info.frequency_max) ||
 	    (f < s->frontend.ops.tuner_ops.info.frequency_min))
@@ -325,7 +325,7 @@ static int PLL_Set(struct drx397xD_state *s,
 		return rc;
 
 	*df_tuner = f_tuner - f;
-	pr_debug("%s requested %d [Hz] tuner %d [Hz]\n", __FUNCTION__, f,
+	pr_debug("%s requested %d [Hz] tuner %d [Hz]\n", __func__, f,
 		 f_tuner);
 
 	return 0;
@@ -340,7 +340,7 @@ static int SC_WaitForReady(struct drx397xD_state *s)
 	int cnt = 1000;
 	int rc;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	while (cnt--) {
 		rc = RD16(s, 0x820043);
@@ -354,7 +354,7 @@ static int SC_SendCommand(struct drx397xD_state *s, int cmd)
 {
 	int rc;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	WR16(s, 0x820043, cmd);
 	SC_WaitForReady(s);
@@ -368,7 +368,7 @@ static int HI_Command(struct drx397xD_state *s, u16 cmd)
 {
 	int rc, cnt = 1000;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	rc = WR16(s, 0x420032, cmd);
 	if (rc < 0)
@@ -389,7 +389,7 @@ static int HI_Command(struct drx397xD_state *s, u16 cmd)
 static int HI_CfgCommand(struct drx397xD_state *s)
 {
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	WR16(s, 0x420033, 0x3973);
 	WR16(s, 0x420034, s->config.w50);	// code 4, log 4
@@ -419,7 +419,7 @@ static int SetCfgIfAgc(struct drx397xD_state *s, struct drx397xD_CfgIfAgc *agc)
 	u16 w0C = agc->w0C;
 	int quot, rem, i, rc = -EINVAL;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	if (agc->w04 > 0x3ff)
 		goto exit_rc;
@@ -478,7 +478,7 @@ static int SetCfgRfAgc(struct drx397xD_state *s, struct drx397xD_CfgRfAgc *agc)
 	u16 w06 = agc->w06;
 	int rc = -1;
 
-	pr_debug("%s %d 0x%x 0x%x\n", __FUNCTION__, agc->d00, w04, w06);
+	pr_debug("%s %d 0x%x 0x%x\n", __func__, agc->d00, w04, w06);
 
 	if (w04 > 0x3ff)
 		goto exit_rc;
@@ -554,7 +554,7 @@ static int CorrectSysClockDeviation(struct drx397xD_state *s)
 	int lockstat;
 	u32 clk, clk_limit;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	if (s->config.d5C = 0) {
 		EXIT_RC(WR16(s, 0x08200e8, 0x010));
@@ -598,7 +598,7 @@ static int CorrectSysClockDeviation(struct drx397xD_state *s)
 
 	if (clk - s->config.f_osc * 1000 + clk_limit <= 2 * clk_limit) {
 		s->f_osc = clk;
-		pr_debug("%s: osc %d %d [Hz]\n", __FUNCTION__,
+		pr_debug("%s: osc %d %d [Hz]\n", __func__,
 			 s->config.f_osc * 1000, clk - s->config.f_osc * 1000);
 	}
 	rc = WR16(s, 0x08200e8, 0);
@@ -610,7 +610,7 @@ static int ConfigureMPEGOutput(struct drx397xD_state *s, int type)
 {
 	int rc, si, bp;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	si = s->config.wA0;
 	if (s->config.w98 = 0) {
@@ -646,7 +646,7 @@ static int drx_tune(struct drx397xD_state *s,
 
 	int rc, df_tuner;
 	int a, b, c, d;
-	pr_debug("%s %d\n", __FUNCTION__, s->config.d60);
+	pr_debug("%s %d\n", __func__, s->config.d60);
 
 	if (s->config.d60 != 2)
 		goto set_tuner;
@@ -1082,7 +1082,7 @@ static int drx397x_init(struct dvb_frontend *fe)
 	struct drx397xD_state *s = fe->demodulator_priv;
 	int rc;
 
-	pr_debug("%s\n", __FUNCTION__);
+	pr_debug("%s\n", __func__);
 
 	s->config.rfagc.d00 = 2;	/* 0x7c */
 	s->config.rfagc.w04 = 0;
diff --git a/drivers/media/dvb/frontends/drx397xD.h b/drivers/media/dvb/frontends/drx397xD.h
index ddc7a07..2ad1ea0 100644
--- a/drivers/media/dvb/frontends/drx397xD.h
+++ b/drivers/media/dvb/frontends/drx397xD.h
@@ -122,7 +122,7 @@ extern struct dvb_frontend* drx397xD_attach(const struct drx397xD_config *config
 static inline struct dvb_frontend* drx397xD_attach(const struct drx397xD_config *config,
 					   struct i2c_adapter *i2c)
 {
-	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __FUNCTION__);
+	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
 }
 #endif /* CONFIG_DVB_DRX397XD */
