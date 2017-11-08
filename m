From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 18:41:38 +0000
Subject: [PATCH 1/3] net: sched: cls_fw: Use common error handling code in fw_change()
Message-Id: <748e1a55-dd2d-e5e0-1097-73664115668f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <32efa965-896f-f24a-4d30-586e10c54a5b@users.sourceforge.net>
In-Reply-To: <32efa965-896f-f24a-4d30-586e10c54a5b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 19:15:08 +0100

Add a jump target so that a bit of exception handling can be better reused
in an if branch of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/sched/cls_fw.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/sched/cls_fw.c b/net/sched/cls_fw.c
index 5908f56f76da..567db4d2349f 100644
--- a/net/sched/cls_fw.c
+++ b/net/sched/cls_fw.c
@@ -281,14 +281,13 @@ static int fw_change(struct net *net, struct sk_buff *in_skb,
 		fnew->tp = f->tp;
 
 		err = tcf_exts_init(&fnew->exts, TCA_FW_ACT, TCA_FW_POLICE);
-		if (err < 0) {
-			kfree(fnew);
-			return err;
-		}
+		if (err < 0)
+			goto free_filter;
 
 		err = fw_set_parms(net, tp, fnew, tb, tca, base, ovr);
 		if (err < 0) {
 			tcf_exts_destroy(&fnew->exts);
+free_filter:
 			kfree(fnew);
 			return err;
 		}
-- 
2.15.0

