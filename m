From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:19:36 +0000
Subject: [KJ] [PATCH 12/21] polling loops: change exit condition to
Message-Id: <43923618.8070002@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

BTTV VIDEO4LINUX DRIVER
P:	Mauro Carvalho Chehab
M:	mchehab@brturbo.com.br

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/video/bttv-driver.c linux-2.6.15-rc4/drivers/media/video/bttv-driver.c
--- linux-2.6.15-rc4-orig/drivers/media/video/bttv-driver.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/video/bttv-driver.c	2005-12-03 16:53:10.000000000 +0100
@@ -749,10 +749,10 @@ static void set_pll_freq(struct bttv *bt
 
 static void set_pll(struct bttv *btv)
 {
-        int i;
+	unsigned long end_time;
 
-        if (!btv->pll.pll_crystal)
-                return;
+	if (!btv->pll.pll_crystal)
+		return;
 
 	if (btv->pll.pll_ofreq = btv->pll.pll_current) {
 		dprintk("bttv%d: PLL: no change required\n",btv->c.nr);
@@ -775,23 +775,24 @@ static void set_pll(struct bttv *btv)
                    btv->pll.pll_ifreq, btv->pll.pll_ofreq);
 	set_pll_freq(btv, btv->pll.pll_ifreq, btv->pll.pll_ofreq);
 
-        for (i=0; i<10; i++) {
+	end_time = jiffies + msecs_to_jiffies(100);
+	while (time_before(jiffies, end_time)) {
 		/*  Let other people run while the PLL stabilizes */
 		bttv_printk(".");
 		msleep(10);
 
-                if (btread(BT848_DSTATUS) & BT848_DSTATUS_PLOCK) {
+		if (btread(BT848_DSTATUS) & BT848_DSTATUS_PLOCK) {
 			btwrite(0,BT848_DSTATUS);
-                } else {
-                        btwrite(0x08,BT848_TGCTRL);
-                        btv->pll.pll_current = btv->pll.pll_ofreq;
+		} else {
+			btwrite(0x08,BT848_TGCTRL);
+			btv->pll.pll_current = btv->pll.pll_ofreq;
 			bttv_printk(" ok\n");
-                        return;
-                }
-        }
-        btv->pll.pll_current = -1;
+			return;
+		}
+	}
+	btv->pll.pll_current = -1;
 	bttv_printk("failed\n");
-        return;
+	return;
 }
 
 /* used to switch between the bt848's analog/digital video capture modes */
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/video/cpia.c linux-2.6.15-rc4/drivers/media/video/cpia.c
--- linux-2.6.15-rc4-orig/drivers/media/video/cpia.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/video/cpia.c	2005-12-03 16:53:10.000000000 +0100
@@ -194,9 +194,6 @@ enum {
 #define DARK_TIME       3
 #define LIGHT_TIME      3
 
-/* Maximum number of 10ms loops to wait for the stream to become ready */
-#define READY_TIMEOUT 100
-
 /* Developer's Guide Table 5 p 3-34
  * indexed by [mains][sensorFps.baserate][sensorFps.divisor]*/
 static u8 flicker_jumps[2][2][4] @@ -2830,6 +2827,7 @@ static int fetch_frame(void *data)
 	int image_size, retry;
 	struct cam_data *cam = (struct cam_data *)data;
 	unsigned long oldjif, rate, diff;
+	unsigned long end_time;
 
 	/* Allow up to two bad images in a row to be read and
 	 * ignored before an error is reported */
@@ -2858,10 +2856,10 @@ static int fetch_frame(void *data)
 
 		if (cam->ops->wait_for_stream_ready) {
 			/* loop until image ready */
-			int count = 0;
 			do_command(cam, CPIA_COMMAND_GetCameraStatus,0,0,0,0);
+			end_time = jiffies + msecs_to_jiffies(1000);
 			while (cam->params.status.streamState != STREAM_READY) {
-				if(++count > READY_TIMEOUT)
+				if (time_after(jiffies, end_time))
 					break;
 				if(cam->params.status.streamState =
 				   STREAM_PAUSED) {
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/video/c-qcam.c linux-2.6.15-rc4/drivers/media/video/c-qcam.c
--- linux-2.6.15-rc4-orig/drivers/media/video/c-qcam.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/video/c-qcam.c	2005-12-03 16:53:10.000000000 +0100
@@ -91,7 +91,7 @@ static unsigned int qcam_await_ready1(st
 					     int value)
 {
 	unsigned long oldjiffies = jiffies;
-	unsigned int i;
+	unsigned long end_time;
 
 	for (oldjiffies = jiffies; (jiffies - oldjiffies) < (HZ/25); )
 		if (qcam_ready1(qcam) = value)
@@ -99,7 +99,8 @@ static unsigned int qcam_await_ready1(st
 
 	/* If the camera didn't respond within 1/25 second, poll slowly 
 	   for a while. */
-	for (i = 0; i < 50; i++)
+	end_time = jiffies + msecs_to_jiffies(5000);
+	while (time_before(jiffies, end_time))
 	{
 		if (qcam_ready1(qcam) = value)
 			return 0;
@@ -116,7 +117,7 @@ static unsigned int qcam_await_ready1(st
 static unsigned int qcam_await_ready2(struct qcam_device *qcam, int value)
 {
 	unsigned long oldjiffies = jiffies;
-	unsigned int i;
+	unsigned long end_time;
 
 	for (oldjiffies = jiffies; (jiffies - oldjiffies) < (HZ/25); )
 		if (qcam_ready2(qcam) = value)
@@ -124,7 +125,8 @@ static unsigned int qcam_await_ready2(st
 
 	/* If the camera didn't respond within 1/25 second, poll slowly 
 	   for a while. */
-	for (i = 0; i < 50; i++)
+	end_time = jiffies + msecs_to_jiffies(5000);
+	while (time_before(jiffies, end_time))
 	{
 		if (qcam_ready2(qcam) = value)
 			return 0;
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/video/cx88/cx88-core.c linux-2.6.15-rc4/drivers/media/video/cx88/cx88-core.c
--- linux-2.6.15-rc4-orig/drivers/media/video/cx88/cx88-core.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/video/cx88/cx88-core.c	2005-12-03 16:53:10.000000000 +0100
@@ -805,7 +805,7 @@ static int set_pll(struct cx88_core *cor
 	static u32 pre[] = { 0, 0, 0, 3, 2, 1 };
 	u64 pll;
 	u32 reg;
-	int i;
+	unsigned long end_time;
 
 	if (prescale < 2)
 		prescale = 2;
@@ -823,7 +823,9 @@ static int set_pll(struct cx88_core *cor
 	dprintk(1,"set_pll:    MO_PLL_REG       0x%08x [old=0x%08x,freq=%d]\n",
 		reg, cx_read(MO_PLL_REG), ofreq);
 	cx_write(MO_PLL_REG, reg);
-	for (i = 0; i < 100; i++) {
+
+	end_time = jiffies + msecs_to_jiffies(1000);
+	while (time_before(jiffies, end_time)) {
 		reg = cx_read(MO_DEVICE_STATUS);
 		if (reg & (1<<2)) {
 			dprintk(1,"pll locked [pre=%d,ofreq=%d]\n",
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/media/video/meye.c linux-2.6.15-rc4/drivers/media/video/meye.c
--- linux-2.6.15-rc4-orig/drivers/media/video/meye.c	2005-11-20 16:53:15.000000000 +0100
+++ linux-2.6.15-rc4/drivers/media/video/meye.c	2005-12-03 16:53:10.000000000 +0100
@@ -558,15 +558,19 @@ static void mchip_dma_free(void)
    reset the dma engine */
 static void mchip_hic_stop(void)
 {
-	int i, j;
+	unsigned long end_time, end_time2;
 
 	meye.mchip_mode = MCHIP_HIC_MODE_NOOP;
 	if (!(mchip_read(MCHIP_HIC_STATUS) & MCHIP_HIC_STATUS_BUSY))
 		return;
-	for (i = 0; i < 20; ++i) {
+
+	end_time = jiffies + msecs_to_jiffies(7000);
+	while (time_before(jiffies, end_time)) {
 		mchip_set(MCHIP_HIC_CMD, MCHIP_HIC_CMD_STOP);
 		mchip_delay(MCHIP_HIC_CMD, 0);
-		for (j = 0; j < 100; ++j) {
+
+		end_time2 = jiffies + msecs_to_jiffies(100);
+		while (time_before(jiffies, end_time2)) {
 			if (mchip_delay(MCHIP_HIC_STATUS,
 					MCHIP_HIC_STATUS_IDLE))
 				return;
@@ -660,7 +664,7 @@ static int mchip_comp_read_frame(u32 v, 
 /* take a picture into SDRAM */
 static void mchip_take_picture(void)
 {
-	int i;
+	unsigned long end_time;
 
 	mchip_hic_stop();
 	mchip_subsample();
@@ -671,7 +675,8 @@ static void mchip_take_picture(void)
 
 	mchip_delay(MCHIP_HIC_CMD, 0);
 
-	for (i = 0; i < 100; ++i) {
+	end_time = jiffies + msecs_to_jiffies(100);
+	while (time_before(jiffies, end_time)) {
 		if (mchip_delay(MCHIP_HIC_STATUS, MCHIP_HIC_STATUS_IDLE))
 			break;
 		msleep(1);
@@ -683,12 +688,14 @@ static void mchip_get_picture(u8 *buf, i
 {
 	u32 v;
 	int i;
+	unsigned long end_time;
 
 	mchip_set(MCHIP_HIC_MODE, MCHIP_HIC_MODE_STILL_OUT);
 	mchip_set(MCHIP_HIC_CMD, MCHIP_HIC_CMD_START);
 
 	mchip_delay(MCHIP_HIC_CMD, 0);
-	for (i = 0; i < 100; ++i) {
+	end_time = jiffies + msecs_to_jiffies(100);
+	while (time_before(jiffies, end_time)) {
 		if (mchip_delay(MCHIP_HIC_STATUS, MCHIP_HIC_STATUS_IDLE))
 			break;
 		msleep(1);
@@ -724,6 +731,7 @@ static int mchip_compress_frame(u8 *buf,
 {
 	u32 v;
 	int len = -1, i;
+	unsigned long end_time;
 
 	mchip_vrj_setup(0x3f);
 	udelay(50);
@@ -732,7 +740,9 @@ static int mchip_compress_frame(u8 *buf,
 	mchip_set(MCHIP_HIC_CMD, MCHIP_HIC_CMD_START);
 
 	mchip_delay(MCHIP_HIC_CMD, 0);
-	for (i = 0; i < 100; ++i) {
+
+	end_time = jiffies + msecs_to_jiffies(100);
+	while (time_before(jiffies, end_time)) {
 		if (mchip_delay(MCHIP_HIC_STATUS, MCHIP_HIC_STATUS_IDLE))
 			break;
 		msleep(1);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
