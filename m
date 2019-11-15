From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 15 Nov 2019 15:54:56 +0000
Subject: Re: [PATCH][next] ftrace: fix spelling mistake "wakeing" -> "waking"
Message-Id: <20191115105456.29444b06@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191115085938.38947-1-colin.king@canonical.com>
In-Reply-To: <20191115085938.38947-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 15 Nov 2019 08:59:38 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a trace_printk message. Fix it.

As this breaks the selftests, I'm folding this patch into the one that
you sent that updates the selftests as well.

-- Steve

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  samples/ftrace/ftrace-direct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
> index 1483f067b000..a2e3063bd306 100644
> --- a/samples/ftrace/ftrace-direct.c
> +++ b/samples/ftrace/ftrace-direct.c
> @@ -6,7 +6,7 @@
>  
>  void my_direct_func(struct task_struct *p)
>  {
> -	trace_printk("wakeing up %s-%d\n", p->comm, p->pid);
> +	trace_printk("waking up %s-%d\n", p->comm, p->pid);
>  }
>  
>  extern void my_tramp(void *);
