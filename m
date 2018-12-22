From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 19:11:16 +0000
Subject: [PATCH][next] x86/fault: fix sign-extend of a unsigned that has been promoted to an int
Message-Id: <20181222191116.21831-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The shifting of desc.base2 by 24 bits will end up with a sign extension
error if the bit 7 of desc.base2 is set.  This because desc.base2 is
promoted to type int and then sign extended to an unsigned long, causing
the upper bits 32 bits to be set on the sign extension.  Fix this by
casting desc.base2 to unsigned long before the shift.

Detected by CoverityScan, CID#1475635 ("Unintended sign extension")

Fixes: a1a371c468f7 ("x86/fault: Decode page fault OOPSes better")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 2ff25ad33233..9d5c75f02295 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -595,7 +595,7 @@ static void show_ldttss(const struct desc_ptr *gdt, const char *name, u16 index)
 		return;
 	}
 
-	addr = desc.base0 | (desc.base1 << 16) | (desc.base2 << 24);
+	addr = desc.base0 | (desc.base1 << 16) | ((unsigned long)desc.base2 << 24);
 #ifdef CONFIG_X86_64
 	addr |= ((u64)desc.base3 << 32);
 #endif
-- 
2.19.1
