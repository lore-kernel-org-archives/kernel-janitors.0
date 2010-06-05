From: Richard Weinberger <richard@nod.at>
Date: Sat, 05 Jun 2010 20:56:09 +0000
Subject: [PATCH] APIC: Remove unused variable
Message-Id: <1275771369-15113-1-git-send-email-richard@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: mingo@redhat.com, hpa@zytor.com, x86@kernel.org, rakib.mullick@gmail.com, ebiederm@xmission.com, gorcunov@openvz.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>

base is never used in this file.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/x86/kernel/apic/es7000_32.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/apic/es7000_32.c b/arch/x86/kernel/apic/es7000_32.c
index 425e53a..ef34391 100644
--- a/arch/x86/kernel/apic/es7000_32.c
+++ b/arch/x86/kernel/apic/es7000_32.c
@@ -129,8 +129,6 @@ int					es7000_plat;
  * GSI override for ES7000 platforms.
  */
 
-static unsigned int			base;
-
 static int __cpuinit wakeup_secondary_cpu_via_mip(int cpu, unsigned long eip)
 {
 	unsigned long vect = 0, psaival = 0;
-- 
1.6.6.1

