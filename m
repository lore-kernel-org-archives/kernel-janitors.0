From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Fri, 06 Aug 2010 02:22:18 +0000
Subject: Re: [PATCH 4/4] kprobes: remove __dummy_buf
Message-Id: <4C5B71DA.8080906@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281022194-23883-2-git-send-email-namhyung@gmail.com>
In-Reply-To: <1281022194-23883-2-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Namhyung Kim wrote:
> remove __dummy_buf which is needed for kallsyms_lookup only.
> use kallsysm_lookup_size_offset instead.
> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>

Acked-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>

Thanks!

> 
> diff --git a/arch/x86/kernel/kprobes.c b/arch/x86/kernel/kprobes.c
> index 4986160..a4ff35d 100644
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

