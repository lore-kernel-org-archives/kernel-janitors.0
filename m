From: Joe Perches <joe@perches.com>
Date: Thu, 24 Aug 2017 21:02:44 +0000
Subject: Re: [PATCH v2] x86/microcode: Silence a static checker warning
Message-Id: <1503608564.12569.15.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822211335.r7wcfcisdlq2xwgz@pd.tnic>
         <20170824201557.ev4ebslf6sg6xmne@mwanda>
         <20170824204714.jedeaphwmou5qafd@pd.tnic>
In-Reply-To: <20170824204714.jedeaphwmou5qafd@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2017-08-24 at 22:47 +0200, Borislav Petkov wrote:
> On Thu, Aug 24, 2017 at 11:15:57PM +0300, Dan Carpenter wrote:
> > The code here prints an error if "p" is an error pointer but it still
> > dereferences it at the end of the function when it does:
> > 
> > 	intel_ucode_patch = (struct microcode_intel *)__pa_nodebug(p->data);
> > 
> > We can just return early instead.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: return early instead checking for IS_ERR_OR_NULL() at the end.
> > 
> > We have to keep the final check whether "p" is NULL to handle the
> > situation were we set "prev_found = true;" but then hit the continue
> > statement instead of allocating "p".
> 
> I think we want to something more like this (not exit the loop if the
> allocation fails). But I need to look at the again on a clear head:a
> 
> ---
> diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
[]
> @@ -146,7 +146,7 @@ static bool microcode_matches(struct microcode_header_intel *mc_header,
>  	return false;
>  }
>  
> -static struct ucode_patch *__alloc_microcode_buf(void *data, unsigned int size)
> +static struct ucode_patch *memdup_patch(void *data, unsigned int size)
>  {
>  	struct ucode_patch *p;
>  
> @@ -183,11 +183,13 @@ static void save_microcode_patch(void *data, unsigned int size)
>  			if (mc_hdr->rev <= mc_saved_hdr->rev)
>  				continue;
>  
> -			p = __alloc_microcode_buf(data, size);
> -			if (IS_ERR(p))
> +			p = memdup_patch(data, size);
> +			if (IS_ERR(p)) {
>  				pr_err("Error allocating buffer %p\n", data);

The pr_err could also be deleted as memdup_patch also
just does normal allocations without __GFP_NOWARN so
dump_stack() still would occur.

