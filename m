From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 05 Feb 2007 20:21:40 +0000
Subject: [KJ] [PATCH] Storage class should be before const qualifier
Message-Id: <20070205202140.GA12729@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the
beginning of the declaration specifiers in a declaration is an
obsolescent feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 arch/mips/kernel/machine_kexec.c                  |    4 ++--
 arch/powerpc/kernel/rtas.c                        |    2 +-
 arch/sh/kernel/cpu/sh2/clock-sh7619.c             |    4 ++--
 arch/sh/kernel/cpu/sh2a/clock-sh7206.c            |    4 ++--
 drivers/ieee1394/ohci1394.c                       |    2 +-
 drivers/input/serio/libps2.c                      |    2 +-
 drivers/media/video/pvrusb2/pvrusb2-audio.c       |    2 +-
 drivers/media/video/pvrusb2/pvrusb2-cx2584x-v4l.c |    2 +-
 drivers/media/video/pvrusb2/pvrusb2-std.c         |    4 ++--
 drivers/media/video/pvrusb2/pvrusb2-tuner.c       |    2 +-
 drivers/media/video/pvrusb2/pvrusb2-video-v4l.c   |    2 +-
 drivers/media/video/pvrusb2/pvrusb2-wm8775.c      |    2 +-
 drivers/scsi/arm/eesox.c                          |    2 +-
 fs/cifs/cifssmb.c                                 |    4 ++--
 include/asm-arm/uaccess.h                         |    6 +++---
 include/asm-arm26/uaccess.h                       |   10 +++++-----
 include/asm-ia64/kexec.h                          |    2 +-
 17 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/mips/kernel/machine_kexec.c b/arch/mips/kernel/machine_kexec.c
index e0ad754..8f42fa8 100644
--- a/arch/mips/kernel/machine_kexec.c
+++ b/arch/mips/kernel/machine_kexec.c
@@ -13,8 +13,8 @@
 #include <asm/cacheflush.h>
 #include <asm/page.h>
 
-const extern unsigned char relocate_new_kernel[];
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned char relocate_new_kernel[];
+extern const unsigned int relocate_new_kernel_size;
 
 extern unsigned long kexec_start_address;
 extern unsigned long kexec_indirection_page;
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 76b5d7e..9d0735a 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -182,7 +182,7 @@ void rtas_progress(char *s, unsigned short hex)
 	char *os;
 	static int display_character, set_indicator;
 	static int display_width, display_lines, form_feed;
-	const static int *row_width;
+	static const int *row_width;
 	static DEFINE_SPINLOCK(progress_lock);
 	static int current_line;
 	static int pending_newline = 0;  /* did last write end with unprinted newline? */
diff --git a/arch/sh/kernel/cpu/sh2/clock-sh7619.c b/arch/sh/kernel/cpu/sh2/clock-sh7619.c
index d0440b2..d2c1579 100644
--- a/arch/sh/kernel/cpu/sh2/clock-sh7619.c
+++ b/arch/sh/kernel/cpu/sh2/clock-sh7619.c
@@ -18,8 +18,8 @@
 #include <asm/freq.h>
 #include <asm/io.h>
 
-const static int pll1rate[]={1,2};
-const static int pfc_divisors[]={1,2,0,4};
+static const int pll1rate[] = {1,2};
+static const int pfc_divisors[] = {1,2,0,4};
 
 #if (CONFIG_SH_CLK_MD = 1) || (CONFIG_SH_CLK_MD = 2)
 #define PLL2 (4)
diff --git a/arch/sh/kernel/cpu/sh2a/clock-sh7206.c b/arch/sh/kernel/cpu/sh2a/clock-sh7206.c
index a9ad309..82d7f99 100644
--- a/arch/sh/kernel/cpu/sh2a/clock-sh7206.c
+++ b/arch/sh/kernel/cpu/sh2a/clock-sh7206.c
@@ -18,8 +18,8 @@
 #include <asm/freq.h>
 #include <asm/io.h>
 
-const static int pll1rate[]={1,2,3,4,6,8};
-const static int pfc_divisors[]={1,2,3,4,6,8,12};
+static const int pll1rate[]={1,2,3,4,6,8};
+static const int pfc_divisors[]={1,2,3,4,6,8,12};
 #define ifc_divisors pfc_divisors
 
 #if (CONFIG_SH_CLK_MD = 2)
