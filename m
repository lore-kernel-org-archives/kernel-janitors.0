From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:55:02 +0000
Subject: [PATCH 67] net/ipv4/route.c: mostly kmalloc + memset conversion to k[cz]alloc
Message-Id: <200707312355.03321.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, davem@davemloft.net, netdev@vger.kernel.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 net/ipv4/route.c | 75650 -> 75628 (-22 bytes)
 net/ipv4/route.o | 256303 -> 256467 (+164 bytes)

 net/ipv4/route.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/net/ipv4/route.c	2007-07-26 13:07:44.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/net/ipv4/route.c	2007-07-31 15:21:41.000000000 +0200
@@ -374,8 +374,9 @@ static int rt_cache_seq_open(struct inod
 {
 	struct seq_file *seq;
 	int rc = -ENOMEM;
-	struct rt_cache_iter_state *s = kmalloc(sizeof(*s), GFP_KERNEL);
-
+	struct rt_cache_iter_state *s;
+
+	s = kzalloc(sizeof(*s), GFP_KERNEL);
 	if (!s)
 		goto out;
 	rc = seq_open(file, &rt_cache_seq_ops);
@@ -383,7 +384,6 @@ static int rt_cache_seq_open(struct inod
 		goto out_kfree;
 	seq          = file->private_data;
 	seq->private = s;
-	memset(s, 0, sizeof(*s));
 out:
 	return rc;
 out_kfree:
