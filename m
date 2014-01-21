From: Borislav Petkov <bp@alien8.de>
Date: Tue, 21 Jan 2014 10:02:57 +0000
Subject: Re: [patch] x86, AMD, NB: silence an underflow test
Message-Id: <20140121100257.GB9004@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140121072209.GA22095@elgon.mountain>
In-Reply-To: <20140121072209.GA22095@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Daniel J Blueman <daniel@numascale-asia.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 21, 2014 at 10:22:09AM +0300, Dan Carpenter wrote:
> This is under CAP_SYS_ADMIN but Smatch complains that mask comes from

"Smatch complains..." - you sound just like a politician - something
inanimate and abstract complains that something's wrong - I'm not to
blame, I'm innocent!

Not "amd_set_subcaches should hand down an unsigned long like it was
originally indended but then bugged into an int..."

:-) :-) :-)

> the user and the test for "mask > 0xf" can underflow.  The fix is
> simple.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

In any case:

Acked-by: Borislav Petkov <bp@suse.de>

Thanks!

> diff --git a/arch/x86/include/asm/amd_nb.h b/arch/x86/include/asm/amd_nb.h
> index a54ee1d054d9..0c4e3e47d462 100644
> --- a/arch/x86/include/asm/amd_nb.h
> +++ b/arch/x86/include/asm/amd_nb.h
> @@ -19,7 +19,7 @@ extern int amd_cache_northbridges(void);
>  extern void amd_flush_garts(void);
>  extern int amd_numa_init(void);
>  extern int amd_get_subcaches(int);
> -extern int amd_set_subcaches(int, int);
> +extern int amd_set_subcaches(int, unsigned long);
>  
>  struct amd_l3_cache {
>  	unsigned indices;
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index 59554dca96ec..d9fceb697322 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -179,7 +179,7 @@ int amd_get_subcaches(int cpu)
>  	return (mask >> (4 * cuid)) & 0xf;
>  }
>  
> -int amd_set_subcaches(int cpu, int mask)
> +int amd_set_subcaches(int cpu, unsigned long mask)
>  {
>  	static unsigned int reset, ban;
>  	struct amd_northbridge *nb = node_to_amd_nb(amd_get_nb_id(cpu));
> 

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
