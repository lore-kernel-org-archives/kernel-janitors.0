From: Borislav Petkov <bp@suse.de>
Date: Fri, 22 Jan 2016 13:00:25 +0000
Subject: Re: [patch] x86, microcode: remove an unneeded NULL check
Message-Id: <20160122130025.GB9306@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2014 at 01:30:47PM +0300, Dan Carpenter wrote:
> "uci" is an element of the ucode_cpu_info[] array, it can't be NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
> index 15c987698b0f..05db44e4198c 100644
> --- a/arch/x86/kernel/cpu/microcode/core.c
> +++ b/arch/x86/kernel/cpu/microcode/core.c
> @@ -382,7 +382,7 @@ static enum ucode_state microcode_init_cpu(int cpu, bool refresh_fw)
>  	enum ucode_state ustate;
>  	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
>  
> -	if (uci && uci->valid)
> +	if (uci->valid)
>  		return UCODE_OK;
>  
>  	if (collect_cpu_info(cpu))

Applied, after almost 2 years!

Thanks.

-- 
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton, HRB 21284 (AG Nürnberg)
-- 
