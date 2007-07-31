From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:16:59 +0000
Subject: [PATCH 39] net/ipv4/ip_options.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312016.59970.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org, davem@davemloft.net

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 net/ipv4/ip_options.c | 15425 -> 15368 (-57 bytes)
 net/ipv4/ip_options.o | 133668 -> 133588 (-80 bytes)

 net/ipv4/ip_options.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- linux-2.6.23-rc1-mm1-a/net/ipv4/ip_options.c	2007-07-26 13:07:44.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/net/ipv4/ip_options.c	2007-07-31 15:17:22.000000000 +0200
@@ -513,11 +513,8 @@ void ip_options_undo(struct ip_options *

 static struct ip_options *ip_options_get_alloc(const int optlen)
 {
-	struct ip_options *opt = kmalloc(sizeof(*opt) + ((optlen + 3) & ~3),
-					 GFP_KERNEL);
-	if (opt)
-		memset(opt, 0, sizeof(*opt));
-	return opt;
+	return kzalloc(sizeof(struct ip_options) + ((optlen + 3) & ~3),
+		       GFP_KERNEL);
 }

 static int ip_options_get_finish(struct ip_options **optp,
