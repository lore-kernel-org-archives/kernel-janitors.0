From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Mar 2010 18:20:44 +0000
Subject: Re: [PATCH 12/12] kernel/trace: Add missing unlock
Message-Id: <1269886844.19685.4705.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1003291736440.21896@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1003291736440.21896@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2010-03-29 at 17:37 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> In some error handling cases the lock is not unlocked.  The return is
> converted to a goto, to share the unlock at the end of the function.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r exists@
> expression E1;
> identifier f;
> @@
> 
> f (...) { <+...
> * spin_lock_irq (E1,...);
> ... when != E1
> * return ...;
> ...+> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks!

-- Steve

> ---
>  kernel/trace/ring_buffer.c          |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 05a9f83..cd2e1d8 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -1201,18 +1201,19 @@ rb_remove_pages(struct ring_buffer_per_cpu *cpu_buffer, unsigned nr_pages)
>  
>  	for (i = 0; i < nr_pages; i++) {
>  		if (RB_WARN_ON(cpu_buffer, list_empty(cpu_buffer->pages)))
> -			return;
> +			goto out;
>  		p = cpu_buffer->pages->next;
>  		bpage = list_entry(p, struct buffer_page, list);
>  		list_del_init(&bpage->list);
>  		free_buffer_page(bpage);
>  	}
>  	if (RB_WARN_ON(cpu_buffer, list_empty(cpu_buffer->pages)))
> -		return;
> +		goto out;
>  
>  	rb_reset_cpu(cpu_buffer);
>  	rb_check_pages(cpu_buffer);
>  
> +out:
>  	spin_unlock_irq(&cpu_buffer->reader_lock);
>  }
>  
> @@ -1229,7 +1230,7 @@ rb_insert_pages(struct ring_buffer_per_cpu *cpu_buffer,
>  
>  	for (i = 0; i < nr_pages; i++) {
>  		if (RB_WARN_ON(cpu_buffer, list_empty(pages)))
> -			return;
> +			goto out;
>  		p = pages->next;
>  		bpage = list_entry(p, struct buffer_page, list);
>  		list_del_init(&bpage->list);
> @@ -1238,6 +1239,7 @@ rb_insert_pages(struct ring_buffer_per_cpu *cpu_buffer,
>  	rb_reset_cpu(cpu_buffer);
>  	rb_check_pages(cpu_buffer);
>  
> +out:
>  	spin_unlock_irq(&cpu_buffer->reader_lock);
>  }
>  


