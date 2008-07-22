From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 22 Jul 2008 17:10:06 +0000
Subject: Re: [PATCH 2/2] : Add local_irq_restore in error handling code
Message-Id: <20080722171006.GA32742@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807221844250.2670@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807221844250.2670@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

On Tue, Jul 22, 2008 at 06:44:48PM +0200, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> There is a call to local_irq_restore in the normal exit case, so it would
> seem that there should be one on an error return as well.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)

Correctly spotted - but I decieded to go for below patch instead.

Thanks,

  Ralf

From: Ralf Baechle <ralf@linux-mips.org>

[MIPS] tlb-r4k: Nuke broken paranoia error test.

Bug originally found and reported by Julia Lawall <julia@diku.dk>.  I
decieded that the whole error check was mostly useless paranoia and should
be discarded.  It would only ever trigger if r3k_have_wired_reg has a wrong
value.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index a782549..f0cf46a 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -246,10 +246,6 @@ void __init add_wired_entry(unsigned long entrylo0, unsigned long entrylo1,
 		old_pagemask = read_c0_pagemask();
 		w = read_c0_wired();
 		write_c0_wired(w + 1);
-		if (read_c0_wired() != w + 1) {
-			printk("[tlbwired] No WIRED reg?\n");
-			return;
-		}
 		write_c0_index(w << 8);
 		write_c0_pagemask(pagemask);
 		write_c0_entryhi(entryhi);
