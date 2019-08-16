From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 16 Aug 2019 02:40:44 +0000
Subject: [PATCH -next v2] btf: fix return value check in btf_vmlinux_init()
Message-Id: <20190816024044.139761-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815142432.101401-1-weiyongjun1@huawei.com>
In-Reply-To: <20190815142432.101401-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function kobject_create_and_add() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Fixes: 341dfcf8d78e ("btf: expose BTF info through sysfs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Acked-by: Andrii Nakryiko <andriin@fb.com>
---
 kernel/bpf/sysfs_btf.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/sysfs_btf.c b/kernel/bpf/sysfs_btf.c
index 4659349fc795..7ae5dddd1fe6 100644
--- a/kernel/bpf/sysfs_btf.c
+++ b/kernel/bpf/sysfs_btf.c
@@ -30,17 +30,12 @@ static struct kobject *btf_kobj;
 
 static int __init btf_vmlinux_init(void)
 {
-	int err;
-
 	if (!_binary__btf_vmlinux_bin_start)
 		return 0;
 
 	btf_kobj = kobject_create_and_add("btf", kernel_kobj);
-	if (IS_ERR(btf_kobj)) {
-		err = PTR_ERR(btf_kobj);
-		btf_kobj = NULL;
-		return err;
-	}
+	if (!btf_kobj)
+		return -ENOMEM;
 
 	bin_attr_btf_vmlinux.size = _binary__btf_vmlinux_bin_end -
 				    _binary__btf_vmlinux_bin_start;
