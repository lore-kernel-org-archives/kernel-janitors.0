From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:41 +0000
Subject: [PATCH 08/12] perf test: drop unneeded newline
Message-Id: <1514386305-7402-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org

TEST_ASSERT_VAL prints a newline at the end of the message string,
so the message string does not need to include a newline explicitly.
Done using Coccinelle.

There are some white-space adjustments in the calls to avoid exceeding 80
characters and to put continuation line arguments to the right of the (.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 tools/perf/tests/dso-data.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/dso-data.c b/tools/perf/tests/dso-data.c
index 7f6c520..f514515 100644
--- a/tools/perf/tests/dso-data.c
+++ b/tools/perf/tests/dso-data.c
@@ -150,7 +150,7 @@ int test__dso_data(struct test *test __maybe_unused, int subtest __maybe_unused)
 		u8 *buf;
 
 		buf = malloc(TEST_FILE_SIZE);
-		TEST_ASSERT_VAL("ENOMEM\n", buf);
+		TEST_ASSERT_VAL("ENOMEM", buf);
 
 		/* First iteration to fill caches, second one to read them. */
 		for (c = 0; c < 2; c++) {
@@ -265,8 +265,8 @@ int test__dso_data_cache(struct test *test __maybe_unused, int subtest __maybe_u
 
 	/* and this is now our dso open FDs limit */
 	dso_cnt = limit / 2;
-	TEST_ASSERT_VAL("failed to create dsos\n",
-		!dsos__create(dso_cnt, TEST_FILE_SIZE));
+	TEST_ASSERT_VAL("failed to create dsos",
+			!dsos__create(dso_cnt, TEST_FILE_SIZE));
 
 	for (i = 0; i < (dso_cnt - 1); i++) {
 		struct dso *dso = dsos[i];
@@ -336,7 +336,8 @@ int test__dso_data_reopen(struct test *test __maybe_unused, int subtest __maybe_
 	TEST_ASSERT_VAL("failed to set file limit",
 			!set_fd_limit((nr + 3)));
 
-	TEST_ASSERT_VAL("failed to create dsos\n", !dsos__create(3, TEST_FILE_SIZE));
+	TEST_ASSERT_VAL("failed to create dsos",
+			!dsos__create(3, TEST_FILE_SIZE));
 
 	/* open dso_0 */
 	fd = dso__data_fd(dso_0, &machine);

