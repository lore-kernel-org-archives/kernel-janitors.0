From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 28 May 2006 16:57:59 +0000
Subject: [KJ] [PATCH] Storage class should be first
Message-Id: <20060528165759.GA1614@neon.tklauser.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Storage class should be before const

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 arch/i386/kernel/machine_kexec.c       |    4 ++--
 arch/powerpc/kernel/machine_kexec_32.c |    4 ++--
 arch/ppc/kernel/machine_kexec.c        |    4 ++--
 arch/s390/kernel/machine_kexec.c       |    4 ++--
 arch/sh/kernel/machine_kexec.c         |    4 ++--
 arch/x86_64/kernel/machine_kexec.c     |    4 ++--
 drivers/media/video/pwc/pwc-kiara.h    |    4 ++--
 drivers/media/video/pwc/pwc-timon.h    |    4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff -urpN -X dontdiff linux-2.6.17-rc5/arch/i386/kernel/machine_kexec.c linux-2.6.17-rc5~tk/arch/i386/kernel/machine_kexec.c
--- linux-2.6.17-rc5/arch/i386/kernel/machine_kexec.c	2006-03-20 20:26:44.000000000 +0100
+++ linux-2.6.17-rc5~tk/arch/i386/kernel/machine_kexec.c	2006-05-27 19:06:24.000000000 +0200
@@ -133,9 +133,9 @@ typedef asmlinkage NORET_TYPE void (*rel
 					unsigned long start_address,
 					unsigned int has_pae) ATTRIB_NORET;
 
