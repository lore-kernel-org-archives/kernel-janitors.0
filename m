From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 07 Dec 2020 12:37:20 +0000
Subject: [PATCH] bpf: propagate __user annotations properly
Message-Id: <20201207123720.19111-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, kernel-janitors@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

__htab_map_lookup_and_delete_batch() stores a user pointer in the local
variable ubatch and uses that in copy_{from,to}_user(), but ubatch misses a
__user annotation.

So, sparse warns in the various assignments and uses of ubatch:

  kernel/bpf/hashtab.c:1415:24: warning: incorrect type in initializer
    (different address spaces)
  kernel/bpf/hashtab.c:1415:24:    expected void *ubatch
  kernel/bpf/hashtab.c:1415:24:    got void [noderef] __user *

  kernel/bpf/hashtab.c:1444:46: warning: incorrect type in argument 2
    (different address spaces)
  kernel/bpf/hashtab.c:1444:46:    expected void const [noderef] __user *from
  kernel/bpf/hashtab.c:1444:46:    got void *ubatch

  kernel/bpf/hashtab.c:1608:16: warning: incorrect type in assignment
    (different address spaces)
  kernel/bpf/hashtab.c:1608:16:    expected void *ubatch
  kernel/bpf/hashtab.c:1608:16:    got void [noderef] __user *

  kernel/bpf/hashtab.c:1609:26: warning: incorrect type in argument 1
    (different address spaces)
  kernel/bpf/hashtab.c:1609:26:    expected void [noderef] __user *to
  kernel/bpf/hashtab.c:1609:26:    got void *ubatch

Add the __user annotation to repair this chain of propagating __user
annotations in __htab_map_lookup_and_delete_batch().

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master (v5.10-rc7) and next-20201204

BPF maintainers, please pick this minor non-urgent clean-up patch.

 kernel/bpf/hashtab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index fe7a0733a63a..76c791def033 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -1412,7 +1412,7 @@ __htab_map_lookup_and_delete_batch(struct bpf_map *map,
 	void *keys = NULL, *values = NULL, *value, *dst_key, *dst_val;
 	void __user *uvalues = u64_to_user_ptr(attr->batch.values);
 	void __user *ukeys = u64_to_user_ptr(attr->batch.keys);
-	void *ubatch = u64_to_user_ptr(attr->batch.in_batch);
+	void __user *ubatch = u64_to_user_ptr(attr->batch.in_batch);
 	u32 batch, max_count, size, bucket_size;
 	struct htab_elem *node_to_free = NULL;
 	u64 elem_map_flags, map_flags;
-- 
2.17.1
