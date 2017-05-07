From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 14:38:36 +0000
Subject: [PATCH] powerpc/mm: Use seq_putc() in two functions
Message-Id: <98cb37ed-adee-3e13-8501-baa500c27951@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>, Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 16:32:04 +0200

Two single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/mm/dump_hashpagetable.c   | 2 +-
 arch/powerpc/mm/dump_linuxpagetables.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/dump_hashpagetable.c b/arch/powerpc/mm/dump_hashpagetable.c
index c6b900f54c07..31d248c82f95 100644
--- a/arch/powerpc/mm/dump_hashpagetable.c
+++ b/arch/powerpc/mm/dump_hashpagetable.c
@@ -205,7 +205,7 @@ static void dump_hpte_info(struct pg_state *st, unsigned long ea, u64 v, u64 r,
 	aps_index = calculate_pagesize(st, aps, "actual");
 	if (aps_index != 2)
 		seq_printf(st->seq, "LP enc: %lx", lp);
-	seq_puts(st->seq, "\n");
+	seq_putc(st->seq, '\n');
 }
 
 
diff --git a/arch/powerpc/mm/dump_linuxpagetables.c b/arch/powerpc/mm/dump_linuxpagetables.c
index d659345a98d6..5c08de16339d 100644
--- a/arch/powerpc/mm/dump_linuxpagetables.c
+++ b/arch/powerpc/mm/dump_linuxpagetables.c
@@ -349,7 +349,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 					  st->current_flags,
 					  pg_level[st->level].num);
 
-			seq_puts(st->seq, "\n");
+			seq_putc(st->seq, '\n');
 		}
 
 		/*
-- 
2.12.2

