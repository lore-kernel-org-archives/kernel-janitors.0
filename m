From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Mar 2018 15:55:53 +0000
Subject: [PATCH] powerpc: fix spelling mistake: "Usupported" -> "Unsupported"
Message-Id: <20180330155553.7170-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in bootx_printf message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/platforms/powermac/bootx_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
index c3c9bbb3573a..ca60f3ef7ef6 100644
--- a/arch/powerpc/platforms/powermac/bootx_init.c
+++ b/arch/powerpc/platforms/powermac/bootx_init.c
@@ -519,7 +519,7 @@ void __init bootx_init(unsigned long r3, unsigned long r4)
 			;
 	}
 	if (bi->architecture != BOOT_ARCH_PCI) {
-		bootx_printf(" !!! WARNING - Usupported machine"
+		bootx_printf(" !!! WARNING - Unsupported machine"
 			     " architecture !\n");
 		for (;;)
 			;
-- 
2.15.1

