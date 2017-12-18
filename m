From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Dec 2017 17:47:07 +0000
Subject: [PATCH][next] bpf: make function skip_callee static and return NULL rather than 0
Message-Id: <20171218174707.15430-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function skip_callee is local to the source and does not need to
be in global scope, so make it static. Also return NULL rather than 0.
Cleans up two sparse warnings:

symbol 'skip_callee' was not declared. Should it be static?
Using plain integer as NULL pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/verifier.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 2f6f09cd1925..52689f2abbcb 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -823,6 +823,7 @@ static int check_subprogs(struct bpf_verifier_env *env)
 	return 0;
 }
 
+static
 struct bpf_verifier_state *skip_callee(struct bpf_verifier_env *env,
 				       const struct bpf_verifier_state *state,
 				       struct bpf_verifier_state *parent,
@@ -867,7 +868,7 @@ struct bpf_verifier_state *skip_callee(struct bpf_verifier_env *env,
 	verbose(env, "verifier bug regno %d tmp %p\n", regno, tmp);
 	verbose(env, "regno %d parent frame %d current frame %d\n",
 		regno, parent->curframe, state->curframe);
-	return 0;
+	return NULL;
 }
 
 static int mark_reg_read(struct bpf_verifier_env *env,
-- 
2.14.1

