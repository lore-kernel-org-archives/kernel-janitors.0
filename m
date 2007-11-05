From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:12:20 +0000
Subject: [PATCH 01/12] arch/alpha: Removed duplicate includes.
Message-Id: <472F7924.1050704@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/alpha/kernel/setup.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index bd5e68c..beff629 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -58,7 +58,6 @@ static struct notifier_block alpha_panic_block = {
 #include <asm/system.h>
 #include <asm/hwrpb.h>
 #include <asm/dma.h>
-#include <asm/io.h>
 #include <asm/mmu_context.h>
 #include <asm/console.h>
 
-- 


