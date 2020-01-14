From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 11:15:05 +0000
Subject: [PATCH] x86/microcode/amd: fix uninitalized structure cp
Message-Id: <20200114111505.320186-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where cp is not assigned to the return from
the call to find_microcode_in_initrd cp is uninitialized when
it is assigned to *ret.   Functions that call __load_ucode_amd
such as load_ucode_amd_bsp can therefore end up checking bogus
values cp.data and cp.size.  Fix this by ensuring cp is
initialized as all zero and remove the redundant initialization
of cp in load_ucode_amd_bsp.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: e71bb4ec0739 ("x86/microcode/AMD: Unify load_ucode_amd_ap()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/microcode/amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 3f6b137ef4e6..675704019df2 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -473,7 +473,7 @@ static bool get_builtin_microcode(struct cpio_data *cp, unsigned int family)
 static void __load_ucode_amd(unsigned int cpuid_1_eax, struct cpio_data *ret)
 {
 	struct ucode_cpu_info *uci;
-	struct cpio_data cp;
+	struct cpio_data cp = { };
 	const char *path;
 	bool use_pa;
 
@@ -498,7 +498,7 @@ static void __load_ucode_amd(unsigned int cpuid_1_eax, struct cpio_data *ret)
 
 void __init load_ucode_amd_bsp(unsigned int cpuid_1_eax)
 {
-	struct cpio_data cp = { };
+	struct cpio_data cp;
 
 	__load_ucode_amd(cpuid_1_eax, &cp);
 	if (!(cp.data && cp.size))
-- 
2.24.0
