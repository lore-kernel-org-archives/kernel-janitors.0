From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 18:42:30 +0000
Subject: [PATCH 2/3] net: sched: cls_fw: Improve two size determinations in fw_change()
Message-Id: <fd17f239-4d25-fdd5-bef6-6c50462fd22b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <32efa965-896f-f24a-4d30-586e10c54a5b@users.sourceforge.net>
In-Reply-To: <32efa965-896f-f24a-4d30-586e10c54a5b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 19:19:10 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/sched/cls_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sched/cls_fw.c b/net/sched/cls_fw.c
index 567db4d2349f..53c1c8ae3e00 100644
--- a/net/sched/cls_fw.c
+++ b/net/sched/cls_fw.c
@@ -269,7 +269,7 @@ static int fw_change(struct net *net, struct sk_buff *in_skb,
 		if (f->id != handle && handle)
 			return -EINVAL;
 
-		fnew = kzalloc(sizeof(struct fw_filter), GFP_KERNEL);
+		fnew = kzalloc(sizeof(*fnew), GFP_KERNEL);
 		if (!fnew)
 			return -ENOBUFS;
 
@@ -323,7 +323,7 @@ static int fw_change(struct net *net, struct sk_buff *in_skb,
 		rcu_assign_pointer(tp->root, head);
 	}
 
-	f = kzalloc(sizeof(struct fw_filter), GFP_KERNEL);
+	f = kzalloc(sizeof(*f), GFP_KERNEL);
 	if (f = NULL)
 		return -ENOBUFS;
 
-- 
2.15.0

