From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Jun 2017 09:16:26 +0000
Subject: [PATCH] x86/microcode/AMD: make function __load_ucode_amd static
Message-Id: <20170622091626.10995-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The helper function __load_ucode_amd does not need to be in global
scope, so make it static.

Cleans up sparse warning:
"symbol '__load_ucode_amd' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/microcode/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.11.0

