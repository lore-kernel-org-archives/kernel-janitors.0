From: Colin King <colin.king@canonical.com>
Date: Sat, 28 Apr 2018 09:24:48 +0000
Subject: [PATCH] x86: apm: fix spelling mistake: "caculate" -> "calculate"
Message-Id: <20180428092448.6493-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in module parameter description text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/apm_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
index dfcbe6924eaf..6b345f35f023 100644
--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -2446,7 +2446,7 @@ MODULE_PARM_DESC(idle_threshold,
 	"System idle percentage above which to make APM BIOS idle calls");
 module_param(idle_period, int, 0444);
 MODULE_PARM_DESC(idle_period,
-	"Period (in sec/100) over which to caculate the idle percentage");
+	"Period (in sec/100) over which to calculate the idle percentage");
 module_param(smp, bool, 0444);
 MODULE_PARM_DESC(smp,
 	"Set this to enable APM use on an SMP platform. Use with caution on older systems");
-- 
2.17.0

