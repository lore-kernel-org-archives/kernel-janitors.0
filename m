From: Ingo Molnar <mingo@kernel.org>
Date: Sat, 11 Apr 2015 08:37:14 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150411083714.GB16060@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, Apr 09, 2015 at 04:54:40PM +0200, Ingo Molnar wrote:
> > > [...]  If you unwind like:
> > > 
> > > err_free_bar:
> > > 	kfree(foo->bar);
> > > err_free_foo:
> > > 	kfree(foo);
> > > 	return ret;
> > > 
> > > That is less error prone.
> > 
> > That's how I name and structure unwind labels as well, and my 
> > suggestion is to use something similar here in this code too, in 
> > arch/x86/kernel/cpu/perf_event_intel_pt.c.
> > 
> > Agreed?
> 
> I don't understand what you want me to do here.  I think you are saying
> I should do this:
> 
> err_attrs:
> 	kfree(attrs);
> err:
> 	return ret;

Yeah, that looks cleaner.

> 
> That's not the style that the rest of this file uses. [...]

That might have slipped through review, but it's not a reason to 
continue the bad practice.

Thanks,

	Ingo
