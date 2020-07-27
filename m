From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Jul 2020 17:54:11 +0000
Subject: [PATCH][next] bpf: fix swapped arguments in calls to check_buffer_access
Message-Id: <20200727175411.155179-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of arguments of the boolean flag zero_size_allowed
and the char pointer buf_info when calling to function check_buffer_access
that are swapped by mistake. Fix these by swapping them to correct
the argument ordering.

Addresses-Coverity: ("Array compared to 0")
Fixes: afbf21dce668 ("bpf: Support readonly/readwrite buffers in verifier")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/verifier.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index cd14e70f2d07..88bb25d08bf8 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3477,14 +3477,14 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 				regno, reg_type_str[reg->type]);
 			return -EACCES;
 		}
-		err = check_buffer_access(env, reg, regno, off, size, "rdonly",
-					  false,
+		err = check_buffer_access(env, reg, regno, off, size, false,
+					  "rdonly",
 					  &env->prog->aux->max_rdonly_access);
 		if (!err && value_regno >= 0)
 			mark_reg_unknown(env, regs, value_regno);
 	} else if (reg->type = PTR_TO_RDWR_BUF) {
-		err = check_buffer_access(env, reg, regno, off, size, "rdwr",
-					  false,
+		err = check_buffer_access(env, reg, regno, off, size, false,
+					  "rdwr",
 					  &env->prog->aux->max_rdwr_access);
 		if (!err && t = BPF_READ && value_regno >= 0)
 			mark_reg_unknown(env, regs, value_regno);
-- 
2.27.0
