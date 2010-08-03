From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Date: Tue, 03 Aug 2010 11:24:34 +0000
Subject: Re: [PATCH 1/2] kprobes: remove redundant address check
Message-Id: <4C57FC72.30906@hitachi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280820323-18929-1-git-send-email-namhyung@gmail.com>
In-Reply-To: <1280820323-18929-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Namhyung Kim wrote:
> remove call to kernel_text_address() in register_jprobes()
> because it is called right after in register_kprobe().

Indeed. Thank you for finding that! :)

> Signed-off-by: Namhyung Kim <namhyung@gmail.com>

Acked-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>

> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 282035f..8f96701 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1343,14 +1343,11 @@ int __kprobes register_jprobes(struct jprobe **jps, int num)
>  		jp = jps[i];
>  		addr = arch_deref_entry_point(jp->entry);
>  
> -		if (!kernel_text_address(addr))
> -			ret = -EINVAL;
> -		else {
> -			/* Todo: Verify probepoint is a function entry point */
> -			jp->kp.pre_handler = setjmp_pre_handler;
> -			jp->kp.break_handler = longjmp_break_handler;
> -			ret = register_kprobe(&jp->kp);
> -		}
> +		/* Todo: Verify probepoint is a function entry point */
> +		jp->kp.pre_handler = setjmp_pre_handler;
> +		jp->kp.break_handler = longjmp_break_handler;
> +		ret = register_kprobe(&jp->kp);
> +
>  		if (ret < 0) {
>  			if (i > 0)
>  				unregister_jprobes(jps, i);
-- 
Masami HIRAMATSU
2nd Research Dept.
Hitachi, Ltd., Systems Development Laboratory
E-mail: masami.hiramatsu.pt@hitachi.com
