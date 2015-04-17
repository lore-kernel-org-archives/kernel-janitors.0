From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Fri, 17 Apr 2015 15:06:12 +0000
Subject: Re: [PATCH] perf/x86/intel/pt: Clean up error handling in pt_event_add()
Message-Id: <87lhhq7q1n.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150416103830.GB7847@gmail.com>
In-Reply-To: <20150416103830.GB7847@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ingo Molnar <mingo@kernel.org> writes:

> * Alexander Shishkin <alexander.shishkin@linux.intel.com> wrote:
>
> So it's still not obvious enough IMO - I wrote the patch below. 
> Untested.
>
> NOTE: I materially changed the existing clean up logic in the 
> pt_event_start() failure case to use the direct perf_aux_output_end() 
> path, not pt_event_del(). I could not convince myself that 
> pt_event_del() is really needed there - but I might be wrong.

No, you're right, perf_aux_output_end() is sufficient there.

> In any case, these functions are a mess and they are barely 
> documented! Please add proper comments about what the interaction and 
> expected rules of perf_aux_output_begin(), pt_buffer_reset_offsets(), 
> pt_buffer_reset_markers(), pt_event_start(), perf_aux_output_end() et 
> al is, right now it's a guessing game mostly. (in a separate patch 
> please)

Will do.

> Btw., pt_event_start() has weird error handling as well: it should 
> probably return an error code, instead of open coding event->hw.state 
> = PERF_HES_STOPPED. This would have to be changed in all PMU drivers, 
> with core perf setting hw.state to PERF_HES_STOPPED or so?

The difference is that normal performance counters can't really fail to
start if their pmu::add() succeeded and afaict that such is also the
assumption in the perf core; aux counters, however, can run out of room
in the aux buffer. For most things tracking hw.state seems sufficient.

What I could do is have something like do_pt_event_start() that returns
-ENOSPC for the buffer-full condition and call it from both
pt_event_add() and pt_event_start(), which would both set hw.state to
HES_STOPPED if it fails. I'm not sure how much of a readability
improvement that is, I suspect that the same can be achieved by adding
appropriate comments to these functions. What do you think?

Thanks,
--
Alex
