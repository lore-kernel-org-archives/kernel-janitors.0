From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 16 Apr 2015 10:38:30 +0000
Subject: [PATCH] perf/x86/intel/pt: Clean up error handling in pt_event_add()
Message-Id: <20150416103830.GB7847@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Alexander Shishkin <alexander.shishkin@linux.intel.com> wrote:

> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > That's not the style that the rest of this file uses.  Every function
> > uses direct returns where possible except pt_event_add() and that
> > function seems buggy.
> 
> Indeed.
> 
> > arch/x86/kernel/cpu/perf_event_intel_pt.c
> >   1000  
> >   1001          if (mode & PERF_EF_START) {
> >   1002                  pt_event_start(event, 0);
> >   1003                  if (hwc->state = PERF_HES_STOPPED) {
> >   1004                          pt_event_del(event, 0);
> >   1005                          ret = -EBUSY;
> >                                 ^^^^^^^^^^^^
> > We set "ret" here but then return zero.
> >
> >   1006                  }
> >   1007          } else {
> >   1008                  hwc->state = PERF_HES_STOPPED;
> >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > Shouldn't we set "ret" here?
> 
> No, or we'll end up returning -EBUSY where we should return zero for
> snapshot counters. It can be done above the quoted if statement.
> 
> How does the following look to you?
> 
> From 726515f8bbef2ca02c495695b9451533d1bc6207 Mon Sep 17 00:00:00 2001
> From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Date: Wed, 15 Apr 2015 12:56:52 +0300
> Subject: [PATCH] perf/x86/intel/pt: cleanup error paths in pt_event_add()
> 
> pt_event_add() ends up returning 0 instead of -EBUSY in case of failure
> to start the newly added event. This is a result of complex handling of
> its return code.
> 
> This patch makes the return code handling of pt_event_add() more obvious
> and fixes the mentioned bug.

So it's still not obvious enough IMO - I wrote the patch below. 
Untested.

NOTE: I materially changed the existing clean up logic in the 
pt_event_start() failure case to use the direct perf_aux_output_end() 
path, not pt_event_del(). I could not convince myself that 
pt_event_del() is really needed there - but I might be wrong.

In any case, these functions are a mess and they are barely 
documented! Please add proper comments about what the interaction and 
expected rules of perf_aux_output_begin(), pt_buffer_reset_offsets(), 
pt_buffer_reset_markers(), pt_event_start(), perf_aux_output_end() et 
al is, right now it's a guessing game mostly. (in a separate patch 
please)

Btw., pt_event_start() has weird error handling as well: it should 
probably return an error code, instead of open coding event->hw.state 
= PERF_HES_STOPPED. This would have to be changed in all PMU drivers, 
with core perf setting hw.state to PERF_HES_STOPPED or so?

Thanks,

	Ingo

---

 arch/x86/kernel/cpu/perf_event_intel_pt.c | 32 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/cpu/perf_event_intel_pt.c b/arch/x86/kernel/cpu/perf_event_intel_pt.c
index f2770641c0fd..1b298caf09c1 100644
--- a/arch/x86/kernel/cpu/perf_event_intel_pt.c
+++ b/arch/x86/kernel/cpu/perf_event_intel_pt.c
@@ -988,38 +988,36 @@ static int pt_event_add(struct perf_event *event, int mode)
 	int ret = -EBUSY;
 
 	if (pt->handle.event)
-		goto out;
+		goto fail;
 
 	buf = perf_aux_output_begin(&pt->handle, event);
-	if (!buf) {
-		ret = -EINVAL;
-		goto out;
-	}
+	ret = -EINVAL;
+	if (!buf)
+		goto fail_stop;
 
 	pt_buffer_reset_offsets(buf, pt->handle.head);
 	if (!buf->snapshot) {
 		ret = pt_buffer_reset_markers(buf, &pt->handle);
-		if (ret) {
-			perf_aux_output_end(&pt->handle, 0, true);
-			goto out;
-		}
+		if (ret)
+			goto fail_end_stop;
 	}
 
 	if (mode & PERF_EF_START) {
 		pt_event_start(event, 0);
-		if (hwc->state = PERF_HES_STOPPED) {
-			pt_event_del(event, 0);
-			ret = -EBUSY;
-		}
+		ret = -EBUSY;
+		if (hwc->state = PERF_HES_STOPPED)
+			goto fail_end_stop;
 	} else {
 		hwc->state = PERF_HES_STOPPED;
 	}
 
-	ret = 0;
-out:
+	return 0;
 
-	if (ret)
-		hwc->state = PERF_HES_STOPPED;
+fail_end_stop:
+	perf_aux_output_end(&pt->handle, 0, true);
+fail_stop:
+	hwc->state = PERF_HES_STOPPED;
+fail:
 
 	return ret;
 }
