From: Colin King <colin.king@canonical.com>
Date: Tue, 09 Apr 2019 12:59:12 +0000
Subject: [PATCH] dns: remove redundant zero length namelen check
Message-Id: <20190409125912.11600-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The zero namelen check is redundant as it has already been checked
for zero at the start of the function.  Remove the redundant check.

Addresses-Coverity: ("Logically Dead Code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/dns_resolver/dns_query.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/dns_resolver/dns_query.c b/net/dns_resolver/dns_query.c
index 76338c38738a..19aa32fc1802 100644
--- a/net/dns_resolver/dns_query.c
+++ b/net/dns_resolver/dns_query.c
@@ -94,8 +94,6 @@ int dns_query(const char *type, const char *name, size_t namelen,
 		desclen += typelen + 1;
 	}
 
-	if (!namelen)
-		namelen = strnlen(name, 256);
 	if (namelen < 3 || namelen > 255)
 		return -EINVAL;
 	desclen += namelen + 1;
-- 
2.20.1
