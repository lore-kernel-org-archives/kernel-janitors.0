From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 07 May 2020 20:53:36 +0000
Subject: Re: [PATCH] tracing/probe: reverse arguments to list_add
Message-Id: <alpine.DEB.2.21.2005072253140.2505@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1588879808-24488-1-git-send-email-Julia.Lawall@inria.fr> <20200507165053.291ba5ea@gandalf.local.home> <20200507165239.0264de30@gandalf.local.home>
In-Reply-To: <20200507165239.0264de30@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, Nic Volanschi <eugene.volanschi@inria.fr>, Masami Hiramatsu <mhiramat@kernel.org>



On Thu, 7 May 2020, Steven Rostedt wrote:

> On Thu, 7 May 2020 16:50:53 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
> > On Thu,  7 May 2020 21:30:08 +0200
> > Julia Lawall <Julia.Lawall@inria.fr> wrote:
> >
> > > Elsewhere in the file, the function trace_kprobe_has_same_kprobe uses
> > > a trace_probe_event.probes object as the second argument of
> > > list_for_each_entry, ie as a list head, while the list_for_each_entry
> > > iterates over the list fields of the trace_probe structures, making
> > > them the list elements.  So, exchange the arguments on the list_add
> > > call to put the list head in the second argument.
> > >
> > > Since both list_head structures were just initialized, this problem
> > > did not cause any loss of information.
> > >
> > > Fixes: 60d53e2c3b75 ("tracing/probe: Split trace_event related data from trace_probe")
> > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
>
> Julia,
>
> As this doesn't cause any harm (as you state, both lists have just been
> initialized), it doesn't need to go into this -rc release. Would you agree?

No, no need for -rc.

thanks,
julia
