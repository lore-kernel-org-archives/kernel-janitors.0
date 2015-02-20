From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Fri, 20 Feb 2015 21:34:09 +0000
Subject: [PATCH] [RFC] drivers/staging/fbtft: fix sparse warnings
Message-Id: <1424468049-24525-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-mentors@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: thomas.petazzoni@free-electrons.com, noralf@tronnes.org, gregkh@linuxfoundation.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>

See below how sparse output changed with these changes.
In few words:
- fixed printf specifiers for size_t;
- trying to fix address space specifiers issues, not sure what's correct approach, ASKING FOR COMMENTS AND HELP;
- didn't touch "was not declared. Should it be static?" yet.

-drivers/staging/fbtft/fbtft-core.c: In function ‘fbtft_register_framebuffer’:
-drivers/staging/fbtft/fbtft-core.c:1004:4: warning: format ‘%d’ expects argument of type ‘int’, but argument 3 has type ‘size_t’ [-Wformat=]
-drivers/staging/fbtft/fbtft-io.c: In function ‘fbtft_write_spi_emulate_9’:
-drivers/staging/fbtft/fbtft-io.c:63:4: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has type ‘size_t’ [-Wformat=]
-drivers/staging/fbtft/fbtft-io.c: In function ‘fbtft_read_spi’:
-drivers/staging/fbtft/fbtft-io.c:110:5: warning: format ‘%d’ expects argument of type ‘int’, but argument 4 has type ‘size_t’ [-Wformat=]
-drivers/staging/fbtft/fbtft-core.c:928:19: warning: incorrect type in argument 1 (different address spaces)
-drivers/staging/fbtft/fbtft-core.c:928:19:    expected void const *addr
-drivers/staging/fbtft/fbtft-core.c:928:19:    got char [noderef] <asn:2>*screen_base
 drivers/staging/fbtft/fbtft-sysfs.c:24:5: warning: symbol 'fbtft_gamma_parse_str' was not declared. Should it be static?
 drivers/staging/fbtft/fbtft-sysfs.c:154:6: warning: symbol 'fbtft_expand_debug_value' was not declared. Should it be static?
 drivers/staging/fbtft/fbtft-sysfs.c:210:6: warning: symbol 'fbtft_sysfs_init' was not declared. Should it be static?
 drivers/staging/fbtft/fbtft-sysfs.c:217:6: warning: symbol 'fbtft_sysfs_exit' was not declared. Should it be static?
-drivers/staging/fbtft/fbtft-bus.c:145:19: warning: cast removes address space of expression
-drivers/staging/fbtft/fbtft-bus.c:204:15: warning: incorrect type in assignment (different address spaces)
-drivers/staging/fbtft/fbtft-bus.c:204:15:    expected unsigned char [usertype] *vmem8
-drivers/staging/fbtft/fbtft-bus.c:204:15:    got char [noderef] <asn:2>*
-drivers/staging/fbtft/fbtft-bus.c:248:19: warning: cast removes address space of expression
-drivers/staging/fbtft/fb_agm1264k-fl.c:276:24: warning: cast removes address space of expression
+drivers/staging/fbtft/fbtft-bus.c:152:49: warning: incorrect type in argument 2 (different address spaces)
+drivers/staging/fbtft/fbtft-bus.c:152:49:    expected void *buf
+drivers/staging/fbtft/fbtft-bus.c:152:49:    got unsigned short [noderef] [usertype] <asn:2>*[assigned] vmem16
+drivers/staging/fbtft/fbtft-bus.c:254:41: warning: incorrect type in argument 2 (different address spaces)
+drivers/staging/fbtft/fbtft-bus.c:254:41:    expected void *buf
+drivers/staging/fbtft/fbtft-bus.c:254:41:    got unsigned short [noderef] [usertype] <asn:2>*[assigned] vmem16
+drivers/staging/fbtft/fbtft-core.c:928:16: warning: cast removes address space of expression
 drivers/staging/fbtft/fb_hx8340bn.c:111:6: warning: symbol 'set_addr_win' was not declared. Should it be static?
