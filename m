From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 10:57:51 +0000
Subject: [PATCH] x86/Kconfig: fix spelling mistake "effectivness" -> "effectiveness"
Message-Id: <20190416105751.18899-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The Kconfig text contains a spelling mistake, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bbd26f68ef56..baefe76481b8 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1502,7 +1502,7 @@ config X86_CPA_STATISTICS
 	depends on DEBUG_FS
 	---help---
 	  Expose statistics about the Change Page Attribute mechanims, which
-	  helps to determine the effectivness of preserving large and huge
+	  helps to determine the effectiveness of preserving large and huge
 	  page mappings when mapping protections are changed.
 
 config ARCH_HAS_MEM_ENCRYPT
-- 
2.20.1
