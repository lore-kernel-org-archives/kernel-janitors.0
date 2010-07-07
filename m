From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Wed, 07 Jul 2010 23:51:59 +0000
Subject: [PATCH] kernel/apic/es700_32: Remove unused variable
Message-Id: <1278546719.9020.4.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hello,

In today linux-next I got this compile warning:

arch/x86/kernel/apic/es7000_32.c:132: warning: ‘base’ defined but not used

Current patch solves the issue removing the unused variable

Thanks a lot

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 arch/x86/kernel/apic/es7000_32.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/apic/es7000_32.c b/arch/x86/kernel/apic/es7000_32.c
index 425e53a..8593582 100644
--- a/arch/x86/kernel/apic/es7000_32.c
+++ b/arch/x86/kernel/apic/es7000_32.c
@@ -129,7 +129,6 @@ int					es7000_plat;
  * GSI override for ES7000 platforms.
  */
 
-static unsigned int			base;
 
 static int __cpuinit wakeup_secondary_cpu_via_mip(int cpu, unsigned long eip)
 {
-- 
1.7.0.4