diff --git a/drivers/ieee1394/ohci1394.c b/drivers/ieee1394/ohci1394.c
index 628130a..fff3121 100644
--- a/drivers/ieee1394/ohci1394.c
+++ b/drivers/ieee1394/ohci1394.c
@@ -181,7 +181,7 @@ static int alloc_dma_trm_ctx(struct ti_ohci *ohci, struct dma_trm_ctx *d,
 static void ohci1394_pci_remove(struct pci_dev *pdev);
 
 #ifndef __LITTLE_ENDIAN
-const static size_t hdr_sizes[] = {
+static const size_t hdr_sizes[] = {
 	3,	/* TCODE_WRITEQ */
 	4,	/* TCODE_WRITEB */
 	3,	/* TCODE_WRITE_RESPONSE */
diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
index b3e84d3..10d9d74 100644
--- a/drivers/input/serio/libps2.c
+++ b/drivers/input/serio/libps2.c
@@ -97,7 +97,7 @@ EXPORT_SYMBOL(ps2_drain);
 
 int ps2_is_keyboard_id(char id_byte)
 {
-	const static char keyboard_ids[] = {
+	static const char keyboard_ids[] = {
 		0xab,	/* Regular keyboards		*/
 		0xac,	/* NCD Sun keyboard		*/
 		0x2b,	/* Trust keyboard, translated	*/
diff --git a/drivers/media/video/pvrusb2/pvrusb2-audio.c b/drivers/media/video/pvrusb2/pvrusb2-audio.c
index 9846c46..122496f 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-audio.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-audio.c
@@ -158,7 +158,7 @@ static unsigned int pvr2_msp3400_describe(struct pvr2_msp3400_handler *ctxt,
 }
 
 
-const static struct pvr2_i2c_handler_functions msp3400_funcs = {
+static const struct pvr2_i2c_handler_functions msp3400_funcs = {
 	.detach = (void (*)(void *))pvr2_msp3400_detach,
 	.check = (int (*)(void *))msp3400_check,
 	.update = (void (*)(void *))msp3400_update,
diff --git a/drivers/media/video/pvrusb2/pvrusb2-cx2584x-v4l.c b/drivers/media/video/pvrusb2/pvrusb2-cx2584x-v4l.c
index 848fb23..8df969c 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-cx2584x-v4l.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-cx2584x-v4l.c
@@ -226,7 +226,7 @@ static void decoder_reset(struct pvr2_v4l_cx2584x *ctxt)
 }
 
 
-const static struct pvr2_i2c_handler_functions hfuncs = {
+static const struct pvr2_i2c_handler_functions hfuncs = {
 	.detach = (void (*)(void *))decoder_detach,
 	.check = (int (*)(void *))decoder_check,
 	.update = (void (*)(void *))decoder_update,
diff --git a/drivers/media/video/pvrusb2/pvrusb2-std.c b/drivers/media/video/pvrusb2/pvrusb2-std.c
index f95c598..c089255 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-std.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-std.c
@@ -78,14 +78,14 @@ struct std_name {
 #define CSTD_ALL (CSTD_PAL|CSTD_NTSC|CSTD_SECAM)
 
 /* Mapping of standard bits to color system */
-const static struct std_name std_groups[] = {
+static const struct std_name std_groups[] = {
 	{"PAL",CSTD_PAL},
 	{"NTSC",CSTD_NTSC},
 	{"SECAM",CSTD_SECAM},
 };
 
 /* Mapping of standard bits to modulation system */
-const static struct std_name std_items[] = {
+static const struct std_name std_items[] = {
 	{"B",TSTD_B},
 	{"B1",TSTD_B1},
 	{"D",TSTD_D},
diff --git a/drivers/media/video/pvrusb2/pvrusb2-tuner.c b/drivers/media/video/pvrusb2/pvrusb2-tuner.c
index af9f246..bb17db3 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-tuner.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-tuner.c
@@ -80,7 +80,7 @@ static unsigned int pvr2_tuner_describe(struct pvr2_tuner_handler *ctxt,char *bu
 }
 
 
-const static struct pvr2_i2c_handler_functions tuner_funcs = {
+static const struct pvr2_i2c_handler_functions tuner_funcs = {
 	.detach = (void (*)(void *))pvr2_tuner_detach,
 	.check = (int (*)(void *))tuner_check,
 	.update = (void (*)(void *))tuner_update,
diff --git a/drivers/media/video/pvrusb2/pvrusb2-video-v4l.c b/drivers/media/video/pvrusb2/pvrusb2-video-v4l.c
index 05f2cdd..2a82646 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-video-v4l.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-video-v4l.c
@@ -201,7 +201,7 @@ static unsigned int decoder_describe(struct pvr2_v4l_decoder *ctxt,char *buf,uns
 }
 
 
-const static struct pvr2_i2c_handler_functions hfuncs = {
+static const struct pvr2_i2c_handler_functions hfuncs = {
 	.detach = (void (*)(void *))decoder_detach,
 	.check = (int (*)(void *))decoder_check,
 	.update = (void (*)(void *))decoder_update,
diff --git a/drivers/media/video/pvrusb2/pvrusb2-wm8775.c b/drivers/media/video/pvrusb2/pvrusb2-wm8775.c
index 2413e51..7794c34 100644
--- a/drivers/media/video/pvrusb2/pvrusb2-wm8775.c
+++ b/drivers/media/video/pvrusb2/pvrusb2-wm8775.c
@@ -126,7 +126,7 @@ static void wm8775_update(struct pvr2_v4l_wm8775 *ctxt)
 }
 
 
-const static struct pvr2_i2c_handler_functions hfuncs = {
+static const struct pvr2_i2c_handler_functions hfuncs = {
 	.detach = (void (*)(void *))wm8775_detach,
 	.check = (int (*)(void *))wm8775_check,
 	.update = (void (*)(void *))wm8775_update,
diff --git a/drivers/scsi/arm/eesox.c b/drivers/scsi/arm/eesox.c
index 3f876fb..7ac05f7 100644
--- a/drivers/scsi/arm/eesox.c
+++ b/drivers/scsi/arm/eesox.c
@@ -197,7 +197,7 @@ static void eesoxscsi_buffer_in(void *buf, int length, void __iomem *base)
 	const void __iomem *reg_fas = base + EESOX_FAS216_OFFSET;
 	const void __iomem *reg_dmastat = base + EESOX_DMASTAT;
 	const void __iomem *reg_dmadata = base + EESOX_DMADATA;
-	const register unsigned long mask = 0xffff;
+	register const unsigned long mask = 0xffff;
 
 	do {
 		unsigned int status;
diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index 472e33e..419735e 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -2812,10 +2812,10 @@ GetExtAttrOut:
 
 
 /* security id for everyone */
-const static struct cifs_sid sid_everyone = 
+static const struct cifs_sid sid_everyone  		{1, 1, {0, 0, 0, 0, 0, 0}, {0, 0, 0, 0}};
 /* group users */
-const static struct cifs_sid sid_user = 
+static const struct cifs_sid sid_user  		{1, 2 , {0, 0, 0, 0, 0, 5}, {32, 545, 0, 0}};
 
 /* Convert CIFS ACL to POSIX form */
diff --git a/include/asm-arm/uaccess.h b/include/asm-arm/uaccess.h
index 5f420a0..acec5b9 100644
--- a/include/asm-arm/uaccess.h
+++ b/include/asm-arm/uaccess.h
@@ -109,7 +109,7 @@ extern int __get_user_4(void *);
 
 #define get_user(x,p)							\
 	({								\
-		const register typeof(*(p)) __user *__p asm("r0") = (p);\
+		register const typeof(*(p)) __user *__p asm("r0") = (p);\
 		register unsigned long __r2 asm("r2");			\
 		register int __e asm("r0");				\
 		switch (sizeof(*(__p))) {				\
@@ -143,8 +143,8 @@ extern int __put_user_8(void *, unsigned long long);
 
 #define put_user(x,p)							\
 	({								\
-		const register typeof(*(p)) __r2 asm("r2") = (x);	\
-		const register typeof(*(p)) __user *__p asm("r0") = (p);\
+		register const typeof(*(p)) __r2 asm("r2") = (x);	\
+		register const typeof(*(p)) __user *__p asm("r0") = (p);\
 		register int __e asm("r0");				\
 		switch (sizeof(*(__p))) {				\
 		case 1:							\
diff --git a/include/asm-arm26/uaccess.h b/include/asm-arm26/uaccess.h
index 3f2dd10..d64ed84 100644
--- a/include/asm-arm26/uaccess.h
+++ b/include/asm-arm26/uaccess.h
@@ -74,7 +74,7 @@ extern int __get_user_bad(void);
 
 #define get_user(x,p)							\
 	({								\
-		const register typeof(*(p)) *__p asm("r0") = (p);	\
+		register const typeof(*(p)) *__p asm("r0") = (p);	\
 		register typeof(*(p)) __r1 asm("r1");			\
 		register int __e asm("r0");				\
 		switch (sizeof(*(p))) {					\
@@ -139,8 +139,8 @@ extern int __put_user_bad(void);
 
 #define put_user(x,p)                                                   \
         ({                                                              \
-                const register typeof(*(p)) __r1 asm("r1") = (x);       \
-                const register typeof(*(p)) *__p asm("r0") = (p);       \
+                register const typeof(*(p)) __r1 asm("r1") = (x);       \
+                register const typeof(*(p)) *__p asm("r0") = (p);       \
                 register int __e asm("r0");                             \
                 switch (sizeof(*(__p))) {                               \
                 case 1:                                                 \
@@ -170,8 +170,8 @@ extern int __put_user_bad(void);
 
 #define put_user(x,p)							\
 	({								\
-		const register typeof(*(p)) __r1 asm("r1") = (x);	\
-		const register typeof(*(p)) *__p asm("r0") = (p);	\
+		register const typeof(*(p)) __r1 asm("r1") = (x);	\
+		register const typeof(*(p)) *__p asm("r0") = (p);	\
 		register int __e asm("r0");				\
 		switch (sizeof(*(p))) {					\
 		case 1:							\
diff --git a/include/asm-ia64/kexec.h b/include/asm-ia64/kexec.h
index 01c36b0..f2ad469 100644
--- a/include/asm-ia64/kexec.h
+++ b/include/asm-ia64/kexec.h
@@ -23,7 +23,7 @@
 
 extern struct kimage *ia64_kimage;
 DECLARE_PER_CPU(u64, ia64_mca_pal_base);
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned int relocate_new_kernel_size;
 extern void relocate_new_kernel(unsigned long, unsigned long,
 		struct ia64_boot_param *, unsigned long);
 static inline void
-- 
1.4.4.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
