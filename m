From: "Hannes Eder" <hannes@hanneseder.net>
Date: Fri, 21 Nov 2008 21:56:17 +0000
Subject: [PATCH] x86: hypervisor - fix sparse warnings
Message-Id: <154e089b0811211356y79981d6cke1ea8bf3eddf7e50@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alok N Kataria <akataria@vmware.com>, Dan Hecht <dhecht@vmware.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the following sparse warnings:

arch/x86/kernel/cpu/hypervisor.c:37:15: warning: symbol
'get_hypervisor_tsc_freq' was not declared. Should it be static?
arch/x86/kernel/cpu/hypervisor.c:53:16: warning: symbol
'init_hypervisor' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/kernel/cpu/hypervisor.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/cpu/hypervisor.c b/arch/x86/kernel/cpu/hypervisor.c
index 35ae2b7..fb5b86a 100644
--- a/arch/x86/kernel/cpu/hypervisor.c
+++ b/arch/x86/kernel/cpu/hypervisor.c
@@ -23,6 +23,7 @@

 #include <asm/processor.h>
 #include <asm/vmware.h>
+#include <asm/hypervisor.h>

 static inline void __cpuinit
 detect_hypervisor_vendor(struct cpuinfo_x86 *c)
-- 
1.5.6.3
