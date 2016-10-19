From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 20:49:45 +0000
Subject: [PATCH 4/5] blackfin-setup: Replace three seq_printf() calls by seq_puts() in show_cpuinfo()
Message-Id: <68ec4f90-f98d-6b55-40a3-939a664c64dc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
In-Reply-To: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 21:46:16 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/blackfin/kernel/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/blackfin/kernel/setup.c b/arch/blackfin/kernel/setup.c
index a159008..fdd9168 100644
--- a/arch/blackfin/kernel/setup.c
+++ b/arch/blackfin/kernel/setup.c
@@ -1313,9 +1313,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	if (bfin_revid() != bfin_compiled_revid()) {
 		if (bfin_compiled_revid() = -1)
-			seq_printf(m, "(Compiled for Rev none)");
+			seq_puts(m, "(Compiled for Rev none)");
 		else if (bfin_compiled_revid() = 0xffff)
-			seq_printf(m, "(Compiled for Rev any)");
+			seq_puts(m, "(Compiled for Rev any)");
 		else
 			seq_printf(m, "(Compiled for Rev %d)", bfin_compiled_revid());
 	}
@@ -1385,7 +1385,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "icache setup\t: %d Sub-banks/%d Ways, %d Lines/Way\n",
 			   BFIN_ISUBBANKS, BFIN_IWAYS, BFIN_ILINES);
 	else
-		seq_printf(m, "icache setup\t: off\n");
+		seq_puts(m, "icache setup\t: off\n");
 
 	seq_printf(m,
 		   "dcache setup\t: %d Super-banks/%d Sub-banks/%d Ways, %d Lines/Way\n",
-- 
2.10.1

