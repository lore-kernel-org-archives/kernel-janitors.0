From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Jun 2017 09:57:36 +0000
Subject: [PATCH][V2] x86/microcode: make a couple of symbols static
Message-Id: <20170622095736.11937-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The helper function __load_ucode_amd and pointer intel_ucode_patch
do not need to be in global scope, so make them static.

Cleans up sparse warnings:
"symbol '__load_ucode_amd' was not declared. Should it be static?"
"symbol 'intel_ucode_patch' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/microcode/amd.c   | 2 +-
 arch/x86/kernel/cpu/microcode/intel.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index e9f4d762aa5b..21b185793c80 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -251,7 +251,7 @@ static bool get_builtin_microcode(struct cpio_data *cp, unsigned int family)
 #endif
 }
 
-void __load_ucode_amd(unsigned int cpuid_1_eax, struct cpio_data *ret)
+static void __load_ucode_amd(unsigned int cpuid_1_eax, struct cpio_data *ret)
 {
 	struct ucode_cpu_info *uci;
 	struct cpio_data cp;
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index d525a0bd7d28..59edbe9d4ccb 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -42,7 +42,7 @@
 static const char ucode_path[] = "kernel/x86/microcode/GenuineIntel.bin";
 
 /* Current microcode patch used in early patching on the APs. */
-struct microcode_intel *intel_ucode_patch;
+static struct microcode_intel *intel_ucode_patch;
 
 static inline bool cpu_signatures_match(unsigned int s1, unsigned int p1,
 					unsigned int s2, unsigned int p2)
-- 
2.11.0

