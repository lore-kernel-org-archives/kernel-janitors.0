From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 19:52:59 +0000
Subject: [PATCH] x86/intel_rdt: Use seq_putc() in show_doms()
Message-Id: <65b43e5d-5721-8628-f77a-e39010d35f9a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Fenghua Yu <fenghua.yu@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 21:45:38 +0200

Two single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/kernel/cpu/intel_rdt_schemata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel_rdt_schemata.c b/arch/x86/kernel/cpu/intel_rdt_schemata.c
index 406d7a6532f9..6202fd4f0f5f 100644
--- a/arch/x86/kernel/cpu/intel_rdt_schemata.c
+++ b/arch/x86/kernel/cpu/intel_rdt_schemata.c
@@ -256,12 +256,12 @@ static void show_doms(struct seq_file *s, struct rdt_resource *r, int closid)
 	seq_printf(s, "%*s:", max_name_width, r->name);
 	list_for_each_entry(dom, &r->domains, list) {
 		if (sep)
-			seq_puts(s, ";");
+			seq_putc(s, ';');
 		seq_printf(s, r->format_str, dom->id, max_data_width,
 			   dom->ctrl_val[closid]);
 		sep = true;
 	}
-	seq_puts(s, "\n");
+	seq_putc(s, '\n');
 }
 
 int rdtgroup_schemata_show(struct kernfs_open_file *of,
-- 
2.12.2

