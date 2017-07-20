From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 20 Jul 2017 08:52:36 +0000
Subject: Re: [PATCH][next] x86/hyper-v: add missing void return type to hyperv_cleanup declaration
Message-Id: <20170720085236.xwer2iatjl5vjta6@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719090859.9248-1-colin.king@canonical.com>
In-Reply-To: <20170719090859.9248-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


* Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Add in missing void return type, fixes sparse warning:
> "warning: 'hyperv_cleanup()' has implicit return type"
> 
> Fixes: 2e252fbf777d ("x86/hyper-v: include hyperv/ only when CONFIG_HYPERV is set")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/include/asm/mshyperv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> index 01b9c0fb3aab..41fae263f8fa 100644
> --- a/arch/x86/include/asm/mshyperv.h
> +++ b/arch/x86/include/asm/mshyperv.h
> @@ -178,7 +178,7 @@ void hyperv_cleanup(void);
>  #else /* CONFIG_HYPERV */
>  static inline void hyperv_init(void) {}
>  static inline bool hv_is_hypercall_page_setup(void) { return false; }
> -static inline hyperv_cleanup(void) {}
> +static inline void hyperv_cleanup(void) {}
>  #endif /* CONFIG_HYPERV */

Guys, Greg, could we please move this commit from the drivers tree:

  2e252fbf777d: x86/hyper-v: include hyperv/ only when CONFIG_HYPERV is set

  arch/x86/Kbuild                 | 2 +-
  arch/x86/include/asm/mshyperv.h | 7 ++++++-

... to the x86 tree where it belongs?

Thanks,

	Ingo
