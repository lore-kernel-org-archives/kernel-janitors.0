From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 27 Aug 2019 07:23:34 +0000
Subject: [PATCH -next] MIPS: Octeon: remove duplicated include from dma-octeon.c
Message-Id: <20190827072334.96670-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/mips/cavium-octeon/dma-octeon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index 72f24a4db099..14ea680d180e 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -16,7 +16,6 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/mm.h>
-#include <linux/memblock.h>
 
 #include <asm/bootinfo.h>
 
