From: Colin King <colin.king@canonical.com>
Date: Mon, 12 Mar 2018 17:25:38 +0000
Subject: [PATCH] rxrpc: remove redundant initialization of variable 'len'
Message-Id: <20180312172538.31707-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, "David S . Miller" <davem@davemloft.net>, linux-afs@lists.infradead.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable 'len' is being initialized with a value that is never
read and it is re-assigned later, hence the initialization is redundant
and can be removed.

Cleans up clang warning:
net/rxrpc/recvmsg.c:275:15: warning: Value stored to 'len' during its
initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/rxrpc/recvmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index 9d45d8b56744..7bff716e911e 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -272,7 +272,7 @@ static int rxrpc_locate_data(struct rxrpc_call *call, struct sk_buff *skb,
 			     unsigned int *_offset, unsigned int *_len)
 {
 	unsigned int offset = sizeof(struct rxrpc_wire_header);
-	unsigned int len = *_len;
+	unsigned int len;
 	int ret;
 	u8 annotation = *_annotation;
 
-- 
2.15.1

