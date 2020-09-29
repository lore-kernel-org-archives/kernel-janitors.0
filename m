From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 29 Sep 2020 08:42:15 +0000
Subject: Re: [PATCH] x86/mm: drop superfluous initialization
Message-Id: <alpine.DEB.2.21.2009291034160.17656@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928100004.25674-1-lukas.bulwahn@gmail.com> <1d376c1f-2f14-5c29-671e-ca59853fa4a4@intel.com>
In-Reply-To: <1d376c1f-2f14-5c29-671e-ca59853fa4a4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Hansen <dave.hansen@intel.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech



On Mon, 28 Sep 2020, Dave Hansen wrote:

> On 9/28/20 3:00 AM, Lukas Bulwahn wrote:
> > diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> > index c7a47603537f..5632f02146ca 100644
> > --- a/arch/x86/mm/init.c
> > +++ b/arch/x86/mm/init.c
> > @@ -609,7 +609,7 @@ static void __init memory_map_top_down(unsigned long map_start,
> >  	step_size = PMD_SIZE;
> >  	max_pfn_mapped = 0; /* will get exact value next */
> >  	min_pfn_mapped = real_end >> PAGE_SHIFT;
> > -	last_start = start = real_end;
> > +	last_start = real_end;
> 
> Thanks for finding this.
> 
> This becomes even more obviously correct if we just move the 'start'
> declaration into the while() loop.  If we do that, it puts the three
> assignment locations right next to the definition, and its trivial to
> spot that the initialization was not missed:
> 
>         while (last_start > map_start) {
> 		unsigned long start;
> 
>                 if (last_start > step_size) {
>                         start = round_down(last_start - 1, step_size);
>                         if (start < map_start)
>                                 start = map_start;
>                 } else
>                         start = map_start;
> 		...
>

Agree, this point is simply a question of style:

Shall local variables be defined as "local" as possible or simply 
consistently at the beginning of each function?

If there are no strong opinions of style, I would just keep this patch 
as-is.

> Either way, your patch looks correct to me:
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> 

Thanks for the Ack.

Lukas
