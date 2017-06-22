From: Borislav Petkov <bp@alien8.de>
Date: Thu, 22 Jun 2017 09:05:13 +0000
Subject: Re: [PATCH] x86/microcode/intel: make pointer intel_ucode_patch static
Message-Id: <20170622090513.juhp6tqhl2phap3g@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622084940.10286-1-colin.king@canonical.com>
In-Reply-To: <20170622084940.10286-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 22, 2017 at 09:49:40AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer intel_ucode_patch does not need to be in global scope,
> so make it static.
> 
> Cleans up sparse warning:
> "symbol 'intel_ucode_patch' was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kernel/cpu/microcode/intel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
> index d525a0bd7d28..59edbe9d4ccb 100644
> --- a/arch/x86/kernel/cpu/microcode/intel.c
> +++ b/arch/x86/kernel/cpu/microcode/intel.c
> @@ -42,7 +42,7 @@
>  static const char ucode_path[] = "kernel/x86/microcode/GenuineIntel.bin";
>  
>  /* Current microcode patch used in early patching on the APs. */
> -struct microcode_intel *intel_ucode_patch;
> +static struct microcode_intel *intel_ucode_patch;
>  
>  static inline bool cpu_signatures_match(unsigned int s1, unsigned int p1,
>  					unsigned int s2, unsigned int p2)
> -- 

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
