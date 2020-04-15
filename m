From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Apr 2020 23:16:30 +0000
Subject: [PATCH] ipv6: remove redundant assignment to variable err
Message-Id: <20200415231630.1568296-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/seg6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/seg6.c b/net/ipv6/seg6.c
index 75421a472d25..4c7e0a27fa9c 100644
--- a/net/ipv6/seg6.c
+++ b/net/ipv6/seg6.c
@@ -434,7 +434,7 @@ static struct genl_family seg6_genl_family __ro_after_init = {
 
 int __init seg6_init(void)
 {
-	int err = -ENOMEM;
+	int err;
 
 	err = genl_register_family(&seg6_genl_family);
 	if (err)
-- 
2.25.1
