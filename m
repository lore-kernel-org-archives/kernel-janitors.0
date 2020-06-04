From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Jun 2020 08:54:36 +0000
Subject: [PATCH v2 bpf-next] bpf: Fix an error code in check_btf_func()
Message-Id: <20200604085436.GA943001@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAADnVQJPwtan12Htu-0VhvuC3M-o_kbnPpN=SXVC-amn9BcZCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

This code returns success if the "info_aux" allocation fails but it
should return -ENOMEM.

Fixes: 8c1b6e69dcc1 ("bpf: Compare BTF types of functions arguments with actual types")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style change

 kernel/bpf/verifier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5c7bbaac81ef9..34cde841ab681 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7552,7 +7552,7 @@ static int check_btf_func(struct bpf_verifier_env *env,
 	const struct btf *btf;
 	void __user *urecord;
 	u32 prev_offset = 0;
-	int ret = 0;
+	int ret = -ENOMEM;
 
 	nfuncs = attr->func_info_cnt;
 	if (!nfuncs)
-- 
2.26.2
