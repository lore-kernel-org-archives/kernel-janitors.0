From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Apr 2020 21:51:49 +0000
Subject: [PATCH] net: ipv4: remove redundant assignment to variable rc
Message-Id: <20200420215149.98490-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being assigned with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/af_inet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index cf58e29cf746..c618e242490f 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1914,7 +1914,7 @@ static int __init inet_init(void)
 {
 	struct inet_protosw *q;
 	struct list_head *r;
-	int rc = -EINVAL;
+	int rc;
 
 	sock_skb_cb_check_size(sizeof(struct inet_skb_parm));
 
-- 
2.25.1
