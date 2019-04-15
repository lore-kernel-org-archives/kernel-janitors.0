From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Apr 2019 11:44:14 +0000
Subject: [PATCH] [NETFILTER]: nf_conntrack_h323: fix spelling mistake "authenticaton" -> "authentication"
Message-Id: <20190415114414.24600-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The appears to be a spelling mistake in one of the entries in the
_SecurityCapabilities array. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netfilter/nf_conntrack_h323_types.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_h323_types.c b/net/netfilter/nf_conntrack_h323_types.c
index d880f3523c1d..95a0b3d6b24d 100644
--- a/net/netfilter/nf_conntrack_h323_types.c
+++ b/net/netfilter/nf_conntrack_h323_types.c
@@ -1109,7 +1109,7 @@ static const struct field_t _SecurityCapabilities[] = {	/* SEQUENCE */
 	 _NonStandardParameter},
 	{FNAME("encryption") CHOICE, 2, 3, 3, SKIP | EXT, 0,
 	 _SecurityServiceMode},
-	{FNAME("authenticaton") CHOICE, 2, 3, 3, SKIP | EXT, 0,
+	{FNAME("authentication") CHOICE, 2, 3, 3, SKIP | EXT, 0,
 	 _SecurityServiceMode},
 	{FNAME("integrity") CHOICE, 2, 3, 3, SKIP | EXT, 0,
 	 _SecurityServiceMode},
-- 
2.20.1