-drivers/staging/fbtft/fb_pcd8544.c:113:24: warning: cast removes address space of expression
-drivers/staging/fbtft/fb_ra8875.c:286:19: warning: cast removes address space of expression
-drivers/staging/fbtft/fb_ssd1306.c:175:24: warning: cast removes address space of expression
-drivers/staging/fbtft/fb_tls8204.c:102:24: warning: cast removes address space of expression
-drivers/staging/fbtft/fb_uc1701.c:153:24: warning: cast removes address space of expression
-drivers/staging/fbtft/fb_watterott.c:76:24: warning: cast removes address space of expression
+drivers/staging/fbtft/fb_uc1701.c:153:32: warning: cast removes address space of expression
+drivers/staging/fbtft/fb_uc1701.c:153:32: warning: incorrect type in initializer (different address spaces)
+drivers/staging/fbtft/fb_uc1701.c:153:32:    expected unsigned short [noderef] [usertype] <asn:2>*vmem16
+drivers/staging/fbtft/fb_uc1701.c:153:32:    got unsigned short [usertype] *<noident>
+drivers/staging/fbtft/fb_watterott.c:76:32: warning: cast removes address space of expression
+drivers/staging/fbtft/fb_watterott.c:76:32: warning: incorrect type in initializer (different address spaces)
+drivers/staging/fbtft/fb_watterott.c:76:32:    expected unsigned short [noderef] [usertype] <asn:2>*vmem16
+drivers/staging/fbtft/fb_watterott.c:76:32:    got unsigned short [usertype] *<noident>
 drivers/staging/fbtft/fb_watterott.c:115:24: warning: cast removes address space of expression
 drivers/staging/fbtft/fbtft_device.c:32:19: warning: symbol 'spi_device' was not declared. Should it be static?
 drivers/staging/fbtft/fbtft_device.c:33:24: warning: symbol 'p_device' was not declared. Should it be static?

