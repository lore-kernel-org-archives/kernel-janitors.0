From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 21:07:12 +0000
Subject: [patch 1/2] perf jit: add missing curly braces
Message-Id: <20160715210712.GA19522@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Stephane Eranian <eranian@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It doesn't change the runtime behavior, but my static checker complains
that curly braces were intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 3573f31..91bf333 100644
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
