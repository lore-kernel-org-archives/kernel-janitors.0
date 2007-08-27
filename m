From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 27 Aug 2007 21:33:23 +0000
Subject: Re: [PATCH] trivial - constify sched.h
Message-Id: <20070827213323.GA1759@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1188247231.18004.129.camel@localhost>
In-Reply-To: <1188247231.18004.129.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 27, 2007 at 01:40:31PM -0700, Joe Perches wrote:
> Add const to some struct task_struct * uses

Why, oh, why? This way code there are more characters on screen and zero
change in vmlinux, at least here.

> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1222,22 +1222,22 @@ static inline int rt_prio(int prio)
>  	return 0;
>  }
>  
> -static inline int rt_task(struct task_struct *p)
> +static inline int rt_task(const struct task_struct *p)
>  {
>  	return rt_prio(p->prio);
>  }
	...
