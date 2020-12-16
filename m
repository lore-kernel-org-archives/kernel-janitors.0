From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:36:08 +0000
Subject: [PATCH] powerpc/44x: fix spelling mistake in Kconfig "varients" -> "variants"
Message-Id: <20201216113608.11812-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/platforms/44x/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 78ac6d67a935..71068d89fcaa 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -5,7 +5,7 @@ config PPC_47x
 	select MPIC
 	help
 	  This option enables support for the 47x family of processors and is
-	  not currently compatible with other 44x or 46x varients
+	  not currently compatible with other 44x or 46x variants
 
 config BAMBOO
 	bool "Bamboo"
-- 
2.29.2
