From: Mao Wenan <maowenan@huawei.com>
Date: Sun, 26 Apr 2020 06:36:35 +0000
Subject: [PATCH bpf-next v3 2/2] libbpf: Return err if bpf_object__load failed
Message-Id: <20200426063635.130680-3-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426063635.130680-1-maowenan@huawei.com>
In-Reply-To: <20200426063635.130680-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org, andrii.nakryiko@gmail.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

bpf_object__load() has various return code, when it failed to load
object, it must return err instead of -EINVAL.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
Acked-by: Andrii Nakryiko <andriin@fb.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
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
