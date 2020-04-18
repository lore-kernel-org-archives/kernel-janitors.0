From: Mao Wenan <maowenan@huawei.com>
Date: Sat, 18 Apr 2020 01:37:35 +0000
Subject: [PATCH bpf-next v2] bpf: remove set but not used variable 'dst_known'
Message-Id: <20200418013735.67882-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8855e82a-88d0-8d1e-e5e0-47e781f9653c@huawei.com>
In-Reply-To: <8855e82a-88d0-8d1e-e5e0-47e781f9653c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

kernel/bpf/verifier.c:5603:18: warning: variable ‘dst_known’
set but not used [-Wunused-but-set-variable], delete this
variable.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: remove fixes tag in commit log. 
 kernel/bpf/verifier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 04c6630cc18f..c9f50969a689 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5600,7 +5600,7 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 {
 	struct bpf_reg_state *regs = cur_regs(env);
 	u8 opcode = BPF_OP(insn->code);
-	bool src_known, dst_known;
+	bool src_known;
 	s64 smin_val, smax_val;
 	u64 umin_val, umax_val;
 	s32 s32_min_val, s32_max_val;
@@ -5622,7 +5622,6 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 
 	if (alu32) {
 		src_known = tnum_subreg_is_const(src_reg.var_off);
-		dst_known = tnum_subreg_is_const(dst_reg->var_off);
 		if ((src_known &&
 		     (s32_min_val != s32_max_val || u32_min_val != u32_max_val)) ||
 		    s32_min_val > s32_max_val || u32_min_val > u32_max_val) {
@@ -5634,7 +5633,6 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 		}
 	} else {
 		src_known = tnum_is_const(src_reg.var_off);
-		dst_known = tnum_is_const(dst_reg->var_off);
 		if ((src_known &&
 		     (smin_val != smax_val || umin_val != umax_val)) ||
 		    smin_val > smax_val || umin_val > umax_val) {
-- 
2.17.1
