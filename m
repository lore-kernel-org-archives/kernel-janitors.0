From: Ingo Molnar <mingo@kernel.org>
Date: Sun, 12 Apr 2015 10:18:58 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150412101858.GC2862@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Julia Lawall <julia.lawall@lip6.fr> wrote:

> > > 2) Exit labels bad associations because code which uses err: or out:
> > >    labels is often buggy as we have seen in pt_event_add().
> > 
> > Not if the cleanup path is robustly constructed. Multiple labels can 
> > also be used:
> > 
> >   - if performance is of concern
> >   - if we need to unroll layers of taken locks
> 
> A cascade of labels helps the reader understand what goes with what, 
> in what order, because functions are not called when they are not 
> needed.

I certainly agree for complex init/teardown sequences that are 
non-trivial to clean up.

For the specific case of kfree() in init paths it's also a valid model 
to just auto-cleanup everything in the failure path, to simplify 
things. (which I did here.)

Thanks,

	Ingo
