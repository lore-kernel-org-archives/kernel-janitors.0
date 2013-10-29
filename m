From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:16:16 +0000
Subject: Re: [PATCH 11/14] JANITOR: Remove #include <linux/sys.h> from X86
Message-Id: <20131029101616.GO14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131029100747.GK14214@nbf-011.seri.co.uk>
In-Reply-To: <20131029100747.GK14214@nbf-011.seri.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is of course 12/14 (as can be seen below), not 11/14, my bad
for hand editing the subject line, sorry for noise!

--MiKu

On Tue, Oct 29, 2013 at 10:07:47AM +0000, Mika Kukkonen wrote:
> 
> From 3fede68a4fe9210df37e3d654fda9264e394c7a7 Mon Sep 17 00:00:00 2001
> From: Mika Kukkonen <m.kukkonen@samsung.com>
> Date: Tue, 29 Oct 2013 09:29:01 +0200
> Subject: [PATCH 12/14] 12/14 JANITOR: Remove <linux/sys.h> from X86
> 
> 	Remove #include from files:
> 		arch/x86/ia32/syscall_ia32.c
> 		arch/x86/kernel/syscall_32.c
> 		arch/x86/kernel/syscall_64.c
> 		arch/x86/um/sys_call_table_32.c
> 		arch/x86/um/sys_call_table_64.c
> 
> Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
> ---
>  arch/x86/ia32/syscall_ia32.c    | 1 -
>  arch/x86/kernel/syscall_32.c    | 1 -
>  arch/x86/kernel/syscall_64.c    | 1 -
>  arch/x86/um/sys_call_table_32.c | 1 -
>  arch/x86/um/sys_call_table_64.c | 1 -
>  5 files changed, 5 deletions(-)
> 
> diff --git a/arch/x86/ia32/syscall_ia32.c b/arch/x86/ia32/syscall_ia32.c
> index 4754ba0..44622f5 100644
> --- a/arch/x86/ia32/syscall_ia32.c
> +++ b/arch/x86/ia32/syscall_ia32.c
> @@ -1,7 +1,6 @@
>  /* System call table for ia32 emulation. */
>  
>  #include <linux/linkage.h>
> -#include <linux/sys.h>
>  #include <linux/cache.h>
>  #include <asm/asm-offsets.h>
>  
> diff --git a/arch/x86/kernel/syscall_32.c b/arch/x86/kernel/syscall_32.c
> index e9bcd57..b0f8c45 100644
> --- a/arch/x86/kernel/syscall_32.c
> +++ b/arch/x86/kernel/syscall_32.c
> @@ -1,7 +1,6 @@
>  /* System call table for i386. */
>  
>  #include <linux/linkage.h>
> -#include <linux/sys.h>
>  #include <linux/cache.h>
>  #include <asm/asm-offsets.h>
>  
> diff --git a/arch/x86/kernel/syscall_64.c b/arch/x86/kernel/syscall_64.c
> index 4ac730b..9039b97 100644
> --- a/arch/x86/kernel/syscall_64.c
> +++ b/arch/x86/kernel/syscall_64.c
> @@ -1,7 +1,6 @@
>  /* System call table for x86-64. */
>  
>  #include <linux/linkage.h>
> -#include <linux/sys.h>
>  #include <linux/cache.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/syscall.h>
> diff --git a/arch/x86/um/sys_call_table_32.c b/arch/x86/um/sys_call_table_32.c
> index 531d426..68bf507 100644
> --- a/arch/x86/um/sys_call_table_32.c
> +++ b/arch/x86/um/sys_call_table_32.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <linux/linkage.h>
> -#include <linux/sys.h>
>  #include <linux/cache.h>
>  #include <generated/user_constants.h>
>  
> diff --git a/arch/x86/um/sys_call_table_64.c b/arch/x86/um/sys_call_table_64.c
> index f2f0723..6ba45d6 100644
> --- a/arch/x86/um/sys_call_table_64.c
> +++ b/arch/x86/um/sys_call_table_64.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <linux/linkage.h>
> -#include <linux/sys.h>
>  #include <linux/cache.h>
>  #include <generated/user_constants.h>
>  
> -- 
> 1.8.3.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
