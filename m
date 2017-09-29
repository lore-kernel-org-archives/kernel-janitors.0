From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Sep 2017 14:01:16 +0000
Subject: [PATCH][net-next] net_sched: remove redundant assignment to ret
Message-Id: <20170929140116.8642-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of -EINVAL to variable ret is redundant as it
is being overwritten on the following error exit paths or
to the return value from the following call to basic_set_parms.
Fix this up by removing it. Cleans up clang warning message:

net/sched/cls_basic.c:185:2: warning: Value stored to 'err' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sched/cls_basic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/sched/cls_basic.c b/net/sched/cls_basic.c
index cfeb6f158566..700b345b07f9 100644
--- a/net/sched/cls_basic.c
+++ b/net/sched/cls_basic.c
@@ -182,7 +182,6 @@ static int basic_change(struct net *net, struct sk_buff *in_skb,
 	if (err < 0)
 		goto errout;
 
-	err = -EINVAL;
 	if (handle) {
 		fnew->handle = handle;
 		if (!fold) {
-- 
2.14.1

