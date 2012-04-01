From: Emil Goode <emilgoode@gmail.com>
Date: Sun, 01 Apr 2012 14:18:11 +0000
Subject: Disregard my patch: x86, vsyscall: Fix sparse warning: Using plain integer as NULL
Message-Id: <1333289891.2531.5.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Please disregard my previous patch. 
I missed the comment saying "0 is a valid user pointer".

Best regards,
Emil Goode

On Sun, 2012-04-01 at 01:59 +0200, Emil Goode wrote:
> This patch silences the following sparse warning:
> arch/x86/kernel/vsyscall_64.c:250:34:
>        warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
>  arch/x86/kernel/vsyscall_64.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/x86/kernel/vsyscall_64.c b/arch/x86/kernel/vsyscall_64.c
> index f386dc4..6170ff9 100644
> --- a/arch/x86/kernel/vsyscall_64.c
> +++ b/arch/x86/kernel/vsyscall_64.c
> @@ -247,7 +247,7 @@ bool emulate_vsyscall(struct pt_regs *regs, unsigned long address)
>  
>  		ret = sys_getcpu((unsigned __user *)regs->di,
>  				 (unsigned __user *)regs->si,
> -				 0);
> +				 NULL);
>  		break;
>  	}
>  


