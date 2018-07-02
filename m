From: Liam Merwick <liam.merwick@oracle.com>
Date: Mon, 02 Jul 2018 15:57:43 +0000
Subject: Re: [PATCH] kvmclock: remove redundant variable 'size'
Message-Id: <36bf55ec-1937-6c3c-49fc-329a1309a815@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702070623.4769-1-colin.king@canonical.com>
In-Reply-To: <20180702070623.4769-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 02/07/18 08:06, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable size is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
> 

Is it worth adding

Fixes: cc1e24fdb064 ("x86/vdso: Remove pvclock fixmap machinery")

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

either way

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>

> ---
>   arch/x86/kernel/kvmclock.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> index bf8d1eb7fca3..45c22ce941c1 100644
> --- a/arch/x86/kernel/kvmclock.c
> +++ b/arch/x86/kernel/kvmclock.c
> @@ -354,13 +354,10 @@ int __init kvm_setup_vsyscall_timeinfo(void)
>   	int cpu;
>   	u8 flags;
>   	struct pvclock_vcpu_time_info *vcpu_time;
> -	unsigned int size;
>   
>   	if (!hv_clock)
>   		return 0;
>   
> -	size = PAGE_ALIGN(sizeof(struct pvclock_vsyscall_time_info)*NR_CPUS);
> -
>   	cpu = get_cpu();
>   
>   	vcpu_time = &hv_clock[cpu].pvti;
> 
