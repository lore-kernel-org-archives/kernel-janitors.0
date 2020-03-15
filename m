From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 15 Mar 2020 20:12:59 +0000
Subject: [PATCH] perf probe: Fix an error handling path in 'parse_perf_probe_command()'
Message-Id: <20200315201259.29190-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, mhiramat@kernel.org, allison@lohutok.net, rostedt@goodmis.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If a memory allocation fail, we should branch to the error handling path in
order to free some resources allocated a few lines above.

Fixes: 15354d546986 ("perf probe: Generate event name with line number")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 tools/perf/util/probe-event.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index eea132f512b0..65a615ee4b4c 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -1683,8 +1683,10 @@ int parse_perf_probe_command(const char *cmd, struct perf_probe_event *pev)
 	if (!pev->event && pev->point.function && pev->point.line
 			&& !pev->point.lazy_line && !pev->point.offset) {
 		if (asprintf(&pev->event, "%s_L%d", pev->point.function,
-			pev->point.line) < 0)
-			return -ENOMEM;
+			pev->point.line) < 0) {
+			ret = -ENOMEM;
+			goto out;
+		}
 	}
 
 	/* Copy arguments and ensure return probe has no C argument */
-- 
2.20.1
