From: Colin King <colin.king@canonical.com>
Date: Sun, 03 Dec 2017 16:53:16 +0000
Subject: [PATCH][next] x86/mm: make function clear_non_loaded_ctxs static
Message-Id: <20171203165316.28915-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andy Lutomirski <luto@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function clear_non_loaded_ctxs is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
arch/x86/mm/tlb.c:37:6: warning: symbol 'clear_non_loaded_ctxs' was
not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/mm/tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index f75b6eb47a6d..6ecbd8fc292e 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -34,7 +34,7 @@
  * necessary invalidation by clearing out the 'ctx_id' which
  * forces a TLB flush when the context is loaded.
  */
-void clear_non_loaded_ctxs(void)
+static void clear_non_loaded_ctxs(void)
 {
 	u16 asid;
 
-- 
2.14.1

