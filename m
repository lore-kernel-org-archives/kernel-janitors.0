From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 28 May 2020 07:43:59 +0000
Subject: [PATCH net-next] tipc: remove set but not used variable 'prev'
Message-Id: <20200528074359.116680-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>, Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/tipc/msg.c: In function 'tipc_msg_append':
net/tipc/msg.c:215:24: warning:
 variable 'prev' set but not used [-Wunused-but-set-variable]

commit 0a3e060f340d ("tipc: add test for Nagle algorithm effectiveness")
left behind this, remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/tipc/msg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/tipc/msg.c b/net/tipc/msg.c
index 23809039dda1..c0afcd627c5e 100644
--- a/net/tipc/msg.c
+++ b/net/tipc/msg.c
@@ -212,7 +212,7 @@ int tipc_buf_append(struct sk_buff **headbuf, struct sk_buff **buf)
 int tipc_msg_append(struct tipc_msg *_hdr, struct msghdr *m, int dlen,
 		    int mss, struct sk_buff_head *txq)
 {
-	struct sk_buff *skb, *prev;
+	struct sk_buff *skb;
 	int accounted, total, curr;
 	int mlen, cpy, rem = dlen;
 	struct tipc_msg *hdr;
@@ -223,7 +223,6 @@ int tipc_msg_append(struct tipc_msg *_hdr, struct msghdr *m, int dlen,
 
 	while (rem) {
 		if (!skb || skb->len >= mss) {
-			prev = skb;
 			skb = tipc_buf_acquire(mss, GFP_KERNEL);
 			if (unlikely(!skb))
 				return -ENOMEM;
