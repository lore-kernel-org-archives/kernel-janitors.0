From: Nathan Chancellor <natechancellor@gmail.com>
Date: Mon, 28 Sep 2020 20:43:46 +0000
Subject: Re: [PATCH -next for tip:x86/pti] x86/tlb: drop unneeded local vars in enable_l1d_flush_for_task()
Message-Id: <20200928204346.GA953199@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200928124457.27289-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Balbir Singh <sblbir@amazon.com>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On Mon, Sep 28, 2020 at 02:44:57PM +0200, Lukas Bulwahn wrote:
> Commit b6724f118d44 ("prctl: Hook L1D flushing in via prctl") checks the
> validity for enable_l1d_flush_for_task() and introduces some superfluous
> local variables for that implementation.
> 
> make clang-analyzer on x86_64 tinyconfig caught my attention with:
> 
>   arch/x86/mm/tlb.c:332:2: warning: Value stored to 'cpu' is never read \
>   [clang-analyzer-deadcode.DeadStores]
> 
> Compilers will detect these superfluous local variables and assignment and
> optimize this anyway. So, the resulting binary is identical before and
> after this change.
> 
> Simplify the code and remove superfluous local variables to make
> clang-analyzer happy.
> 
> No functional change. No change in binary with supported compilers.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> applies cleanly on next-20200925
> 
> Balbir, please review and ack.
> Thomas, please pick this minor non-urgent clean-up patch into the x86/pti
> branch of tip as follow-up to: 
> https://lore.kernel.org/lkml/160026187842.15536.285514864386042510.tip-bot2@tip-bot2/
> 
> I quickly confirmed that the binary did not change with this change to the
> source code; The hash of tlb.o remained the same before and after the change.
> 
> So, in my setup:
> md5sum tlb.o
> 7c7e096bab0fd87bd2c8437d8c7dc3fa  tlb.o
> 
> linux-safety, please verify and validate this change.
> 
>  arch/x86/mm/tlb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 6b0f4c88b07c..90515c04d90a 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -316,7 +316,7 @@ EXPORT_SYMBOL_GPL(leave_mm);
>  
>  int enable_l1d_flush_for_task(struct task_struct *tsk)
>  {
> -	int cpu, ret = 0, i;
> +	int i;
>  
>  	/*
>  	 * Do not enable L1D_FLUSH_OUT if
> @@ -329,7 +329,7 @@ int enable_l1d_flush_for_task(struct task_struct *tsk)
>  			!static_cpu_has(X86_FEATURE_FLUSH_L1D))
>  		return -EINVAL;
>  
> -	cpu = get_cpu();
> +	get_cpu();
>  
>  	for_each_cpu(i, &tsk->cpus_mask) {
>  		if (cpu_data(i).smt_active = true) {
> @@ -340,7 +340,7 @@ int enable_l1d_flush_for_task(struct task_struct *tsk)
>  
>  	set_ti_thread_flag(&tsk->thread_info, TIF_SPEC_L1D_FLUSH);
>  	put_cpu();
> -	return ret;
> +	return 0;
>  }
>  
>  int disable_l1d_flush_for_task(struct task_struct *tsk)
> -- 
> 2.17.1
> 
