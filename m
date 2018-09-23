From: YueHaibing <yuehaibing@huawei.com>
Date: Sun, 23 Sep 2018 08:12:08 +0000
Subject: [PATCH -next] powerpc: Remove duplicated include from pci_32.c
Message-Id: <1537690328-77353-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Al Viro <viro@zeniv.linux.org.uk>, Paul Burton <paul.burton@mips.com>, Sinan Kaya <okaya@codeaurora.org>, Mathieu Malaterre <malat@debian.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Mike
 Rapoport <rppt@linux.vnet.ibm.com>, Christophe Leroy <christophe.leroy@c-s.fr>
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/kernel/pci_32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index d63be12..274bd14 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -17,7 +17,6 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/export.h>
-#include <linux/syscalls.h>
 
 #include <asm/processor.h>
 #include <asm/io.h>
