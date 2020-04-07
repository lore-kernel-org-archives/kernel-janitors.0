From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 07 Apr 2020 19:00:29 +0000
Subject: [PATCH] checkpatch: Fix a typo in the regex for $allocFunctions
Message-Id: <20200407190029.892-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: apw@canonical.com, joe@perches.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Here, we look for function such as 'netdev_alloc_skb_ip_align', so a '_'
is missing in the regex.

To make sure:
   grep -r --include=*.c skbip_a * | wc   =>   0 results
   grep -r --include=*.c skb_ip_a * | wc  => 112 results

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 529c892722b9..c392ab8ea12e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -479,7 +479,7 @@ our $allocFunctions = qr{(?x:
 		(?:kv|k|v)[czm]alloc(?:_node|_array)? |
 		kstrdup(?:_const)? |
 		kmemdup(?:_nul)?) |
-	(?:\w+)?alloc_skb(?:ip_align)? |
+	(?:\w+)?alloc_skb(?:_ip_align)? |
 				# dev_alloc_skb/netdev_alloc_skb, et al
 	dma_alloc_coherent
 )};
-- 
2.20.1
