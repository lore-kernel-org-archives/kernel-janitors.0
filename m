From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 21 Dec 2006 08:19:53 +0000
Subject: [KJ] [PATCH] DVB: Remove unneeded void * casts in ttpci/av7110
Message-Id: <20061221081953.GA799@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch removes unneeded void * casts for the following (void *) pointers:
- struct file: private_data
- struct dvb_device: priv
- struct dvb_demux: priv
- struct dvb_adapter: priv

The patch also contains some whitespace and coding style cleanups in the
relevant areas.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 drivers/media/dvb/ttpci/av7110.c    |   28 +++++++++++-----------
 drivers/media/dvb/ttpci/av7110_av.c |   42 +++++++++++++++++-----------------
 drivers/media/dvb/ttpci/av7110_ca.c |   22 ++++++++----------
 3 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/media/dvb/ttpci/av7110.c b/drivers/media/dvb/ttpci/av7110.c
index 366c137..bb213d8 100644
--- a/drivers/media/dvb/ttpci/av7110.c
+++ b/drivers/media/dvb/ttpci/av7110.c
@@ -695,8 +695,8 @@ static void gpioirq(unsigned long data)
 static int dvb_osd_ioctl(struct inode *inode, struct file *file,
 			 unsigned int cmd, void *parg)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 
 	dprintk(4, "%p\n", av7110);
 
