From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Nov 2018 14:18:17 +0000
Subject: [PATCH] net/decnet: add missing indentation
Message-Id: <20181113141817.6189-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a missing indentation before the declaration of port. Add
it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/decnet/af_decnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/decnet/af_decnet.c b/net/decnet/af_decnet.c
index dbd0f7bae00a..bdccc46a2921 100644
--- a/net/decnet/af_decnet.c
+++ b/net/decnet/af_decnet.c
@@ -192,7 +192,7 @@ static int check_port(__le16 port)
 static unsigned short port_alloc(struct sock *sk)
 {
 	struct dn_scp *scp = DN_SK(sk);
-static unsigned short port = 0x2000;
+	static unsigned short port = 0x2000;
 	unsigned short i_port = port;
 
 	while(check_port(cpu_to_le16(++port)) != 0) {
-- 
2.19.1
