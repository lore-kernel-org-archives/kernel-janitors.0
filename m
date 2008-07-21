From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 21 Jul 2008 11:24:53 +0000
Subject: Re: [PATCH] x86-rest: fix sparse warnings
Message-Id: <20080721112453.GB23095@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215913730.2711.1.camel@jaswinder.satnam>
In-Reply-To: <1215913730.2711.1.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Jaswinder Singh <jaswinder@infradead.org> wrote:

> CHECK   arch/x86/mm/init_32.c
> arch/x86/mm/init_32.c:290:13: warning: symbol 'add_one_highpage_init' was not declared. Should it be static?
> arch/x86/mm/init_32.c:437:6: warning: symbol 'zap_low_mappings' was not declared. Should it be static?
> arch/x86/mm/init_32.c:774:6: warning: symbol 'free_initmem' was not declared. Should it be static?
> 
> CHECK   arch/x86/mm/fault.c
> arch/x86/mm/fault.c:581:16: warning: symbol 'do_page_fault' was not declared. Should it be static?
> 
> CHECK   arch/x86/mm/pat.c
> arch/x86/mm/pat.c:566:6: warning: symbol 'map_devmem' was not declared. Should it be static?
> arch/x86/mm/pat.c:583:6: warning: symbol 'unmap_devmem' was not declared. Should it be static?
> 
> CHECK   arch/x86/mm/pgtable_32.c
> arch/x86/mm/pgtable_32.c:115:6: warning: symbol 'set_pmd_pfn' was not declared. Should it be static?
> 
> CHECK   arch/x86/mach-default/setup.c
> arch/x86/mach-default/setup.c:19:5: warning: symbol 'no_broadcast' was not declared. Should it be static?
> 
> Signed-off-by: Jaswinder Singh <jaswinder@infradead.org>
> ---
>  arch/x86/mach-default/setup.c |    2 +-
>  include/asm-x86/pat.h         |    3 +++
>  include/asm-x86/pgtable_32.h  |    6 ++++++
>  include/asm-x86/setup.h       |    1 +
>  4 files changed, 11 insertions(+), 1 deletions(-)

please split this up too into individual commits, against tip/master. 
Cleanups are generally more manageable if they are finegrained.

	Ingo
