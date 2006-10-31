From: walter harms <wharms@bfs.de>
Date: Tue, 31 Oct 2006 10:19:30 +0000
Subject: Re: [KJ] clean the definition of HANDLE_STACK
Message-Id: <45472332.6040402@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aac3c260610301129w6f83c555yaea4eb5e8200ea2@mail.gmail.com>
In-Reply-To: <2aac3c260610301129w6f83c555yaea4eb5e8200ea2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

does it make sense to have a comment inside a macro ?
nobody will see it since the cpp will remove comments. it make the handling of the
macro harder because it is also large.
i would like to see a comment describing the macro in front it. removing the
comment inside.

just my to cents,

re,
 wh




Giangiacomo Mariotti wrote:
> I'm reposting my previous patch because I changed my e-mail address,so
> if there
> is any problem with it you have my new address.I put the patch in line
> and as a  plain text attachment.I hope this new e-mail works better
> than the previous one to post code on mailing lists.
> 
> Description: clean the definition of HANDLE_STACK in
> arch/x86_64/kernel/traps.c
>                    because it's syntax is misleading.
> Signed-off-by: Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com>
> 
>> From cadb09c6ef0cf2874b1ed3813ea32848cb8c479c Mon Sep 17 00:00:00 2001
> From: Giangiacomo Mariotti <giangiacomo_mariotti@yahoo.com>
> Date: Sun, 29 Oct 2006 16:22:03 +0100
> Subject: [PATCH] cleaning of HANDLE_STACK definition
> 
> ---
> arch/x86_64/kernel/traps.c |   32 ++++++++++++++++++--------------
> 1 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86_64/kernel/traps.c b/arch/x86_64/kernel/traps.c
> index 7819022..5573a21 100644
> --- a/arch/x86_64/kernel/traps.c
> +++ b/arch/x86_64/kernel/traps.c
> @@ -297,20 +297,24 @@ void dump_trace(struct task_struct *tsk,
>      * iteration will eventually trigger.
>      */
> #define HANDLE_STACK(cond) \
> -    do while (cond) { \
> -        unsigned long addr = *stack++; \
> -        if (oops_in_progress ?         \
> -            __kernel_text_address(addr) : \
> -            kernel_text_address(addr)) { \
> -            /* \
> -             * If the address is either in the text segment of the \
> -             * kernel, or in the region which contains vmalloc'ed \
> -             * memory, it *may* be the address of a calling \
> -             * routine; if so, print it so that someone tracing \
> -             * down the cause of the crash will be able to figure \
> -             * out the call path that was taken. \
> -             */ \
> -            ops->address(data, addr);   \
> +    do { \
> +        while (cond) { \
> +            unsigned long addr = *stack++; \
> +            if (oops_in_progress ?         \
> +                __kernel_text_address(addr) : \
> +                kernel_text_address(addr)) { \
> +                /* \
> +                * If the address is either in the text \
> +                * segment of the kernel, or in the region \
> +                * which contains vmalloc'ed memory, it may \
> +                * be the address of a calling routine; if \
> +                * so, print it so that someone tracing \
> +                * down the cause of the crash will be able \
> +                * to figure out the call path that \
> +                * was taken. \
> +                */ \
> +                ops->address(data, addr);   \
> +            } \
>         } \
>     } while (0)
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
