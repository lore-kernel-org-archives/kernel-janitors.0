From: "Hannes Eder" <hannes@hanneseder.net>
Date: Fri, 21 Nov 2008 22:17:09 +0000
Subject: [PATCH] x86: vmware - fix sparse warnings
Message-Id: <154e089b0811211417l7c6c5cf8j7e248399fa7ebd20@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alok N Kataria <akataria@vmware.com>, Dan Hecht <dhecht@vmware.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the following sparse warnings:

arch/x86/kernel/cpu/vmware.c:69:5: warning: symbol 'vmware_platform'
was not declared. Should it be static?
arch/x86/kernel/cpu/vmware.c:89:15: warning: symbol
'vmware_get_tsc_khz' was not declared. Should it be static?
arch/x86/kernel/cpu/vmware.c:107:16: warning: symbol
'vmware_set_feature_bits' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/kernel/cpu/vmware.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c034bda..284c399 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -23,6 +23,7 @@

 #include <linux/dmi.h>
 #include <asm/div64.h>
+#include <asm/vmware.h>

 #define CPUID_VMWARE_INFO_LEAF	0x40000000
 #define VMWARE_HYPERVISOR_MAGIC	0x564D5868
-- 
1.5.6.3
