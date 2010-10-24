From: Dan Carpenter <error27@gmail.com>
Date: Sun, 24 Oct 2010 19:50:42 +0000
Subject: [patch] perf: off by one in perf_swevent_init()
Message-Id: <20101024195041.GT5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The perf_swevent_enabled[] array has PERF_COUNT_SW_MAX elements.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/perf_event.c b/kernel/perf_event.c
index f309e80..c45396d 100644
--- a/kernel/perf_event.c
+++ b/kernel/perf_event.c
@@ -4687,7 +4687,7 @@ static int perf_swevent_init(struct perf_event *event)
 		break;
 	}
 
-	if (event_id > PERF_COUNT_SW_MAX)
+	if (event_id >= PERF_COUNT_SW_MAX)
 		return -ENOENT;
 
 	if (!event->parent) {
