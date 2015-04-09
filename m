From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 15:27:38 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150409152738.GD16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 04:54:40PM +0200, Ingo Molnar wrote:
> > [...]  If you unwind like:
> > 
> > err_free_bar:
> > 	kfree(foo->bar);
> > err_free_foo:
> > 	kfree(foo);
> > 	return ret;
> > 
> > That is less error prone.
> 
> That's how I name and structure unwind labels as well, and my 
> suggestion is to use something similar here in this code too, in 
> arch/x86/kernel/cpu/perf_event_intel_pt.c.
> 
> Agreed?

I don't understand what you want me to do here.  I think you are saying
I should do this:

err_attrs:
	kfree(attrs);
err:
	return ret;

That's not the style that the rest of this file uses.  Every function
uses direct returns where possible except pt_event_add() and that
function seems buggy.

arch/x86/kernel/cpu/perf_event_intel_pt.c
  1000  
  1001          if (mode & PERF_EF_START) {
  1002                  pt_event_start(event, 0);
  1003                  if (hwc->state = PERF_HES_STOPPED) {
  1004                          pt_event_del(event, 0);
  1005                          ret = -EBUSY;
                                ^^^^^^^^^^^^
We set "ret" here but then return zero.

  1006                  }
  1007          } else {
  1008                  hwc->state = PERF_HES_STOPPED;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Shouldn't we set "ret" here?

  1009          }
  1010  
  1011          ret = 0;
  1012  out:
  1013  
  1014          if (ret)
  1015                  hwc->state = PERF_HES_STOPPED;
  1016  
  1017          return ret;
  1018  }

regards,
dan carpenter
