From: Dave Hansen <dave.hansen@intel.com>
Date: Mon, 28 Sep 2020 17:59:36 +0000
Subject: Re: [PATCH] x86/mm: drop superfluous initialization
Message-Id: <1d376c1f-2f14-5c29-671e-ca59853fa4a4@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928100004.25674-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200928100004.25674-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On 9/28/20 3:00 AM, Lukas Bulwahn wrote:
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index c7a47603537f..5632f02146ca 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -609,7 +609,7 @@ static void __init memory_map_top_down(unsigned long map_start,
>  	step_size = PMD_SIZE;
>  	max_pfn_mapped = 0; /* will get exact value next */
>  	min_pfn_mapped = real_end >> PAGE_SHIFT;
> -	last_start = start = real_end;
> +	last_start = real_end;

Thanks for finding this.

This becomes even more obviously correct if we just move the 'start'
declaration into the while() loop.  If we do that, it puts the three
assignment locations right next to the definition, and its trivial to
spot that the initialization was not missed:

        while (last_start > map_start) {
		unsigned long start;

                if (last_start > step_size) {
                        start = round_down(last_start - 1, step_size);
                        if (start < map_start)
                                start = map_start;
                } else
                        start = map_start;
		...

Either way, your patch looks correct to me:

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
