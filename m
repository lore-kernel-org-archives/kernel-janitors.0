From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Thu, 05 Aug 2010 12:08:02 +0000
Subject: Re: [PATCH] kprobes: minor code cleanups
Message-Id: <4C5AA9A2.60202@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280938181-25878-1-git-send-email-namhyung@gmail.com>
In-Reply-To: <1280938181-25878-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Namhyung Kim wrote:
>  * make internal functions static
>  * get rid of __dummy_buf on x86
>  * make sparse happier :-)

Thanks, and could you split those into 2 patches?
(make function static, and remove __dummy_buf)
It's better that a single change has a single reason.

Thank you,

> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> 
> diff --git a/arch/x86/kernel/kprobes.c b/arch/x86/kernel/kprobes.c
> index 675879b..a4ff35d 100644
> --- a/arch/x86/kernel/kprobes.c
> +++ b/arch/x86/kernel/kprobes.c
> @@ -224,9 +224,6 @@ static int recover_probed_instruction(kprobe_opcode_t *buf, unsigned long addr)
>  	return 0;
>  }
>  
> -/* Dummy buffers for kallsyms_lookup */
> -static char __dummy_buf[KSYM_NAME_LEN];
> -
>  /* Check if paddr is at an instruction boundary */
>  static int __kprobes can_probe(unsigned long paddr)
>  {
> @@ -235,7 +232,7 @@ static int __kprobes can_probe(unsigned long paddr)
>  	struct insn insn;
>  	kprobe_opcode_t buf[MAX_INSN_SIZE];
>  
> -	if (!kallsyms_lookup(paddr, NULL, &offset, NULL, __dummy_buf))
> +	if (!kallsyms_lookup_size_offset(paddr, NULL, &offset))
>  		return 0;
>  
>  	/* Decode instructions */
> @@ -1109,7 +1106,7 @@ static void __kprobes synthesize_set_arg1(kprobe_opcode_t *addr,
>  	*(unsigned long *)addr = val;
>  }
>  
> -void __kprobes kprobes_optinsn_template_holder(void)
> +static void __used __kprobes kprobes_optinsn_template_holder(void)
>  {
>  	asm volatile (
>  			".global optprobe_template_entry\n"
> @@ -1249,11 +1246,9 @@ static int __kprobes can_optimize(unsigned long paddr)
>  	unsigned long addr, size = 0, offset = 0;
>  	struct insn insn;
>  	kprobe_opcode_t buf[MAX_INSN_SIZE];
> -	/* Dummy buffers for lookup_symbol_attrs */
> -	static char __dummy_buf[KSYM_NAME_LEN];
>  
>  	/* Lookup symbol including addr */
> -	if (!kallsyms_lookup(paddr, &size, &offset, NULL, __dummy_buf))
> +	if (!kallsyms_lookup_size_offset(paddr, &size, &offset))
>  		return 0;
>  
>  	/* Check there is enough space for a relative jump. */
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 1b0dbe0..a8d0139 100644
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
> +	unsigned long *flags)
>  {
>  	spinlock_t *hlist_lock = kretprobe_table_lock_ptr(hash);
>  	spin_unlock_irqrestore(hlist_lock, *flags);

-- 
Masami HIRAMATSU
2nd Research Dept.
Hitachi, Ltd., Systems Development Laboratory
E-mail: masami.hiramatsu.pt@hitachi.com
