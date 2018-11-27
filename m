From: Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 27 Nov 2018 18:44:12 +0000
Subject: Re: [PATCH] tracing: Fix an off by one in __next()
Message-Id: <20181127134412.6f2141d4@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620110758.crunhd5bfep7zuiz@kili.mountain>
In-Reply-To: <20180620110758.crunhd5bfep7zuiz@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Doing the sweep of my INBOX, I came across this patch (it was sent
while I was in the Alps :-)


On Wed, 20 Jun 2018 14:08:00 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The > should be >= to prevent an off by one bug.

Well, not really.

> 
> >From reviewing the code, it seems possible for  
> stack_trace_max.nr_entries to be set to .max_entries and in that case we
> would be reading one element beyond the end of the stack_dump_trace[]
> array.  If it's not set to .max_entries then the bug doesn't affect
> runtime.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
> index 4237eba4ef20..6e3edd745c68 100644
> --- a/kernel/trace/trace_stack.c
> +++ b/kernel/trace/trace_stack.c
> @@ -286,7 +286,7 @@ __next(struct seq_file *m, loff_t *pos)
>  {
>  	long n = *pos - 1;
>  
> -	if (n > stack_trace_max.nr_entries || stack_dump_trace[n] = ULONG_MAX)
> +	if (n >= stack_trace_max.nr_entries || stack_dump_trace[n] = ULONG_MAX)

We have:

static unsigned long stack_dump_trace[STACK_TRACE_ENTRIES+1] 	 { [0 ... (STACK_TRACE_ENTRIES)] = ULONG_MAX };

 And

struct stack_trace stack_trace_max = {
	.max_entries		= STACK_TRACE_ENTRIES - 1,
	.entries		= &stack_dump_trace[0],
};


And nr_entries is set as this, and we have after that this:

	stack_trace_max.nr_entries = x;
	for (; x < i; x++)
		stack_dump_trace[x] = ULONG_MAX;

Where we set stack_dump_trace[nr_entries] to ULONG_MAX.

Thus, nr_entries will not go pass the size of stack_dump_trace.

That said, if n = nr_entries, the second part of that if will always
be true. And this is a bit subtle, so I will apply the patch. But it is
not an off by one bug ;-)

Thanks!

-- Steve


>  		return NULL;
>  
>  	m->private = (void *)n;
