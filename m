From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Nov 2018 10:31:33 +0000
Subject: [PATCH] perf test: fix spelling mistake "sythesizing" -> "synthesizing"
Message-Id: <20181129103133.17353-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in TEST_ASSERT_VAL messages, fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/tests/mmap-thread-lookup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-thread-lookup.c b/tools/perf/tests/mmap-thread-lookup.c
index b1af2499a3c9..e8498d3e0176 100644
--- a/tools/perf/tests/mmap-thread-lookup.c
+++ b/tools/perf/tests/mmap-thread-lookup.c
@@ -224,11 +224,11 @@ static int mmap_events(synth_cb synth)
 int test__mmap_thread_lookup(struct test *test __maybe_unused, int subtest __maybe_unused)
 {
 	/* perf_event__synthesize_threads synthesize */
-	TEST_ASSERT_VAL("failed with sythesizing all",
+	TEST_ASSERT_VAL("failed with synthesizing all",
 			!mmap_events(synth_all));
 
 	/* perf_event__synthesize_thread_map synthesize */
-	TEST_ASSERT_VAL("failed with sythesizing process",
+	TEST_ASSERT_VAL("failed with synthesizing process",
 			!mmap_events(synth_process));
 
 	return 0;
-- 
2.19.1
