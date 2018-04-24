From: Colin King <colin.king@canonical.com>
Date: Tue, 24 Apr 2018 12:36:58 +0000
Subject: [PATCH] net/tls: remove redundant second null check on sgout
Message-Id: <20180424123658.6541-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ilya Lesokhin <ilyal@mellanox.com>, Aviad Yehezkel <aviadye@mellanox.com>, Dave Watson <davejwatson@fb.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A duplicated null check on sgout is redundant as it is known to be
already true because of the identical earlier check. Remove it.
Detected by cppcheck:

net/tls/tls_sw.c:696: (warning) Identical inner 'if' condition is always
true.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/tls/tls_sw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 71e79597f940..6ed1c02cfc94 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -693,8 +693,7 @@ static int decrypt_skb(struct sock *sk, struct sk_buff *skb,
 	if (!sgout) {
 		nsg = skb_cow_data(skb, 0, &unused) + 1;
 		sgin = kmalloc_array(nsg, sizeof(*sgin), sk->sk_allocation);
-		if (!sgout)
-			sgout = sgin;
+		sgout = sgin;
 	}
 
 	sg_init_table(sgin, nsg);
-- 
2.17.0