-const extern unsigned char relocate_new_kernel[];
+extern const unsigned char relocate_new_kernel[];
 extern void relocate_new_kernel_end(void);
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned int relocate_new_kernel_size;
 
 /*
  * A architecture hook called to validate the
diff -urpN -X dontdiff linux-2.6.17-rc5/arch/powerpc/kernel/machine_kexec_32.c linux-2.6.17-rc5~tk/arch/powerpc/kernel/machine_kexec_32.c
--- linux-2.6.17-rc5/arch/powerpc/kernel/machine_kexec_32.c	2006-03-20 20:26:45.000000000 +0100
+++ linux-2.6.17-rc5~tk/arch/powerpc/kernel/machine_kexec_32.c	2006-05-27 19:06:42.000000000 +0200
@@ -30,8 +30,8 @@ typedef NORET_TYPE void (*relocate_new_k
  */
 void default_machine_kexec(struct kimage *image)
 {
-	const extern unsigned char relocate_new_kernel[];
-	const extern unsigned int relocate_new_kernel_size;
+	extern const unsigned char relocate_new_kernel[];
+	extern const unsigned int relocate_new_kernel_size;
 	unsigned long page_list;
 	unsigned long reboot_code_buffer, reboot_code_buffer_phys;
 	relocate_new_kernel_t rnk;
diff -urpN -X dontdiff linux-2.6.17-rc5/arch/ppc/kernel/machine_kexec.c linux-2.6.17-rc5~tk/arch/ppc/kernel/machine_kexec.c
--- linux-2.6.17-rc5/arch/ppc/kernel/machine_kexec.c	2006-03-20 20:26:45.000000000 +0100
+++ linux-2.6.17-rc5~tk/arch/ppc/kernel/machine_kexec.c	2006-05-27 19:07:02.000000000 +0200
@@ -25,8 +25,8 @@ typedef NORET_TYPE void (*relocate_new_k
 				unsigned long reboot_code_buffer,
 				unsigned long start_address) ATTRIB_NORET;
 
-const extern unsigned char relocate_new_kernel[];
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned char relocate_new_kernel[];
+extern const unsigned int relocate_new_kernel_size;
 
 void machine_shutdown(void)
 {
diff -urpN -X dontdiff linux-2.6.17-rc5/arch/s390/kernel/machine_kexec.c linux-2.6.17-rc5~tk/arch/s390/kernel/machine_kexec.c
--- linux-2.6.17-rc5/arch/s390/kernel/machine_kexec.c	2006-03-20 20:26:45.000000000 +0100
+++ linux-2.6.17-rc5~tk/arch/s390/kernel/machine_kexec.c	2006-05-27 19:08:26.000000000 +0200
@@ -27,8 +27,8 @@ static void kexec_halt_all_cpus(void *);
 
 typedef void (*relocate_kernel_t) (kimage_entry_t *, unsigned long);
 
-const extern unsigned char relocate_kernel[];
-const extern unsigned long long relocate_kernel_len;
+extern const unsigned char relocate_kernel[];
+extern const unsigned long long relocate_kernel_len;
 
 int
 machine_kexec_prepare(struct kimage *image)
diff -urpN -X dontdiff linux-2.6.17-rc5/arch/sh/kernel/machine_kexec.c linux-2.6.17-rc5~tk/arch/sh/kernel/machine_kexec.c
--- linux-2.6.17-rc5/arch/sh/kernel/machine_kexec.c	2006-03-20 20:26:45.000000000 +0100
+++ linux-2.6.17-rc5~tk/arch/sh/kernel/machine_kexec.c	2006-05-27 19:08:41.000000000 +0200
@@ -25,8 +25,8 @@ typedef NORET_TYPE void (*relocate_new_k
 				unsigned long start_address,
 				unsigned long vbr_reg) ATTRIB_NORET;
 
-const extern unsigned char relocate_new_kernel[];
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned char relocate_new_kernel[];
+extern const unsigned int relocate_new_kernel_size;
 extern void *gdb_vbr_vector;
 
 /*
diff -urpN -X dontdiff linux-2.6.17-rc5/arch/x86_64/kernel/machine_kexec.c linux-2.6.17-rc5~tk/arch/x86_64/kernel/machine_kexec.c
--- linux-2.6.17-rc5/arch/x86_64/kernel/machine_kexec.c	2006-03-20 20:26:45.000000000 +0100
+++ linux-2.6.17-rc5~tk/arch/x86_64/kernel/machine_kexec.c	2006-05-27 19:08:56.000000000 +0200
@@ -149,8 +149,8 @@ typedef NORET_TYPE void (*relocate_new_k
 					unsigned long start_address,
 					unsigned long pgtable) ATTRIB_NORET;
 
-const extern unsigned char relocate_new_kernel[];
-const extern unsigned long relocate_new_kernel_size;
+extern const unsigned char relocate_new_kernel[];
+extern const unsigned long relocate_new_kernel_size;
 
 int machine_kexec_prepare(struct kimage *image)
 {
diff -urpN -X dontdiff linux-2.6.17-rc5/drivers/media/video/pwc/pwc-kiara.h linux-2.6.17-rc5~tk/drivers/media/video/pwc/pwc-kiara.h
--- linux-2.6.17-rc5/drivers/media/video/pwc/pwc-kiara.h	2006-05-27 11:48:29.000000000 +0200
+++ linux-2.6.17-rc5~tk/drivers/media/video/pwc/pwc-kiara.h	2006-05-27 19:09:11.000000000 +0200
@@ -37,8 +37,8 @@ struct Kiara_table_entry
 	unsigned char mode[12];		/* precomputed mode settings for cam */
 };
 
-const extern struct Kiara_table_entry Kiara_table[PSZ_MAX][6][4];
-const extern unsigned int KiaraRomTable[8][2][16][8];
+extern const struct Kiara_table_entry Kiara_table[PSZ_MAX][6][4];
+extern const unsigned int KiaraRomTable[8][2][16][8];
 
 #endif
 
diff -urpN -X dontdiff linux-2.6.17-rc5/drivers/media/video/pwc/pwc-timon.h linux-2.6.17-rc5~tk/drivers/media/video/pwc/pwc-timon.h
--- linux-2.6.17-rc5/drivers/media/video/pwc/pwc-timon.h	2006-05-27 11:48:29.000000000 +0200
+++ linux-2.6.17-rc5~tk/drivers/media/video/pwc/pwc-timon.h	2006-05-27 19:09:26.000000000 +0200
@@ -52,8 +52,8 @@ struct Timon_table_entry
 	unsigned char mode[13];		/* precomputed mode settings for cam */
 };
 
-const extern struct Timon_table_entry Timon_table[PSZ_MAX][6][4];
-const extern unsigned int TimonRomTable [16][2][16][8];
+extern const struct Timon_table_entry Timon_table[PSZ_MAX][6][4];
+extern const unsigned int TimonRomTable [16][2][16][8];
 
 
 #endif
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
