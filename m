From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 19 Jun 2019 18:15:03 +0000
Subject: Re: [PATCH] x86/apic: fix integer overflow on 10 bit right shift of cpu_khz
Message-Id: <00bb0b52-7a3c-24f6-50d2-9d10cfe80895@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619181325.13574-1-colin.king@canonical.com>
In-Reply-To: <20190619181325.13574-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 19/06/2019 19:13, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The right shift of unsigned int cpu_khz will overflow for large values
> of cpu_khz, so cast it to a long long before shifting it to avoid
> overvlow.  For example, this can happen when cpu_khz is 4194305 (just
> less than 4.2 GHz).  Also wrap line to avoid checkpatch wide line
> warning.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 8c3ba8d04924 ("x86, apic: ack all pending irqs when crashed/on kexec")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kernel/apic/apic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index 8956072f677d..31426126e5e0 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -1464,7 +1464,8 @@ static void apic_pending_intr_clear(void)
>  		if (queued) {
>  			if (boot_cpu_has(X86_FEATURE_TSC) && cpu_khz) {
>  				ntsc = rdtsc();
> -				max_loops = (cpu_khz << 10) - (ntsc - tsc);
> +				max_loops = ((long long)cpu_khz << 10) -
> +					    (ntsc - tsc);
>  			} else {
>  				max_loops--;
>  			}
> 
Nack. V2 coming next.