This is for Eudyptulla challenge. If you want me to help with any other staging driver, I am open.

Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/staging/fbtft/fb_agm1264k-fl.c |  4 ++--
 drivers/staging/fbtft/fb_pcd8544.c     |  4 ++--
 drivers/staging/fbtft/fb_ra8875.c      |  6 +++---
 drivers/staging/fbtft/fb_ssd1306.c     |  4 ++--
 drivers/staging/fbtft/fb_tls8204.c     |  4 ++--
 drivers/staging/fbtft/fb_uc1701.c      |  4 ++--
 drivers/staging/fbtft/fb_watterott.c   |  4 ++--
 drivers/staging/fbtft/fbtft-bus.c      | 18 +++++++++---------
 drivers/staging/fbtft/fbtft-core.c     |  4 ++--
 drivers/staging/fbtft/fbtft-io.c       |  4 ++--
 10 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index 9cc7d25..9114239 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -273,7 +273,7 @@ construct_line_bitmap(struct fbtft_par *par, u8 *dest, signed short *src,
 
 static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16 = (u16 *)par->info->screen_base;
+	u16 __iomem *vmem16 = (u16 __iomem *)par->info->screen_base;
 	u8 *buf = par->txbuf.buf;
 	int x, y;
 	int ret = 0;
@@ -287,7 +287,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 	/* converting to grayscale16 */
 	for (x = 0; x < par->info->var.xres; ++x)
 		for (y = 0; y < par->info->var.yres; ++y) {
-			u16 pixel = vmem16[y *  par->info->var.xres + x];
+			u16 pixel = ioread16(vmem16 + y *  par->info->var.xres + x);
 			u16 b = pixel & 0x1f;
 			u16 g = (pixel & (0x3f << 5)) >> 5;
 			u16 r = (pixel & (0x1f << (5 + 6))) >> (5 + 6);
diff --git a/drivers/staging/fbtft/fb_pcd8544.c b/drivers/staging/fbtft/fb_pcd8544.c
index 8b9ebfb..136ce70 100644
--- a/drivers/staging/fbtft/fb_pcd8544.c
+++ b/drivers/staging/fbtft/fb_pcd8544.c
@@ -110,7 +110,7 @@ static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
 
 static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16 = (u16 *)par->info->screen_base;
+	u16 __iomem *vmem16 = (u16 __iomem *)par->info->screen_base;
 	u8 *buf = par->txbuf.buf;
 	int x, y, i;
 	int ret = 0;
@@ -121,7 +121,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 		for (y = 0; y < 6; y++) {
 			*buf = 0x00;
 			for (i = 0; i < 8; i++) {
-				*buf |= (vmem16[(y*8+i)*84+x] ? 1 : 0) << i;
+				*buf |= (ioread16(vmem16 + (y*8+i)*84+x) ? 1 : 0) << i;
 			}
 			buf++;
 		}
diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index c323c06..c5a3b96 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -270,7 +270,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16;
+	u16 __iomem *vmem16;
 	u16 *txbuf16 = (u16 *)par->txbuf.buf;
 	size_t remain;
 	size_t to_copy;
@@ -283,7 +283,7 @@ static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 		__func__, offset, len);
 
 	remain = len / 2;
-	vmem16 = (u16 *)(par->info->screen_base + offset);
+	vmem16 = (u16 __iomem *)(par->info->screen_base + offset);
 	tx_array_size = par->txbuf.len / 2;
 		txbuf16 = (u16 *)(par->txbuf.buf + 1);
 		tx_array_size -= 2;
@@ -296,7 +296,7 @@ static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 			to_copy, remain - to_copy);
 
 		for (i = 0; i < to_copy; i++)
-			txbuf16[i] = cpu_to_be16(vmem16[i]);
+			txbuf16[i] = cpu_to_be16(ioread16(vmem16 + i));
 
 		vmem16 = vmem16 + to_copy;
 		ret = par->fbtftops.write(par, par->txbuf.buf,
diff --git a/drivers/staging/fbtft/fb_ssd1306.c b/drivers/staging/fbtft/fb_ssd1306.c
index 5ea195b..8874b9f 100644
--- a/drivers/staging/fbtft/fb_ssd1306.c
+++ b/drivers/staging/fbtft/fb_ssd1306.c
@@ -172,7 +172,7 @@ static int set_gamma(struct fbtft_par *par, unsigned long *curves)
 
 static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16 = (u16 *)par->info->screen_base;
+	u16 __iomem *vmem16 = (u16 __iomem *)par->info->screen_base;
 	u8 *buf = par->txbuf.buf;
 	int x, y, i;
 	int ret = 0;
@@ -183,7 +183,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 		for (y = 0; y < par->info->var.yres/8; y++) {
 			*buf = 0x00;
 			for (i = 0; i < 8; i++)
-				*buf |= (vmem16[(y*8+i)*par->info->var.xres+x] ? 1 : 0) << i;
+				*buf |= (ioread16(vmem16 + (y*8+i)*par->info->var.xres+x) ? 1 : 0) << i;
 			buf++;
 		}
 	}
diff --git a/drivers/staging/fbtft/fb_tls8204.c b/drivers/staging/fbtft/fb_tls8204.c
index 8738c7a..e52b904 100644
--- a/drivers/staging/fbtft/fb_tls8204.c
+++ b/drivers/staging/fbtft/fb_tls8204.c
@@ -99,7 +99,7 @@ static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
 
 static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16 = (u16 *)par->info->screen_base;
+	u16 __iomem *vmem16 = (u16 __iomem *)par->info->screen_base;
 	int x, y, i;
 	int ret = 0;
 
