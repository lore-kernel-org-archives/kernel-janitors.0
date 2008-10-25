From: Joe Damato <ice799@gmail.com>
Date: Sat, 25 Oct 2008 03:15:30 +0000
Subject: [PATCH 10/12] x86: Use static initializers for descriptors
Message-Id: <63f6f0d8b3da967e88094b6cd4b23f2ba78abbdc.1224903712.git.ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1224904532-9586-1-git-send-email-ice799@gmail.com>
 <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com>
 <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
 <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
 <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
 <a4c806abcf7a46c78aaff4e338fdbc1a06a56c88.1224903712.git.ice799@gmail.com>
 <8834ad1ab5a5ab9b4902ab708160b23f078f3758.1224903712.git.ice799@gmail.com>
 <4d0ab6d642a4edc3ecc7367df7043ecc8f0a7f98.1224903712.git.ice799@gmail.com>
 <c53b3a54b3215187055dfe5673e1351d1bd3957a.1224903712.git.ice799@gmail.com>
 <e1bbf5a92bbf8fcf36dcbb650ee5f22d48d4b0f4.1224903712.git.ice799@gmail.com>
In-Reply-To: <e1bbf5a92bbf8fcf36dcbb650ee5f22d48d4b0f4.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Use static intializers for GDT/LDT entries.

Signed-off-by: Joe Damato <ice799@gmail.com>
---
 arch/x86/kernel/apm_32.c     |    2 +-
 arch/x86/kernel/cpu/common.c |   28 ++++++++++++++--------------
 include/asm-x86/lguest.h     |    4 ++--
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
index 5145a6e..5cacdad 100644
--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -407,7 +407,7 @@ static DECLARE_WAIT_QUEUE_HEAD(apm_waitqueue);
 static DECLARE_WAIT_QUEUE_HEAD(apm_suspend_waitqueue);
 static struct apm_user *user_list;
 static DEFINE_SPINLOCK(user_list_lock);
