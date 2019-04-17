From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Apr 2019 10:55:39 +0000
Subject: [PATCH] perf test: fix spelling mistake "leadking" -> "leaking"
Message-Id: <20190417105539.5902-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129103133.17353-1-colin.king@canonical.com>
In-Reply-To: <20181129103133.17353-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in test assert messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/tests/dso-data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/dso-data.c b/tools/perf/tests/dso-data.c
index 7f6c52021e41..946ab4b63acd 100644
--- a/tools/perf/tests/dso-data.c
+++ b/tools/perf/tests/dso-data.c
@@ -304,7 +304,7 @@ int test__dso_data_cache(struct test *test __maybe_unused, int subtest __maybe_u
 	/* Make sure we did not leak any file descriptor. */
 	nr_end = open_files_cnt();
 	pr_debug("nr start %ld, nr stop %ld\n", nr, nr_end);
-	TEST_ASSERT_VAL("failed leadking files", nr = nr_end);
+	TEST_ASSERT_VAL("failed leaking files", nr = nr_end);
 	return 0;
 }
 
@@ -380,6 +380,6 @@ int test__dso_data_reopen(struct test *test __maybe_unused, int subtest __maybe_
 	/* Make sure we did not leak any file descriptor. */
 	nr_end = open_files_cnt();
 	pr_debug("nr start %ld, nr stop %ld\n", nr, nr_end);
-	TEST_ASSERT_VAL("failed leadking files", nr = nr_end);
+	TEST_ASSERT_VAL("failed leaking files", nr = nr_end);
 	return 0;
 }
-- 
2.20.1
