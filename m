From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 04 Dec 2019 14:26:40 +0000
Subject: Re: [PATCH] Silence an uninitialized variable warning
Message-Id: <20191204092640.692c95af@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126121934.kuolgbm55dirfbay@kili.mountain>
In-Reply-To: <20191126121934.kuolgbm55dirfbay@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 26 Nov 2019 15:19:34 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Smatch complains that "ret" could be uninitialized if we don't enter the
> loop.  I don't know if that's possible, but it's nicer to return a
> literal zero instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  kernel/trace/trace_syscalls.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace_syscalls.c b/kernel/trace/trace_syscalls.c
> index 73140d80dd46..63528f458826 100644
> --- a/kernel/trace/trace_syscalls.c
> +++ b/kernel/trace/trace_syscalls.c
> @@ -286,7 +286,7 @@ static int __init syscall_enter_define_fields(struct trace_event_call *call)
>  		offset += sizeof(unsigned long);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void ftrace_syscall_enter(void *data, struct pt_regs *regs, long id)

The current code has this:

static int __init syscall_enter_define_fields(struct trace_event_call *call)
{
	struct syscall_trace_enter trace;
	struct syscall_metadata *meta = call->data;
	int ret;
	int i;
	int offset = offsetof(typeof(trace), args);

	ret = trace_define_field(call, SYSCALL_FIELD(int, nr, __syscall_nr),
				 FILTER_OTHER);
	if (ret)
		return ret;

	for (i = 0; i < meta->nb_args; i++) {
		ret = trace_define_field(call, meta->types[i],
					 meta->args[i], offset,
					 sizeof(unsigned long), 0,
					 FILTER_OTHER);
		offset += sizeof(unsigned long);
	}

	return ret;
}


How can ret possibly be uninitialized?

-- Steve
