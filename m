From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Wed, 04 Aug 2010 04:26:31 +0000
Subject: Re: [PATCH 2/2] kprobes: verify jprobe entry point
Message-Id: <4C58EBF7.9050004@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
In-Reply-To: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Namhyung Kim wrote:
> verify jprobe's entry point is a function entry point
> using kallsyms' offset value.
> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 8f96701..0032868 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1340,13 +1340,20 @@ int __kprobes register_jprobes(struct jprobe **jps, int num)
>  		return -EINVAL;
>  	for (i = 0; i < num; i++) {
>  		unsigned long addr;
> +		unsigned long size, offset;
> +		char namebuf[KSYM_NAME_LEN];
> +
>  		jp = jps[i];
>  		addr = arch_deref_entry_point(jp->entry);
>  
> -		/* Todo: Verify probepoint is a function entry point */
> -		jp->kp.pre_handler = setjmp_pre_handler;
> -		jp->kp.break_handler = longjmp_break_handler;
> -		ret = register_kprobe(&jp->kp);
> +		/* Verify probepoint is a function entry point */
> +		if (kallsyms_lookup(addr, &size, &offset, NULL, namebuf) &&

Hm, it seems that current kernel has kallsyms_lookup_size_offset()
which doesn't requires namebuf, and you can ommit size if you don't
need that. It will simplify this patch:)

Other parts are OK for me.

Thank you,

> +		    offset = 0) {
> +			jp->kp.pre_handler = setjmp_pre_handler;
> +			jp->kp.break_handler = longjmp_break_handler;
> +			ret = register_kprobe(&jp->kp);
> +		} else
> +			ret = -EINVAL;
>  
>  		if (ret < 0) {
>  			if (i > 0)

-- 
Masami HIRAMATSU
2nd Research Dept.
Hitachi, Ltd., Systems Development Laboratory
E-mail: masami.hiramatsu.pt@hitachi.com
