From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Sat, 28 Jan 2012 11:00:36 +0000
Subject: Re: [patch] x86, dumpstack: removed unneeded check in dump_trace()
Message-Id: <20120128110034.GD3391@somewhere>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120128105246.GA25092@elgon.mountain>
In-Reply-To: <20120128105246.GA25092@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Namhyung Kim <namhyung@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Clemens Ladisch <clemens@ladisch.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jan 28, 2012 at 01:52:46PM +0300, Dan Carpenter wrote:
> Smatch complains that we have some inconsistent NULL checking.  If
> "task" were NULL then it would lead to a NULL dereference later.  We
> can remove this test because earlier on in the function we have:
> 	if (!task)
> 		task = current;
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Frederic Weisbecker <fweisbec@gmail.com>

> 
> diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
> index 6d728d9..af7785f 100644
> --- a/arch/x86/kernel/dumpstack_64.c
> +++ b/arch/x86/kernel/dumpstack_64.c
> @@ -129,7 +129,7 @@ void dump_trace(struct task_struct *task, struct pt_regs *regs,
>  	if (!stack) {
>  		if (regs)
>  			stack = (unsigned long *)regs->sp;
> -		else if (task && task != current)
> +		else if (task != current)
>  			stack = (unsigned long *)task->thread.sp;
>  		else
>  			stack = &dummy;
