From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 20:35:39 +0000
Subject: [PATCH] arm: Storage class should be before const qualifier
Message-Id: <20090209203539.GA5610@xenon.distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning of the
declaration specifiers in a declaration is an obsolescent feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/arm/kernel/machine_kexec.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index 440dc62..598ca61 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -13,8 +13,8 @@
 #include <asm/cacheflush.h>
 #include <asm/mach-types.h>
 
-const extern unsigned char relocate_new_kernel[];
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned char relocate_new_kernel[];
+extern const unsigned int relocate_new_kernel_size;
 
 extern void setup_mm_for_reboot(char mode);
 
-- 
1.5.6.5

