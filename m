From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Dec 2017 14:03:12 +0000
Subject: [PATCH][next] bpf: fix spelling mistake: "funcation"-> "function"
Message-Id: <20171218140312.6329-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in error message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/verifier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 6d8e432453b8..2f6f09cd1925 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -772,7 +772,7 @@ static int check_subprogs(struct bpf_verifier_env *env)
 			return -EPERM;
 		}
 		if (bpf_prog_is_dev_bound(env->prog->aux)) {
-			verbose(env, "funcation calls in offloaded programs are not supported yet\n");
+			verbose(env, "function calls in offloaded programs are not supported yet\n");
 			return -EINVAL;
 		}
 		ret = add_subprog(env, i + insn[i].imm + 1);
-- 
2.14.1

