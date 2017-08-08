From: Colin King <colin.king@canonical.com>
Date: Tue, 08 Aug 2017 09:28:59 +0000
Subject: [PATCH][next] x86/intel_rdt: remove redundant ternary operator on return
Message-Id: <20170808092859.13021-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The use of the ternary operator is redundant as ret can never be
non-zero at that point. Instead, just return nbytes.

Detected by CoverityScan, CID#1452658 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
index 2621ae3f07fc..39006f36e695 100644
--- a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
+++ b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
@@ -680,7 +680,7 @@ static ssize_t max_threshold_occ_write(struct kernfs_open_file *of,
 
 	intel_cqm_threshold = bytes / r->mon_scale;
 
-	return ret ?: nbytes;
+	return nbytes;
 }
 
 /* rdtgroup information files for one cache resource. */
-- 
2.11.0

