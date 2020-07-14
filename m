From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 14 Jul 2020 06:30:25 +0000
Subject: [PATCH -next] PM / devfreq: Fix missing unlock on error in devfreq_add_device()
Message-Id: <20200714063025.118829-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Add the missing unlock before return from function devfreq_add_device()
in the error handling case.

Fixes: d7c46505a7ad ("PM / devfreq: Add support delayed timer for polling mode")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/devfreq/devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 5320c3b37f35..2b54a59bb281 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -788,6 +788,7 @@ struct devfreq *devfreq_add_device(struct device *dev,
 
 	if (devfreq->profile->timer < 0
 		|| devfreq->profile->timer >= DEVFREQ_TIMER_NUM) {
+		mutex_unlock(&devfreq->lock);
 		goto err_out;
 	}
