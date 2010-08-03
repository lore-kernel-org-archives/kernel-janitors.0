From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Tue, 03 Aug 2010 11:27:18 +0000
Subject: Re: [PATCH 2/2] kprobes: verify jprobe entry point
Message-Id: <4C57FD16.5070500@hitachi.com>
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
> index 8f96701..c7295f9 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1334,19 +1334,25 @@ unsigned long __weak arch_deref_entry_point(void *entry)
>  int __kprobes register_jprobes(struct jprobe **jps, int num)
>  {
>  	struct jprobe *jp;
> -	int ret = 0, i;
> +	int ret = -EINVAL, i;
>  
>  	if (num <= 0)
> -		return -EINVAL;
> +		return ret;
>  	for (i = 0; i < num; i++) {
>  		unsigned long addr;
> +		unsigned long size, offset;
> +		char namebuf[KSYM_NAME_LEN];
> +

You need to re-initialize "ret" in each iteration,
or "ret" will be 0 except for the 1st iteration.

>  		jp = jps[i];
>  		addr = arch_deref_entry_point(jp->entry);
>  
> -		/* Todo: Verify probepoint is a function entry point */
> -		jp->kp.pre_handler = setjmp_pre_handler;
> -		jp->kp.break_handler = longjmp_break_handler;
> -		ret = register_kprobe(&jp->kp);
> +		/* Verify probepoint is a function entry point */
> +		if (kallsyms_lookup(addr, &size, &offset, NULL, namebuf) &&
> +		    offset = 0) {
> +			jp->kp.pre_handler = setjmp_pre_handler;
> +			jp->kp.break_handler = longjmp_break_handler;
> +			ret = register_kprobe(&jp->kp);

		because, this line assigns 0 to ret if no error.

> +		}

I think here is a good point to do that. (in else block)

>  
>  		if (ret < 0) {
>  			if (i > 0)

Thank you,
-- 
Masami HIRAMATSU
2nd Research Dept.
Hitachi, Ltd., Systems Development Laboratory
E-mail: masami.hiramatsu.pt@hitachi.com
