From: Colin King <colin.king@canonical.com>
Date: Tue, 08 Aug 2017 10:45:09 +0000
Subject: [PATCH][next] x86/intel_rdt: remove redundant assignment to files
Message-Id: <20170808104509.14198-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170808092859.13021-1-colin.king@canonical.com>
In-Reply-To: <20170808092859.13021-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable files is assigned twice, the first assignment
is redundant and can be removed.

Detected by CoverityScan, CID#1452634 ("Unused value")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
index 39006f36e695..0d3b14444483 100644
--- a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
+++ b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
@@ -1560,7 +1560,6 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
 	if (ret)
 		goto out_destroy;
 
-	files = RFTYPE_BASE | RFTYPE_CTRL;
 	files = RFTYPE_BASE | BIT(RF_CTRLSHIFT + rtype);
 	ret = rdtgroup_add_files(kn, files);
 	if (ret)
-- 
2.11.0

