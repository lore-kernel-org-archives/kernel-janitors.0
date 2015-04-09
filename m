From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 09 Apr 2015 14:54:40 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150409145440.GC15910@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, Apr 09, 2015 at 02:45:30PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 09, 2015 at 03:33:36PM +0300, Dan Carpenter wrote:
> > > Also I have come to despise "err" labels.  They do one of three things:
> > > 
> > > 1) Nothing.  These are a pointless interruption for people reading the
> > >    code from top to bottom because you wonder, "How is goto err
> > >    different from return -ENOMEM?".  You scroll down to the bottom and
> > >    find that they are the same.  Now you have lost your place and your
> > >    train of thought.
> > > 
> > > 2) One thing.  In this case the label is poorly named, better to say
> > >    "goto unlock".
> > > 
> > > 3) Everything.  This is a leading source of error handling bugs.  It
> > >    looks like this.
> > > 
> > > err:
> > > 	kfree(foo);
> > > 	return ret;
> > 
> >   4) unwind complex state; see for example copy_process(). You do not
> >   want to endlessly duplicate the increasing cleanup for every exit.
> 
> I *like* using gotos for unwinding.  It's specifically the err:, out:,
> and bail: type labels I object to. [...]

Agreed, and I'd suggest you don't use poorly named and poorly 
constructed labels.

> [...]  If you unwind like:
> 
> err_free_bar:
> 	kfree(foo->bar);
> err_free_foo:
> 	kfree(foo);
> 	return ret;
> 
> That is less error prone.

That's how I name and structure unwind labels as well, and my 
suggestion is to use something similar here in this code too, in 
arch/x86/kernel/cpu/perf_event_intel_pt.c.

Agreed?

Thanks,

	Ingo
