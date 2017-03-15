From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Mar 2017 17:10:10 +0000
Subject: [PATCH] x86/microcode/AMD: remove redundant null check on mc
Message-Id: <20170315171010.17536-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

mc is a pointer to the static u8 array amd_ucode_patch and
therefore can never be null, so the check is redundant. Remove it.

Detected by CoverityScan, CID#1372871 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/microcode/amd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 7889ae4..f2afe99 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -352,9 +352,6 @@ void reload_ucode_amd(void)
 	u32 rev, dummy;
 
 	mc = (struct microcode_amd *)amd_ucode_patch;
-	if (!mc)
-		return;
-
 	rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
 
 	if (rev < mc->hdr.patch_id) {
-- 
2.10.2

