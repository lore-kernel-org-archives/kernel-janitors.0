From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jan 2018 09:35:55 +0000
Subject: [PATCH] perf tools: fix spelling mistake: "successfull"-> "successful"
Message-Id: <20180126093555.11370-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes in pr_debug message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/util/bpf-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/bpf-loader.c b/tools/perf/util/bpf-loader.c
index 72c107fcbc5a..8062e1db0eb2 100644
--- a/tools/perf/util/bpf-loader.c
+++ b/tools/perf/util/bpf-loader.c
@@ -99,7 +99,7 @@ struct bpf_object *bpf__prepare_load(const char *filename, bool source)
 			if (err)
 				return ERR_PTR(-BPF_LOADER_ERRNO__COMPILE);
 		} else
-			pr_debug("bpf: successfull builtin compilation\n");
+			pr_debug("bpf: successful builtin compilation\n");
 		obj = bpf_object__open_buffer(obj_buf, obj_buf_sz, filename);
 
 		if (!IS_ERR(obj) && llvm_param.dump_obj)
-- 
2.15.1

