From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 26 Sep 2018 12:09:45 +0000
Subject: [PATCH net-next] net/core: make function ___gnet_stats_copy_basic() static
Message-Id: <1537963785-165570-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: john.fastabend@gmail.com, toke@toke.dk, echaudro@redhat.com
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

net/core/gen_stats.c:166:1: warning:
 symbol '___gnet_stats_copy_basic' was not declared. Should it be static?

Fixes: 5e111210a443 ("net/core: Add new basic hardware counter")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/core/gen_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/gen_stats.c b/net/core/gen_stats.c
index 65a2e82..9bf1b9a 100644
--- a/net/core/gen_stats.c
+++ b/net/core/gen_stats.c
@@ -162,7 +162,7 @@
 }
 EXPORT_SYMBOL(__gnet_stats_copy_basic);
 
-int
+static int
 ___gnet_stats_copy_basic(const seqcount_t *running,
 			 struct gnet_dump *d,
 			 struct gnet_stats_basic_cpu __percpu *cpu,
