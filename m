From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 26 May 2018 09:47:26 +0000
Subject: [PATCH net-next] net: bpfilter: make function bpfilter_mbox_request() static
Message-Id: <1527328046-84978-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Alexei Starovoitov <ast@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

net/ipv4/bpfilter/sockopt.c:13:5: warning:
 symbol 'bpfilter_mbox_request' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/ipv4/bpfilter/sockopt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/bpfilter/sockopt.c b/net/ipv4/bpfilter/sockopt.c
index 42a96d2..5e04ed2 100644
--- a/net/ipv4/bpfilter/sockopt.c
+++ b/net/ipv4/bpfilter/sockopt.c
@@ -10,8 +10,9 @@
 				unsigned int optlen, bool is_set);
 EXPORT_SYMBOL_GPL(bpfilter_process_sockopt);
 
-int bpfilter_mbox_request(struct sock *sk, int optname, char __user *optval,
-			  unsigned int optlen, bool is_set)
+static int bpfilter_mbox_request(struct sock *sk, int optname,
+				 char __user *optval,
+				 unsigned int optlen, bool is_set)
 {
 	if (!bpfilter_process_sockopt) {
 		int err = request_module("bpfilter");