@@ -117,7 +117,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 			u8 ch = 0;
 			for (i = 0; i < 8*WIDTH; i += WIDTH) {
 				ch >>= 1;
-				if (vmem16[(y*8*WIDTH)+i+x])
+				if (ioread16(vmem16 + (y*8*WIDTH)+i+x))
 					ch |= 0x80;
 			}
 			*buf++ = ch;
diff --git a/drivers/staging/fbtft/fb_uc1701.c b/drivers/staging/fbtft/fb_uc1701.c
index d70ac52..d3c7e22 100644
--- a/drivers/staging/fbtft/fb_uc1701.c
+++ b/drivers/staging/fbtft/fb_uc1701.c
@@ -150,7 +150,7 @@ static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
 
 static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16 = (u16 *)par->info->screen_base;
+	u16 __iomem *vmem16 = (u16 *)par->info->screen_base;
 	u8 *buf = par->txbuf.buf;
 	int x, y, i;
 	int ret = 0;
@@ -162,7 +162,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 		for (x = 0; x < WIDTH; x++) {
 			*buf = 0x00;
 			for (i = 0; i < 8; i++)
-				*buf |= (vmem16[((y*8*WIDTH)+(i*WIDTH))+x] ? 1 : 0) << i;
+				*buf |= (ioread16(vmem16 + ((y*8*WIDTH)+(i*WIDTH))+x) ? 1 : 0) << i;
 			buf++;
 		}
 		/* LCD_PAGE_ADDRESS | ((page) & 0x1F),
diff --git a/drivers/staging/fbtft/fb_watterott.c b/drivers/staging/fbtft/fb_watterott.c
index 975b579..1792887 100644
--- a/drivers/staging/fbtft/fb_watterott.c
+++ b/drivers/staging/fbtft/fb_watterott.c
@@ -73,7 +73,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 {
 	unsigned start_line, end_line;
-	u16 *vmem16 = (u16 *)(par->info->screen_base + offset);
+	u16 __iomem *vmem16 = (u16 *)(par->info->screen_base + offset);
 	u16 *pos = par->txbuf.buf + 1;
 	u16 *buf16 = par->txbuf.buf + 10;
 	int i, j;
@@ -94,7 +94,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 	for (i = start_line; i <= end_line; i++) {
 		pos[1] = cpu_to_be16(i);
 		for (j = 0; j < par->info->var.xres; j++)
-			buf16[j] = cpu_to_be16(*vmem16++);
+			buf16[j] = cpu_to_be16(ioread16(vmem16++));
 		ret = par->fbtftops.write(par,
 			par->txbuf.buf, 10 + par->info->fix.line_length);
 		if (ret < 0)
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index b3cddb0..7613fd9 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -129,7 +129,7 @@ EXPORT_SYMBOL(fbtft_write_reg8_bus9);
 /* 16 bit pixel over 8-bit databus */
 int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16;
+	u16 __iomem *vmem16;
 	u16 *txbuf16 = (u16 *)par->txbuf.buf;
 	size_t remain;
 	size_t to_copy;
@@ -142,7 +142,7 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 		__func__, offset, len);
 
 	remain = len / 2;
-	vmem16 = (u16 *)(par->info->screen_base + offset);
+	vmem16 = (u16 __iomem *)(par->info->screen_base + offset);
 
 	if (par->gpio.dc != -1)
 		gpio_set_value(par->gpio.dc, 1);
@@ -167,7 +167,7 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 						to_copy, remain - to_copy);
 
 		for (i = 0; i < to_copy; i++)
