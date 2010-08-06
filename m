From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Fri, 06 Aug 2010 02:23:31 +0000
Subject: Re: [PATCH 3/4] kprobes: make functions static
Message-Id: <4C5B7223.1050401@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281022194-23883-1-git-send-email-namhyung@gmail.com>
In-Reply-To: <1281022194-23883-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Namhyung Kim wrote:
> make following (internal) functions static to make sparse happier :-)
> 
>  * get_optimized_kprobe: only called from static functions
>  * kretprobe_table_unlock: _lock function is static
>  * kprobes_optinsn_template_holder: never called
	... but holding asm code.

Acked-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>

Thank you!

> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> 
> diff --git a/arch/x86/kernel/kprobes.c b/arch/x86/kernel/kprobes.c
> index 675879b..4986160 100644
> --- a/arch/x86/kernel/kprobes.c
> +++ b/arch/x86/kernel/kprobes.c
> @@ -1109,7 +1109,7 @@ static void __kprobes synthesize_set_arg1(kprobe_opcode_t *addr,
>  	*(unsigned long *)addr = val;
>  }
>  
> -void __kprobes kprobes_optinsn_template_holder(void)
> +static void __used __kprobes kprobes_optinsn_template_holder(void)
>  {
>  	asm volatile (
>  			".global optprobe_template_entry\n"
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 1b0dbe0..c53aad5 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -399,7 +399,7 @@ static inline int kprobe_optready(struct kprobe *p)
>   * Return an optimized kprobe whose optimizing code replaces
>   * instructions including addr (exclude breakpoint).
>   */
> -struct kprobe *__kprobes get_optimized_kprobe(unsigned long addr)
> +static struct kprobe *__kprobes get_optimized_kprobe(unsigned long addr)
>  {
>  	int i;
>  	struct kprobe *p = NULL;
> @@ -857,7 +857,8 @@ void __kprobes kretprobe_hash_unlock(struct task_struct *tsk,
>  	spin_unlock_irqrestore(hlist_lock, *flags);
>  }
>  
> -void __kprobes kretprobe_table_unlock(unsigned long hash, unsigned long *flags)
> +static void __kprobes kretprobe_table_unlock(unsigned long hash,
> +       unsigned long *flags)
>  {
>  	spinlock_t *hlist_lock = kretprobe_table_lock_ptr(hash);
>  	spin_unlock_irqrestore(hlist_lock, *flags);

