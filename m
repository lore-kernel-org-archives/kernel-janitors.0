From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Wed, 15 Apr 2015 10:10:17 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <87618x8zxy.fsf@ashishki-desk.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> That's not the style that the rest of this file uses.  Every function
> uses direct returns where possible except pt_event_add() and that
> function seems buggy.

Indeed.

> arch/x86/kernel/cpu/perf_event_intel_pt.c
>   1000  
>   1001          if (mode & PERF_EF_START) {
>   1002                  pt_event_start(event, 0);
>   1003                  if (hwc->state = PERF_HES_STOPPED) {
>   1004                          pt_event_del(event, 0);
>   1005                          ret = -EBUSY;
>                                 ^^^^^^^^^^^^
> We set "ret" here but then return zero.
>
>   1006                  }
>   1007          } else {
>   1008                  hwc->state = PERF_HES_STOPPED;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Shouldn't we set "ret" here?

No, or we'll end up returning -EBUSY where we should return zero for
snapshot counters. It can be done above the quoted if statement.

How does the following look to you?

From 726515f8bbef2ca02c495695b9451533d1bc6207 Mon Sep 17 00:00:00 2001
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Wed, 15 Apr 2015 12:56:52 +0300
Subject: [PATCH] perf/x86/intel/pt: cleanup error paths in pt_event_add()

pt_event_add() ends up returning 0 instead of -EBUSY in case of failure
to start the newly added event. This is a result of complex handling of
its return code.

This patch makes the return code handling of pt_event_add() more obvious
and fixes the mentioned bug.

Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 arch/x86/kernel/cpu/perf_event_intel_pt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/perf_event_intel_pt.c b/arch/x86/kernel/cpu/perf_event_intel_pt.c
index b58ba99cf8..b61a337856 100644
--- a/arch/x86/kernel/cpu/perf_event_intel_pt.c
+++ b/arch/x86/kernel/cpu/perf_event_intel_pt.c
@@ -1110,15 +1110,17 @@ static int pt_event_add(struct perf_event *event, int mode)
 	struct pt_buffer *buf;
 	struct pt *pt = this_cpu_ptr(&pt_ctx);
 	struct hw_perf_event *hwc = &event->hw;
-	int ret = -EBUSY;
+	int ret = 0;
 
-	if (pt->handle.event)
-		goto out;
+	if (pt->handle.event) {
+		ret = -EBUSY;
+		goto out_stop;
+	}
 
 	buf = perf_aux_output_begin(&pt->handle, event);
 	if (!buf) {
 		ret = -EINVAL;
-		goto out;
+		goto out_stop;
 	}
 
 	pt_buffer_reset_offsets(buf, pt->handle.head);
@@ -1126,7 +1128,7 @@ static int pt_event_add(struct perf_event *event, int mode)
 		ret = pt_buffer_reset_markers(buf, &pt->handle);
 		if (ret) {
 			perf_aux_output_end(&pt->handle, 0, true);
-			goto out;
+			goto out_stop;
 		}
 	}
 
@@ -1140,9 +1142,7 @@ static int pt_event_add(struct perf_event *event, int mode)
 		hwc->state = PERF_HES_STOPPED;
 	}
 
-	ret = 0;
-out:
-
+out_stop:
 	if (ret)
 		hwc->state = PERF_HES_STOPPED;
 
-- 
2.1.4
