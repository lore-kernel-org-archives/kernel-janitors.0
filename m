From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 09:38:35 +0000
Subject: [PATCH] bpf: clean up indentation issue
Message-Id: <20190925093835.19515-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one level too deeply,
remove the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/btf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 722d38e543e9..29c7c06c6bd6 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -2332,7 +2332,7 @@ static int btf_enum_check_kflag_member(struct btf_verifier_env *env,
 		if (BITS_PER_BYTE_MASKED(struct_bits_off)) {
 			btf_verifier_log_member(env, struct_type, member,
 						"Member is not byte aligned");
-				return -EINVAL;
+			return -EINVAL;
 		}
 
 		nr_bits = int_bitsize;
-- 
2.20.1
