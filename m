From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Apr 2018 19:31:58 +0000
Subject: [PATCH] perf: fix spelling mistake: "builid" -> "buildid"
Message-Id: <20180427193158.17932-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/util/genelf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/genelf.c b/tools/perf/util/genelf.c
index c540d47583e7..aafbe54fd3fa 100644
--- a/tools/perf/util/genelf.c
+++ b/tools/perf/util/genelf.c
@@ -114,7 +114,7 @@ gen_build_id(struct buildid_note *note,
 
 	fd = open("/dev/urandom", O_RDONLY);
 	if (fd = -1)
-		err(1, "cannot access /dev/urandom for builid");
+		err(1, "cannot access /dev/urandom for buildid");
 
 	sret = read(fd, note->build_id, sz);
 
-- 
2.17.0

