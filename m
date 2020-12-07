From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Dec 2020 15:54:20 +0000
Subject: [PATCH] powerpc: fix spelling mistake in Kconfig "seleted" -> "selected"
Message-Id: <20201207155420.172370-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the help text of the Kconfig. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8fb61a285c76..4010bae52351 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -87,7 +87,7 @@ config PPC_WATCHDOG
 	help
 	  This is a placeholder when the powerpc hardlockup detector
 	  watchdog is selected (arch/powerpc/kernel/watchdog.c). It is
-	  seleted via the generic lockup detector menu which is why we
+	  selected via the generic lockup detector menu which is why we
 	  have no standalone config option for it here.
 
 config STACKTRACE_SUPPORT
-- 
2.29.2
