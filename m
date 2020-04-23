From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 23 Apr 2020 03:33:14 +0000
Subject: [PATCH bpf-next v2 2/2] libbpf: Return err if bpf_object__load failed
Message-Id: <20200423033314.49205-3-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422093329.GI2659@kadam>
 <20200423033314.49205-1-maowenan@huawei.com>
In-Reply-To: <20200423033314.49205-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com, andrii.nakryiko@gmail.com

bpf_object__load() has various return code, when it failed to load
object, it must return err instead of -EINVAL.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
Acked-by: Andrii Nakryiko <andriin@fb.com>
---
 tools/lib/bpf/libbpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 8f480e29a6b0..8e1dc6980fac 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -7006,7 +7006,7 @@ int bpf_prog_load_xattr(const struct bpf_prog_load_attr *attr,
 	err = bpf_object__load(obj);
 	if (err) {
 		bpf_object__close(obj);
-		return -EINVAL;
+		return err;
 	}
 
 	*pobj = obj;
-- 
2.20.1
