From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 18 Jul 2016 23:33:04 +0000
Subject: [PATCH 01/15] perf jit: Add missing curly braces
Message-Id: <1468884798-14932-2-git-send-email-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468884798-14932-1-git-send-email-acme@kernel.org>
In-Reply-To: <1468884798-14932-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Stephane Eranian <eranian@google.com>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Dan Carpenter <dan.carpenter@oracle.com>

It doesn't change the runtime behavior, but my static checker complains
that curly braces were intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/20160715210712.GA19522@mwanda
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/jvmti/jvmti_agent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 3573f315f955..91bf333a366a 100644
--- a/tools/perf/jvmti/jvmti_agent.c
+++ b/tools/perf/jvmti/jvmti_agent.c
@@ -491,10 +491,11 @@ jvmti_write_debug_info(void *agent, uint64_t code, const char *file,
 		if (sret != 1)
 			goto error;
 	}
-	if (padding_count)
+	if (padding_count) {
 		sret = fwrite_unlocked(pad_bytes, padding_count, 1, fp);
 		if (sret != 1)
 			goto error;
+	}
 
 	funlockfile(fp);
 	return 0;
-- 
2.7.4