@@ -786,7 +786,7 @@ int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
 static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 {
 	struct dvb_demux_feed *dvbdmxfeed = dvbdmxfilter->feed;
-	struct av7110 *av7110 = (struct av7110 *) dvbdmxfeed->demux->priv;
+	struct av7110 *av7110 = dvbdmxfeed->demux->priv;
 	u16 buf[20];
 	int ret, i;
 	u16 handle;
@@ -835,7 +835,7 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 
 static int StopHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 {
-	struct av7110 *av7110 = (struct av7110 *) dvbdmxfilter->feed->demux->priv;
+	struct av7110 *av7110 = dvbdmxfilter->feed->demux->priv;
 	u16 buf[3];
 	u16 answ[2];
 	int ret;
@@ -871,7 +871,7 @@ static int StopHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 {
 	struct dvb_demux *dvbdmx = dvbdmxfeed->demux;
-	struct av7110 *av7110 = (struct av7110 *) dvbdmx->priv;
+	struct av7110 *av7110 = dvbdmx->priv;
 	u16 *pid = dvbdmx->pids, npids[5];
 	int i;
 	int ret = 0;
@@ -914,7 +914,7 @@ static int dvb_feed_start_pid(struct dvb_demux_feed *dvbdmxfeed)
 static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 {
 	struct dvb_demux *dvbdmx = dvbdmxfeed->demux;
-	struct av7110 *av7110 = (struct av7110 *) dvbdmx->priv;
+	struct av7110 *av7110 = dvbdmx->priv;
 	u16 *pid = dvbdmx->pids, npids[5];
 	int i;
 
@@ -1103,9 +1103,9 @@ static int dvb_get_stc(struct dmx_demux *demux, unsigned int num,
 
 	/* pointer casting paranoia... */
 	BUG_ON(!demux);
-	dvbdemux = (struct dvb_demux *) demux->priv;
+	dvbdemux = demux->priv;
 	BUG_ON(!dvbdemux);
-	av7110 = (struct av7110 *) dvbdemux->priv;
+	av7110 = dvbdemux->priv;
 
 	dprintk(4, "%p\n", av7110);
 
@@ -1137,7 +1137,7 @@ static int dvb_get_stc(struct dmx_demux *demux, unsigned int num,
 
 static int av7110_set_tone(struct dvb_frontend* fe, fe_sec_tone_mode_t tone)
 {
-	struct av7110* av7110 = (struct av7110*) fe->dvb->priv;
+	struct av7110* av7110 = fe->dvb->priv;
 
 	switch (tone) {
 	case SEC_TONE_ON:
@@ -1197,7 +1197,7 @@ static int start_ts_capture(struct av7110 *budget)
 static int budget_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
-	struct av7110 *budget = (struct av7110 *) demux->priv;
+	struct av7110 *budget = demux->priv;
 	int status;
 
 	dprintk(2, "av7110: %p\n", budget);
@@ -1212,7 +1212,7 @@ static int budget_start_feed(struct dvb_demux_feed *feed)
 static int budget_stop_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
-	struct av7110 *budget = (struct av7110 *) demux->priv;
+	struct av7110 *budget = demux->priv;
 	int status;
 
 	dprintk(2, "budget: %p\n", budget);
@@ -1551,7 +1551,7 @@ static int get_firmware(struct av7110* av7110)
 
 static int alps_bsrv2_tuner_set_params(struct dvb_frontend* fe, struct dvb_frontend_parameters *params)
 {
-	struct av7110* av7110 = (struct av7110*) fe->dvb->priv;
+	struct av7110* av7110 = fe->dvb->priv;
 	u8 pwr = 0;
 	u8 buf[4];
 	struct i2c_msg msg = { .addr = 0x61, .flags = 0, .buf = buf, .len = sizeof(buf) };
@@ -1702,7 +1702,7 @@ static int alps_tdlb7_tuner_set_params(struct dvb_frontend* fe, struct dvb_front
 static int alps_tdlb7_request_firmware(struct dvb_frontend* fe, const struct firmware **fw, char* name)
 {
 #if defined(CONFIG_DVB_SP8870) || defined(CONFIG_DVB_SP8870_MODULE)
-	struct av7110* av7110 = (struct av7110*) fe->dvb->priv;
+	struct av7110* av7110 = fe->dvb->priv;
 
 	return request_firmware(fw, name, &av7110->dev->pci->dev);
 #else
@@ -1867,7 +1867,7 @@ static struct stv0297_config nexusca_stv0297_config = {
 
 static int grundig_29504_401_tuner_set_params(struct dvb_frontend* fe, struct dvb_frontend_parameters *params)
 {
-	struct av7110* av7110 = (struct av7110*) fe->dvb->priv;
+	struct av7110* av7110 = fe->dvb->priv;
 	u32 div;
 	u8 cfg, cpump, band_select;
 	u8 data[4];
diff --git a/drivers/media/dvb/ttpci/av7110_av.c b/drivers/media/dvb/ttpci/av7110_av.c
index 8c577cf..c8665e5 100644
--- a/drivers/media/dvb/ttpci/av7110_av.c
+++ b/drivers/media/dvb/ttpci/av7110_av.c
@@ -881,8 +881,8 @@ static int dvb_video_get_event (struct av7110 *av7110, struct video_event *event
 
 static unsigned int dvb_video_poll(struct file *file, poll_table *wait)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	unsigned int mask = 0;
 
 	dprintk(2, "av7110:%p, \n", av7110);
@@ -909,8 +909,8 @@ static unsigned int dvb_video_poll(struct file *file, poll_table *wait)
 static ssize_t dvb_video_write(struct file *file, const char __user *buf,
 			       size_t count, loff_t *ppos)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 
 	dprintk(2, "av7110:%p, \n", av7110);
 
@@ -925,8 +925,8 @@ static ssize_t dvb_video_write(struct file *file, const char __user *buf,
 
 static unsigned int dvb_audio_poll(struct file *file, poll_table *wait)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	unsigned int mask = 0;
 
 	dprintk(2, "av7110:%p, \n", av7110);
@@ -945,8 +945,8 @@ static unsigned int dvb_audio_poll(struct file *file, poll_table *wait)
 static ssize_t dvb_audio_write(struct file *file, const char __user *buf,
 			       size_t count, loff_t *ppos)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 
 	dprintk(2, "av7110:%p, \n", av7110);
 
@@ -990,8 +990,8 @@ static int play_iframe(struct av7110 *av7110, u8 __user *buf, unsigned int len,
 static int dvb_video_ioctl(struct inode *inode, struct file *file,
 			   unsigned int cmd, void *parg)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	unsigned long arg = (unsigned long) parg;
 	int ret = 0;
 
@@ -1204,8 +1204,8 @@ static int dvb_video_ioctl(struct inode *inode, struct file *file,
 static int dvb_audio_ioctl(struct inode *inode, struct file *file,
 			   unsigned int cmd, void *parg)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	unsigned long arg = (unsigned long) parg;
 	int ret = 0;
 
@@ -1350,8 +1350,8 @@ static int dvb_audio_ioctl(struct inode *inode, struct file *file,
 
 static int dvb_video_open(struct inode *inode, struct file *file)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	int err;
 
 	dprintk(2, "av7110:%p, \n", av7110);
@@ -1375,8 +1375,8 @@ static int dvb_video_open(struct inode *inode, struct file *file)
 
 static int dvb_video_release(struct inode *inode, struct file *file)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 
 	dprintk(2, "av7110:%p, \n", av7110);
 
@@ -1389,9 +1389,9 @@ static int dvb_video_release(struct inode *inode, struct file *file)
 
 static int dvb_audio_open(struct inode *inode, struct file *file)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
-	int err=dvb_generic_open(inode, file);
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
+	int err = dvb_generic_open(inode, file);
 
 	dprintk(2, "av7110:%p, \n", av7110);
 
@@ -1404,8 +1404,8 @@ static int dvb_audio_open(struct inode *inode, struct file *file)
 
 static int dvb_audio_release(struct inode *inode, struct file *file)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 
 	dprintk(2, "av7110:%p, \n", av7110);
 
diff --git a/drivers/media/dvb/ttpci/av7110_ca.c b/drivers/media/dvb/ttpci/av7110_ca.c
index dd9aee3..c2b5789 100644
--- a/drivers/media/dvb/ttpci/av7110_ca.c
+++ b/drivers/media/dvb/ttpci/av7110_ca.c
@@ -215,8 +215,8 @@ static ssize_t ci_ll_read(struct dvb_ringbuffer *cibuf, struct file *file,
 
 static int dvb_ca_open(struct inode *inode, struct file *file)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	int err = dvb_generic_open(inode, file);
 
 	dprintk(8, "av7110:%p\n",av7110);
@@ -229,8 +229,8 @@ static int dvb_ca_open(struct inode *inode, struct file *file)
 
 static unsigned int dvb_ca_poll (struct file *file, poll_table *wait)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	struct dvb_ringbuffer *rbuf = &av7110->ci_rbuffer;
 	struct dvb_ringbuffer *wbuf = &av7110->ci_wbuffer;
 	unsigned int mask = 0;
@@ -252,8 +252,8 @@ static unsigned int dvb_ca_poll (struct file *file, poll_table *wait)
 static int dvb_ca_ioctl(struct inode *inode, struct file *file,
 		 unsigned int cmd, void *parg)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 	unsigned long arg = (unsigned long) parg;
 
 	dprintk(8, "av7110:%p\n",av7110);
@@ -330,8 +330,8 @@ static int dvb_ca_ioctl(struct inode *inode, struct file *file,
 static ssize_t dvb_ca_write(struct file *file, const char __user *buf,
 			    size_t count, loff_t *ppos)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 
 	dprintk(8, "av7110:%p\n",av7110);
 	return ci_ll_write(&av7110->ci_wbuffer, file, buf, count, ppos);
@@ -340,15 +340,13 @@ static ssize_t dvb_ca_write(struct file *file, const char __user *buf,
 static ssize_t dvb_ca_read(struct file *file, char __user *buf,
 			   size_t count, loff_t *ppos)
 {
-	struct dvb_device *dvbdev = (struct dvb_device *) file->private_data;
-	struct av7110 *av7110 = (struct av7110 *) dvbdev->priv;
+	struct dvb_device *dvbdev = file->private_data;
+	struct av7110 *av7110 = dvbdev->priv;
 
 	dprintk(8, "av7110:%p\n",av7110);
 	return ci_ll_read(&av7110->ci_rbuffer, file, buf, count, ppos);
 }
 
-
-
 static struct file_operations dvb_ca_fops = {
 	.owner		= THIS_MODULE,
 	.read		= dvb_ca_read,
-- 
1.4.4.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
