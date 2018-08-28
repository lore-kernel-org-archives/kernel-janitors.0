From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 28 Aug 2018 07:42:32 +0000
Subject: [PATCH bpf-next] bpf: remove duplicated include from syscall.c
Message-Id: <1535442152-5021-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 kernel/bpf/syscall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 8339d81..3c9636f 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -30,7 +30,6 @@
 #include <linux/cred.h>
 #include <linux/timekeeping.h>
 #include <linux/ctype.h>
-#include <linux/btf.h>
 #include <linux/nospec.h>
 
 #define IS_FD_ARRAY(map) ((map)->map_type = BPF_MAP_TYPE_PROG_ARRAY || \
