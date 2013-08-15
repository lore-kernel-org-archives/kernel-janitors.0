From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2013 07:55:10 +0000
Subject: [patch] PM / devfreq: create_freezable_workqueue() doesn't return an ERR_PTR
Message-Id: <20130815075509.GB19280@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The create_freezable_workqueue() function returns a NULL on error and
not an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index e94e619..5088523 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -983,10 +983,10 @@ static int __init devfreq_init(void)
 	}
 
 	devfreq_wq = create_freezable_workqueue("devfreq_wq");
-	if (IS_ERR(devfreq_wq)) {
+	if (!devfreq_wq) {
 		class_destroy(devfreq_class);
 		pr_err("%s: couldn't create workqueue\n", __FILE__);
-		return PTR_ERR(devfreq_wq);
+		return -ENOMEM;
 	}
 	devfreq_class->dev_attrs = devfreq_attrs;
 
