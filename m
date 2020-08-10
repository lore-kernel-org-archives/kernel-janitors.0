From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 07:55:08 +0000
Subject: [PATCH] x86/resctrl: fix spelling mistake "Could't" -> "Couldn't"
Message-Id: <20200810075508.46490-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in pr_warn messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/resctrl/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 6a9df71c1b9e..98606689f5ca 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -562,7 +562,7 @@ static void domain_add_cpu(int cpu, struct rdt_resource *r)
 
 	d = rdt_find_domain(r, id, &add_pos);
 	if (IS_ERR(d)) {
-		pr_warn("Could't find cache id for cpu %d\n", cpu);
+		pr_warn("Couldn't find cache id for cpu %d\n", cpu);
 		return;
 	}
 
@@ -607,7 +607,7 @@ static void domain_remove_cpu(int cpu, struct rdt_resource *r)
 
 	d = rdt_find_domain(r, id, NULL);
 	if (IS_ERR_OR_NULL(d)) {
-		pr_warn("Could't find cache id for cpu %d\n", cpu);
+		pr_warn("Couldn't find cache id for cpu %d\n", cpu);
 		return;
 	}
 
-- 
2.27.0
