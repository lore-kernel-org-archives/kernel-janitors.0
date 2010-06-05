From: Richard Weinberger <richard@nod.at>
Date: Sat, 05 Jun 2010 21:28:36 +0000
Subject: [PATCH] APIC: Remove unused variable
Message-Id: <1275773316-21626-1-git-send-email-richard@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100605211943.GN5483@bicker>
In-Reply-To: <20100605211943.GN5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: mingo@redhat.com, hpa@zytor.com, x86@kernel.org, rakib.mullick@gmail.com, ebiederm@xmission.com, gorcunov@openvz.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>

base is never used in this file.
---
 arch/x86/kernel/apic/es7000_32.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/apic/es7000_32.c b/arch/x86/kernel/apic/es7000_32.c
index 425e53a..770262b 100644
--- a/arch/x86/kernel/apic/es7000_32.c
+++ b/arch/x86/kernel/apic/es7000_32.c
@@ -125,12 +125,6 @@ static unsigned long			host_addr;
 
 int					es7000_plat;
 
-/*
- * GSI override for ES7000 platforms.
- */
-
-static unsigned int			base;
-
 static int __cpuinit wakeup_secondary_cpu_via_mip(int cpu, unsigned long eip)
 {
 	unsigned long vect = 0, psaival = 0;
-- 
1.6.6.1