-			txbuf16[i] = cpu_to_be16(vmem16[i]);
+			txbuf16[i] = cpu_to_be16(ioread16(vmem16 + i));
 
 		vmem16 = vmem16 + to_copy;
 		ret = par->fbtftops.write(par, par->txbuf.buf,
@@ -184,7 +184,7 @@ EXPORT_SYMBOL(fbtft_write_vmem16_bus8);
 /* 16 bit pixel over 9-bit SPI bus: dc + high byte, dc + low byte */
 int fbtft_write_vmem16_bus9(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u8 *vmem8;
+	u8 __iomem *vmem8;
 	u16 *txbuf16 = par->txbuf.buf;
 	size_t remain;
 	size_t to_copy;
@@ -212,12 +212,12 @@ int fbtft_write_vmem16_bus9(struct fbtft_par *par, size_t offset, size_t len)
 
 #ifdef __LITTLE_ENDIAN
 		for (i = 0; i < to_copy; i += 2) {
-			txbuf16[i]   = 0x0100 | vmem8[i+1];
-			txbuf16[i+1] = 0x0100 | vmem8[i];
+			txbuf16[i]   = 0x0100 | ioread8(vmem8 + i+1);
+			txbuf16[i+1] = 0x0100 | ioread8(vmem8 + i);
 		}
 #else
 		for (i = 0; i < to_copy; i++)
-			txbuf16[i]   = 0x0100 | vmem8[i];
+			txbuf16[i]   = 0x0100 | ioread8(vmem8 + i);
 #endif
 		vmem8 = vmem8 + to_copy;
 		ret = par->fbtftops.write(par, par->txbuf.buf, to_copy*2);
@@ -240,12 +240,12 @@ EXPORT_SYMBOL(fbtft_write_vmem8_bus8);
 /* 16 bit pixel over 16-bit databus */
 int fbtft_write_vmem16_bus16(struct fbtft_par *par, size_t offset, size_t len)
 {
-	u16 *vmem16;
+	u16 __iomem *vmem16;
 
 	fbtft_par_dbg(DEBUG_WRITE_VMEM, par, "%s(offset=%zu, len=%zu)\n",
 		__func__, offset, len);
 
-	vmem16 = (u16 *)(par->info->screen_base + offset);
+	vmem16 = (u16 __iomem *)(par->info->screen_base + offset);
 
 	if (par->gpio.dc != -1)
 		gpio_set_value(par->gpio.dc, 1);
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 37dcf7e..e96a7c1 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -925,7 +925,7 @@ EXPORT_SYMBOL(fbtft_framebuffer_alloc);
 void fbtft_framebuffer_release(struct fb_info *info)
 {
 	fb_deferred_io_cleanup(info);
-	vfree(info->screen_base);
+	vfree((void *)info->screen_base);
 	framebuffer_release(info);
 }
 EXPORT_SYMBOL(fbtft_framebuffer_release);
@@ -1000,7 +1000,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	fbtft_sysfs_init(par);
 
 	if (par->txbuf.buf)
-		sprintf(text1, ", %d KiB %sbuffer memory",
+		sprintf(text1, ", %zd KiB %sbuffer memory",
 			par->txbuf.len >> 10, par->txbuf.dma ? "DMA " : "");
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->master->bus_num,
diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
index 32155a7..df198d0 100644
--- a/drivers/staging/fbtft/fbtft-io.c
+++ b/drivers/staging/fbtft/fbtft-io.c
@@ -59,7 +59,7 @@ int fbtft_write_spi_emulate_9(struct fbtft_par *par, void *buf, size_t len)
 	}
 	if ((len % 8) != 0) {
 		dev_err(par->info->device,
-			"%s: error: len=%d must be divisible by 8\n",
+			"%s: error: len=%zd must be divisible by 8\n",
 			__func__, len);
 		return -EINVAL;
 	}
@@ -106,7 +106,7 @@ int fbtft_read_spi(struct fbtft_par *par, void *buf, size_t len)
 	if (par->startbyte) {
 		if (len > 32) {
 			dev_err(par->info->device,
-				"%s: len=%d can't be larger than 32 when using 'startbyte'\n",
+				"%s: len=%zd can't be larger than 32 when using 'startbyte'\n",
 				__func__, len);
 			return -EINVAL;
 		}
-- 
2.2.0

