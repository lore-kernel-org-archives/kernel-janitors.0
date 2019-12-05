From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Dec 2019 10:02:20 +0000
Subject: Re: [PATCH] Silence an uninitialized variable warning
Message-Id: <20191205100220.GH1765@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126121934.kuolgbm55dirfbay@kili.mountain>
 <20191204092640.692c95af@gandalf.local.home>
 <20191204184247.GG1765@kadam>
 <20191205093229.GE2810@hirez.programming.kicks-ass.net>
In-Reply-To: <20191205093229.GE2810@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 05, 2019 at 10:32:29AM +0100, Peter Zijlstra wrote:
> On Wed, Dec 04, 2019 at 09:42:47PM +0300, Dan Carpenter wrote:
> 
> > > The current code has this:
> > > 
> > > static int __init syscall_enter_define_fields(struct trace_event_call *call)
> > > {
> > > 	struct syscall_trace_enter trace;
> > > 	struct syscall_metadata *meta = call->data;
> > > 	int ret;
> > > 	int i;
> > > 	int offset = offsetof(typeof(trace), args);
> > > 
> > > 	ret = trace_define_field(call, SYSCALL_FIELD(int, nr, __syscall_nr),
> > > 				 FILTER_OTHER);
> > 
> > In linux-next this ret = trace_define_field() assignment is removed.
> > That was commit 60fdad00827c ("ftrace: Rework event_create_dir()").
> 
> Yep, mea culpa.
> 
> > > 	if (ret)
> > > 		return ret;
> > > 
> > > 	for (i = 0; i < meta->nb_args; i++) {
> > > 		ret = trace_define_field(call, meta->types[i],
> > > 					 meta->args[i], offset,
> > > 					 sizeof(unsigned long), 0,
> > > 					 FILTER_OTHER);
> > > 		offset += sizeof(unsigned long);
> > > 	}
> > > 
> > > 	return ret;
> > > }
> > > 
> > > 
> > > How can ret possibly be uninitialized?
> > 
> > I should have written this commit more carefully and verified whether
> > meta->nb_args can actually be zero instead of just assuming it was a
> > false positive...
> 
> Right, I'm thinking this is in fact possible. We have syscalls without
> arguments (sys_sched_yield for exmaple).

Well, it would have triggered a run time bug because of that thing with
GCC where it sometimes initializes variables to zero.

Let me resend properly with a Fixes tag.

regards,
dan carpenter
