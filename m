From: Steven Rostedt <srostedt@redhat.com>
Date: Mon, 13 Aug 2012 19:53:14 +0000
Subject: Re: [trace:rfc:multi-buffers-v4 23/26] kernel/trace/trace_mmiotrace.c:333:33: error: incompatible ty
Message-Id: <1344887594.2666.4.camel@fedora>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-08-14 at 03:16 +0800, Fengguang Wu wrote:
> Hi Steven,

Hi Fengguang, Please email to my rostedt@goodmis.org account. You might
want to remove this one from you address book. Or is this email
automated and uses the 'author' tag? If so, can you add aliases to your
scripts and replace this email with my other account?

> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git rfc/multi-buffers-v4
> head:   e712fa131ebb7d79ffb4965b6ac5493408662b26
> commit: f46d90989f7d8a90193391899b9f5b6242527f0f [23/26] tracing: Replace the static global per_cpu arrays with allocated per_cpu
> config: x86_64-allyesdebian (attached as .config)
> 
> All related error/warning messages:
> 
> kernel/trace/trace_mmiotrace.c: In function 'mmio_trace_rw':
> kernel/trace/trace_mmiotrace.c:333:33: error: incompatible types when initializing type 'struct trace_array_cpu *' using type 'struct trace_array_cpu'
> kernel/trace/trace_mmiotrace.c: In function 'mmio_trace_mapping':
> kernel/trace/trace_mmiotrace.c:366:7: error: incompatible types when assigning to type 'struct trace_array_cpu *' from type 'struct trace_array_cpu'
> 
> vim +333 kernel/trace/trace_mmiotrace.c
>    330	void mmio_trace_rw(struct mmiotrace_rw *rw)
>    331	{
>    332		struct trace_array *tr = mmio_trace_array;
>  > 333		struct trace_array_cpu *data = tr->data[smp_processor_id()];
>    334		__trace_mmiotrace_rw(tr, data, rw);
>    335	}
>    336	

Thanks for the info. I probably would have caught this in my own tests,
but this was an RFC branch that someone asked me to upload. Do you
automate all recent branches to kernel.org?

-- Steve