-static const struct desc_struct	bad_bios_desc = { { { 0, 0x00409200 } } };
+static const struct desc_struct	bad_bios_desc = __DESC_INITIALIZER(0, 0x00409200);
 
 static const char driver_version[] = "1.16ac";	/* no spaces */
 
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 25581dc..018e1ba 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -57,38 +57,38 @@ DEFINE_PER_CPU(struct gdt_page, gdt_page) = { .gdt = {
 } };
 #else
 DEFINE_PER_CPU_PAGE_ALIGNED(struct gdt_page, gdt_page) = { .gdt = {
-	[GDT_ENTRY_KERNEL_CS] = { { { 0x0000ffff, 0x00cf9a00 } } },
-	[GDT_ENTRY_KERNEL_DS] = { { { 0x0000ffff, 0x00cf9200 } } },
-	[GDT_ENTRY_DEFAULT_USER_CS] = { { { 0x0000ffff, 0x00cffa00 } } },
-	[GDT_ENTRY_DEFAULT_USER_DS] = { { { 0x0000ffff, 0x00cff200 } } },
+	[GDT_ENTRY_KERNEL_CS] =  __DESC_INITIALIZER(0x0000ffff, 0x00cf9a00),
+	[GDT_ENTRY_KERNEL_DS] =  __DESC_INITIALIZER(0x0000ffff, 0x00cf9200),
+	[GDT_ENTRY_DEFAULT_USER_CS] = __DESC_INITIALIZER(0x0000ffff, 0x00cffa00),
+	[GDT_ENTRY_DEFAULT_USER_DS] = __DESC_INITIALIZER(0x0000ffff, 0x00cff200),
 	/*
 	 * Segments used for calling PnP BIOS have byte granularity.
 	 * They code segments and data segments have fixed 64k limits,
 	 * the transfer segment sizes are set at run time.
 	 */
 	/* 32-bit code */
-	[GDT_ENTRY_PNPBIOS_CS32] = { { { 0x0000ffff, 0x00409a00 } } },
+	[GDT_ENTRY_PNPBIOS_CS32] = __DESC_INITIALIZER(0x0000ffff, 0x00409a00),
 	/* 16-bit code */
-	[GDT_ENTRY_PNPBIOS_CS16] = { { { 0x0000ffff, 0x00009a00 } } },
+	[GDT_ENTRY_PNPBIOS_CS16] = __DESC_INITIALIZER(0x0000ffff, 0x00009a00),
 	/* 16-bit data */
-	[GDT_ENTRY_PNPBIOS_DS] = { { { 0x0000ffff, 0x00009200 } } },
+	[GDT_ENTRY_PNPBIOS_DS] = __DESC_INITIALIZER(0x0000ffff, 0x00009200),
 	/* 16-bit data */
-	[GDT_ENTRY_PNPBIOS_TS1] = { { { 0x00000000, 0x00009200 } } },
+	[GDT_ENTRY_PNPBIOS_TS1] = __DESC_INITIALIZER(0x00000000, 0x00009200),
 	/* 16-bit data */
-	[GDT_ENTRY_PNPBIOS_TS2] = { { { 0x00000000, 0x00009200 } } },
+	[GDT_ENTRY_PNPBIOS_TS2] = __DESC_INITIALIZER(0x00000000, 0x00009200),
 	/*
 	 * The APM segments have byte granularity and their bases
 	 * are set at run time.  All have 64k limits.
 	 */
 	/* 32-bit code */
-	[GDT_ENTRY_APMBIOS_BASE] = { { { 0x0000ffff, 0x00409a00 } } },
+	[GDT_ENTRY_APMBIOS_BASE] = __DESC_INITIALIZER(0x0000ffff, 0x00409a00),
 	/* 16-bit code */
-	[GDT_ENTRY_APMBIOS_BASE+1] = { { { 0x0000ffff, 0x00009a00 } } },
+	[GDT_ENTRY_APMBIOS_BASE+1] = __DESC_INITIALIZER(0x0000ffff, 0x00009a00),
 	/* data */
-	[GDT_ENTRY_APMBIOS_BASE+2] = { { { 0x0000ffff, 0x00409200 } } },
+	[GDT_ENTRY_APMBIOS_BASE+2] = __DESC_INITIALIZER(0x0000ffff, 0x00409200),
 
-	[GDT_ENTRY_ESPFIX_SS] = { { { 0x00000000, 0x00c09200 } } },
-	[GDT_ENTRY_PERCPU] = { { { 0x00000000, 0x00000000 } } },
+	[GDT_ENTRY_ESPFIX_SS] = __DESC_INITIALIZER(0x00000000, 0x00c09200),
+	[GDT_ENTRY_PERCPU] = __DESC_INITIALIZER(0x00000000, 0x00000000),
 } };
 #endif
 EXPORT_PER_CPU_SYMBOL_GPL(gdt_page);
diff --git a/include/asm-x86/lguest.h b/include/asm-x86/lguest.h
index 9ccf6f4..f766b6c 100644
--- a/include/asm-x86/lguest.h
+++ b/include/asm-x86/lguest.h
@@ -86,8 +86,8 @@ static inline void lguest_set_ts(void)
 }
 
 /* Full 4G segment descriptors, suitable for CS and DS. */
-#define FULL_EXEC_SEGMENT ((struct desc_struct){ { {0x0000ffff, 0x00cf9b00} } })
-#define FULL_SEGMENT ((struct desc_struct){ { {0x0000ffff, 0x00cf9300} } })
+#define FULL_EXEC_SEGMENT ((struct desc_struct) __DESC_INITIALIZER(0x0000ffff, 0x00cf9b00))
+#define FULL_SEGMENT ((struct desc_struct) __DESC_INITIALIZER(0x0000ffff, 0x00cf9300))
 
 #endif /* __ASSEMBLY__ */
 
-- 
1.5.4.3

