From: Ricardo Martins <ricardo@scarybox.net>
Date: Sat, 10 May 2008 21:57:20 +0000
Subject: [PATCH 1/1] Trivial: Replacement of always >0 ints with unsigned ints
Message-Id: <1210456640-1716-1-git-send-email-ricardo@scarybox.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

This patch replaces a few int variables in drivers/video/nvidia that are
always either positive or zero (mostly loop counters), as suggested by
Jeff Garzik in [1]:

  2) "unsigned int" is preferred to "int", it generates better asm code
  on all platforms except sh5. This replacement needs to be done manually,
  because often 'int' is required due to negative values -Exxx commonly
  passed as error values.

[1] http://kernelnewbies.org/KernelJanitors/Todo

Signed-off-by: Ricardo Martins <ricardo@scarybox.net>
---
 drivers/video/nvidia/nv_accel.c |    8 ++++----
 drivers/video/nvidia/nv_i2c.c   |    2 +-
 drivers/video/nvidia/nv_of.c    |    4 ++--
 drivers/video/nvidia/nv_setup.c |    2 +-
 drivers/video/nvidia/nvidia.c   |   11 ++++++-----
 5 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/video/nvidia/nv_accel.c b/drivers/video/nvidia/nv_accel.c
index fa4821c..4223f9c 100644
--- a/drivers/video/nvidia/nv_accel.c
+++ b/drivers/video/nvidia/nv_accel.c
@@ -81,7 +81,7 @@ static inline void nvidiafb_safe_mode(struct fb_info *info)
 static inline void NVFlush(struct fb_info *info)
 {
 	struct nvidia_par *par = info->par;
-	int count = 1000000000;
+	unsigned int count = 1000000000;
 
 	while (--count && READ_GET(par) != par->dmaPut) ;
 
@@ -94,7 +94,7 @@ static inline void NVFlush(struct fb_info *info)
 static inline void NVSync(struct fb_info *info)
 {
 	struct nvidia_par *par = info->par;
-	int count = 1000000000;
+	unsigned int count = 1000000000;
 
 	while (--count && NV_RD32(par->PGRAPH, 0x0700)) ;
 
@@ -116,7 +116,7 @@ static void NVDmaWait(struct fb_info *info, int size)
 {
 	struct nvidia_par *par = info->par;
 	int dmaGet;
-	int count = 1000000000, cnt;
+	unsigned int count = 1000000000, cnt;
 	size++;
 
 	while (par->dmaFree < size && --count && !par->lockup) {
@@ -349,7 +349,7 @@ static void nvidiafb_mono_color_expand(struct fb_info *info,
 	struct nvidia_par *par = info->par;
 	u32 fg, bg, mask = ~(~0 >> (32 - info->var.bits_per_pixel));
 	u32 dsize, width, *data = (u32 *) image->data, tmp;
-	int j, k = 0;
+	unsigned int j, k = 0;
 
 	width = (image->width + 31) & ~31;
 	dsize = (width * image->height) >> 5;
diff --git a/drivers/video/nvidia/nv_i2c.c b/drivers/video/nvidia/nv_i2c.c
index 6fd7cb8..1e388a3 100644
--- a/drivers/video/nvidia/nv_i2c.c
+++ b/drivers/video/nvidia/nv_i2c.c
@@ -139,7 +139,7 @@ void nvidia_create_i2c_busses(struct nvidia_par *par)
 
 void nvidia_delete_i2c_busses(struct nvidia_par *par)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < 3; i++) {
 		if (!par->chan[i].par)
diff --git a/drivers/video/nvidia/nv_of.c b/drivers/video/nvidia/nv_of.c
index 73afd7e..1dea5a3 100644
--- a/drivers/video/nvidia/nv_of.c
+++ b/drivers/video/nvidia/nv_of.c
@@ -35,14 +35,14 @@ int nvidia_probe_of_connector(struct fb_info *info, int conn, u8 **out_edid)
 	static char *propnames[] = {
 		"DFP,EDID", "LCD,EDID", "EDID", "EDID1",
 		"EDID,B", "EDID,A", NULL };
-	int i;
+	unsigned int i;
 
 	parent = pci_device_to_OF_node(par->pci_dev);
 	if (parent = NULL)
 		return -1;
 	if (par->twoHeads) {
 		const char *pname;
-		int len;
+		unsigned int len;
 
 		for (dp = NULL;
 		     (dp = of_get_next_child(parent, dp)) != NULL;) {
diff --git a/drivers/video/nvidia/nv_setup.c b/drivers/video/nvidia/nv_setup.c
index d9627b5..b3c50d3 100644
--- a/drivers/video/nvidia/nv_setup.c
+++ b/drivers/video/nvidia/nv_setup.c
@@ -167,7 +167,7 @@ static int NVIsConnected(struct nvidia_par *par, int output)
 {
 	volatile u32 __iomem *PRAMDAC = par->PRAMDAC0;
 	u32 reg52C, reg608, dac0_reg608 = 0;
-	int present;
+	unsigned int present;
 
 	if (output) {
 	    dac0_reg608 = NV_RD32(PRAMDAC, 0x0608);
diff --git a/drivers/video/nvidia/nvidia.c b/drivers/video/nvidia/nvidia.c
index 9dbb5a5..c2547f2 100644
--- a/drivers/video/nvidia/nvidia.c
+++ b/drivers/video/nvidia/nvidia.c
@@ -227,7 +227,7 @@ static void nvidia_screen_off(struct nvidia_par *par, int on)
 static void nvidia_save_vga(struct nvidia_par *par,
 			    struct _riva_hw_state *state)
 {
-	int i;
+	unsigned int i;
 
 	NVTRACE_ENTER();
 	NVLockUnlock(par, 0);
@@ -255,7 +255,7 @@ static void nvidia_save_vga(struct nvidia_par *par,
 static void nvidia_write_regs(struct nvidia_par *par,
 			      struct _riva_hw_state *state)
 {
-	int i;
+	unsigned int i;
 
 	NVTRACE_ENTER();
 
@@ -504,7 +504,7 @@ static void nvidia_init_vga(struct fb_info *info)
 {
 	struct nvidia_par *par = info->par;
 	struct _riva_hw_state *state = &par->ModeReg;
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < 0x10; i++)
 		state->attr[i] = i;
@@ -539,7 +539,8 @@ static int nvidiafb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 {
 	struct nvidia_par *par = info->par;
 	u8 data[MAX_CURS * MAX_CURS / 8];
-	int i, set = cursor->set;
+	unsigned int i;
+	int set = cursor->set;
 	u16 fg, bg;
 
 	if (cursor->image.width > MAX_CURS || cursor->image.height > MAX_CURS)
@@ -708,7 +709,7 @@ static int nvidiafb_setcolreg(unsigned regno, unsigned red, unsigned green,
 			      struct fb_info *info)
 {
 	struct nvidia_par *par = info->par;
-	int i;
+	unsigned int i;
 
 	NVTRACE_ENTER();
 	if (regno >= (1 << info->var.green.length))
-- 
1.5.5.1

