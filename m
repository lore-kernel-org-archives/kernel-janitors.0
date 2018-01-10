From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Jan 2018 09:20:54 +0000
Subject: [PATCH][bpf-next] bpf: fix spelling mistake: "obusing" -> "abusing"
Message-Id: <20180110092054.23345-1-colin.king@canonical.com>
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
index 97bbef3eecdf..e388f30c4168 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5336,7 +5336,7 @@ static int fixup_bpf_calls(struct bpf_verifier_env *env)
 			 */
 			map_ptr = env->insn_aux_data[i + delta].map_ptr;
 			if (map_ptr = BPF_MAP_PTR_POISON) {
-				verbose(env, "tail_call obusing map_ptr\n");
+				verbose(env, "tail_call abusing map_ptr\n");
 				return -EINVAL;
 			}
 			if (!map_ptr->unpriv_array)
-- 
2.15.1

