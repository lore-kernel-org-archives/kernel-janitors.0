From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Feb 2020 06:42:22 +0000
Subject: [PATCH] netfilter: clean up some indenting
Message-Id: <20200225064150.hwewi26uc2yfwh2u@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Manoj Basapathi <manojbm@codeaurora.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

These lines were indented wrong so Smatch complained.
net/netfilter/xt_IDLETIMER.c:81 idletimer_tg_show() warn: inconsistent indenting

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/netfilter/xt_IDLETIMER.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/netfilter/xt_IDLETIMER.c b/net/netfilter/xt_IDLETIMER.c
index d620bbf13b30..75bd0e5dd312 100644
--- a/net/netfilter/xt_IDLETIMER.c
+++ b/net/netfilter/xt_IDLETIMER.c
@@ -77,9 +77,8 @@ static ssize_t idletimer_tg_show(struct device *dev,
 			ktimespec = ktime_to_timespec64(expires_alarm);
 			time_diff = ktimespec.tv_sec;
 		} else {
-		expires = timer->timer.expires;
-			time_diff = jiffies_to_msecs(
-						expires - jiffies) / 1000;
+			expires = timer->timer.expires;
+			time_diff = jiffies_to_msecs(expires - jiffies) / 1000;
 		}
 	}
 
@@ -216,7 +215,7 @@ static int idletimer_tg_create_v1(struct idletimer_tg_info_v1 *info)
 	kobject_uevent(idletimer_tg_kobj,KOBJ_ADD);
 
 	list_add(&info->timer->entry, &idletimer_tg_list);
-		pr_debug("timer type value is %u", info->timer_type);
+	pr_debug("timer type value is %u", info->timer_type);
 	info->timer->timer_type = info->timer_type;
 	info->timer->refcnt = 1;
 
-- 
2.11.0
