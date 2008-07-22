From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Jul 2008 16:44:48 +0000
Subject: [PATCH 2/2] : Add local_irq_restore in error handling code
Message-Id: <Pine.LNX.4.64.0807221844250.2670@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There is a call to local_irq_restore in the normal exit case, so it would
seem that there should be one on an error return as well.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression l;
expression E,E1,E2;
@@

local_irq_save(l);
... when != local_irq_restore(l)
    when != spin_unlock_irqrestore(E,l)
    when any
    when strict
(
if (...) { ... when != local_irq_restore(l)
               when != spin_unlock_irqrestore(E1,l)
+   local_irq_restore(l);
    return ...;
}
|
if (...)
+   {local_irq_restore(l);
    return ...;
+   }
|
spin_unlock_irqrestore(E2,l);
|
local_irq_restore(l);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/mips/mm/tlb-r3k.c        |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index a782549..7d7e822 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -247,6 +247,7 @@ void __init add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
 		w = read_c0_wired();
 		write_c0_wired(w + 1);
 		if (read_c0_wired() != w + 1) {
+			local_irq_restore(flags);
 			printk("[tlbwired] No WIRED reg?\n");
 			return;
 		}
