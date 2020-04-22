From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 22 Apr 2020 08:30:09 +0000
Subject: [PATCH bpf-next 1/2] bpf: Change error code when ops is NULL
Message-Id: <20200422083010.28000-2-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422083010.28000-1-maowenan@huawei.com>
In-Reply-To: <20200422083010.28000-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is one error printed when use type
BPF_MAP_TYPE_SOCKMAP to create map:
libbpf: failed to create map (name: 'sock_map'): Invalid argument(-22)

This is because CONFIG_BPF_STREAM_PARSER is not set, and
bpf_map_types[type] return invalid ops. It is not clear
to show the cause of config missing with return code -EINVAL,
so add pr_warn() and change error code to describe the reason.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 kernel/bpf/syscall.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index d85f37239540..f67bc063bf75 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -112,9 +112,11 @@ static struct bpf_map *find_and_alloc_map(union bpf_attr *attr)
 		return ERR_PTR(-EINVAL);
 	type = array_index_nospec(type, ARRAY_SIZE(bpf_map_types));
 	ops = bpf_map_types[type];
-	if (!ops)
-		return ERR_PTR(-EINVAL);
-
+	if (!ops) {
+		pr_warn("map type %d not supported or
+			 kernel config not opened\n", type);
+		return ERR_PTR(-EOPNOTSUPP);
+	}
 	if (ops->map_alloc_check) {
 		err = ops->map_alloc_check(attr);
 		if (err)
-- 
2.20.1
