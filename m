From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2019 05:46:27 +0000
Subject: [PATCH] tools/libbpf: signedness bug in btf_dedup_ref_type()
Message-Id: <20190228054627.GC3253@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ref_type_id" variable needs to be signed for the error handling
to work.

Fixes: d5caef5b5655 ("btf: add BTF types deduplication algorithm")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This goes through the BPF tree probably, although it does apply to
net-next.

 tools/lib/bpf/btf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index 68b50e9bbde1..8faed5386124 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -2326,7 +2326,8 @@ static int btf_dedup_ref_type(struct btf_dedup *d, __u32 type_id)
 	struct btf_type *t, *cand;
 	/* if we don't find equivalent type, then we are representative type */
 	__u32 new_id = type_id;
-	__u32 h, ref_type_id;
+	__u32 h;
+	int ref_type_id;
 
 	if (d->map[type_id] = BTF_IN_PROGRESS_ID)
 		return -ELOOP;
-- 
2.17.1
