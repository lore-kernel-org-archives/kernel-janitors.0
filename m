From: Borislav Petkov <bp@alien8.de>
Date: Sun, 15 Oct 2017 20:46:06 +0000
Subject: Re: [PATCH] x86/intel_cacheinfo: remove redundant assignment to this_leaf
Message-Id: <20171015204606.gs67hxz32g4skjca@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171015160203.12332-1-colin.king@canonical.com>
In-Reply-To: <20171015160203.12332-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Oct 15, 2017 at 05:02:03PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable this_leaf is being assigned a value that is never
> read and it is being updated a little later with a newer value,
> hence we can remove the redundant assignment.
> 
> Cleans up clang warning: Value stored to 'this_leaf' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kernel/cpu/intel_cacheinfo.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/intel_cacheinfo.c b/arch/x86/kernel/cpu/intel_cacheinfo.c
> index 24f749324c0f..9990a71e311f 100644
> --- a/arch/x86/kernel/cpu/intel_cacheinfo.c
> +++ b/arch/x86/kernel/cpu/intel_cacheinfo.c
> @@ -831,7 +831,6 @@ static int __cache_amd_cpumap_setup(unsigned int cpu, int index,
>  	} else if (boot_cpu_has(X86_FEATURE_TOPOEXT)) {
>  		unsigned int apicid, nshared, first, last;
>  
> -		this_leaf = this_cpu_ci->info_list + index;
>  		nshared = base->eax.split.num_threads_sharing + 1;
>  		apicid = cpu_data(cpu).apicid;
>  		first = apicid - (apicid % nshared);
> -- 

Looks ok to me.

Reviewed-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
