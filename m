From: Dan Carpenter <error27@gmail.com>
Date: Mon, 04 Oct 2010 12:28:36 +0000
Subject: [patch] cls_u32: signedness bug
Message-Id: <20101004122836.GB5692@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <hadi@cyberus.ca>
Cc: "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Frans Pop <elendil@planet.nl>, Changli Gao <xiaosuo@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

skb_headroom() is unsigned so "skb_headroom(skb) + toff" is also
unsigned and can't be less than zero.  This test was added in 66d50d25:
"u32: negative offset fix"  It was supposed to fix a regression.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.  Please check.

diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
index 7416a5c..b0c2a82 100644
--- a/net/sched/cls_u32.c
+++ b/net/sched/cls_u32.c
@@ -137,7 +137,7 @@ next_knode:
 			int toff = off + key->off + (off2 & key->offmask);
 			__be32 *data, _data;
 
-			if (skb_headroom(skb) + toff < 0)
+			if (skb_headroom(skb) + toff > INT_MAX)
 				goto out;
 
 			data = skb_header_pointer(skb, toff, 4, &_data);
