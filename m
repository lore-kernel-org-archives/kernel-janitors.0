From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 17:55:09 +0000
Subject: [PATCH bpf-next] bpf: Fix an error code in check_btf_func()
Message-Id: <20200603175509.GE18931@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

This code returns success if kcalloc() but it should return -ENOMEM.

Fixes: 8c1b6e69dcc1 ("bpf: Compare BTF types of functions arguments with actual types")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/bpf/verifier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5c7bbaac81ef9..25363f134bf0c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7581,8 +7581,10 @@ static int check_btf_func(struct bpf_verifier_env *env,
 	if (!krecord)
 		return -ENOMEM;
 	info_aux = kcalloc(nfuncs, sizeof(*info_aux), GFP_KERNEL | __GFP_NOWARN);
-	if (!info_aux)
+	if (!info_aux) {
+		ret = -ENOMEM;
 		goto err_free;
+	}
 
 	for (i = 0; i < nfuncs; i++) {
 		ret = bpf_check_uarg_tail_zero(urecord, krec_size, urec_size);
-- 
2.26.2
