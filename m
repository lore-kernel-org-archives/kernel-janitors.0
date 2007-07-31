From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:08:23 +0000
Subject: [PATCH 74] include/linux/textsearch.h: kmalloc + memset conversion to kzalloc
Message-Id: <200708010008.23721.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 include/linux/textsearch.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/include/linux/textsearch.h	2007-07-26 13:07:40.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/include/linux/textsearch.h	2007-07-31 11:58:29.000000000 +0200
@@ -164,11 +164,10 @@ static inline struct ts_config *alloc_ts
 {
 	struct ts_config *conf;

-	conf = kmalloc(TS_PRIV_ALIGN(sizeof(*conf)) + payload, gfp_mask);
-	if (conf = NULL)
+	conf = kzalloc(TS_PRIV_ALIGN(sizeof(*conf)) + payload, gfp_mask);
+	if (!conf)
 		return ERR_PTR(-ENOMEM);

-	memset(conf, 0, TS_PRIV_ALIGN(sizeof(*conf)) + payload);
 	return conf;
 }

