From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Jul 2017 09:08:59 +0000
Subject: [PATCH][next] x86/hyper-v: add missing void return type to hyperv_cleanup declaration
Message-Id: <20170719090859.9248-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Add in missing void return type, fixes sparse warning:
"warning: 'hyperv_cleanup()' has implicit return type"

Fixes: 2e252fbf777d ("x86/hyper-v: include hyperv/ only when CONFIG_HYPERV is set")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/include/asm/mshyperv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 01b9c0fb3aab..41fae263f8fa 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -178,7 +178,7 @@ void hyperv_cleanup(void);
 #else /* CONFIG_HYPERV */
 static inline void hyperv_init(void) {}
 static inline bool hv_is_hypercall_page_setup(void) { return false; }
-static inline hyperv_cleanup(void) {}
+static inline void hyperv_cleanup(void) {}
 #endif /* CONFIG_HYPERV */
 
 #ifdef CONFIG_HYPERV_TSCPAGE
-- 
2.11.0

