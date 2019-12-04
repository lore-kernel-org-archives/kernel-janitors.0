From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Dec 2019 15:11:44 +0000
Subject: [PATCH] net/decnet: fix -EFAULT error that is not getting returned
Message-Id: <20191204151144.1434209-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently an -EFAULT error on a memcpy_to_msg is not being returned
because it is being overwritten when variable rv is being re-assigned
to the number of bytes copied after breaking out of a loop. Fix this
by instead assigning the error to variable copied so that this error
code propegated to rv and hence is returned at the end of the function.

[ This bug was was introduced before the current git history ]

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/decnet/af_decnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/decnet/af_decnet.c b/net/decnet/af_decnet.c
index e19a92a62e14..e23d9f219597 100644
--- a/net/decnet/af_decnet.c
+++ b/net/decnet/af_decnet.c
@@ -1759,7 +1759,7 @@ static int dn_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 			chunk = size - copied;
 
 		if (memcpy_to_msg(msg, skb->data, chunk)) {
-			rv = -EFAULT;
+			copied = -EFAULT;
 			break;
 		}
 		copied += chunk;
-- 
2.24.0
