From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 10 Jan 2018 13:06:46 +0000
Subject: [PATCH net-next] netfilter: nf_queue: remove duplicated include from nf_queue.c
Message-Id: <1515589606-71967-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/netfilter/nf_queue.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/netfilter/nf_queue.c b/net/netfilter/nf_queue.c
index 7f55af5..d67a96a 100644
--- a/net/netfilter/nf_queue.c
+++ b/net/netfilter/nf_queue.c
@@ -15,8 +15,6 @@
 #include <linux/netfilter_bridge.h>
 #include <linux/seq_file.h>
 #include <linux/rcupdate.h>
-#include <linux/netfilter_ipv4.h>
-#include <linux/netfilter_ipv6.h>
 #include <net/protocol.h>
 #include <net/netfilter/nf_queue.h>
 #include <net/dst.h>

