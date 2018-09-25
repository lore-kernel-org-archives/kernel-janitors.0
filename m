From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 25 Sep 2018 14:39:25 +0000
Subject: [PATCH -next] PM / OPP: Make function _add_opp_dev_unlocked() static
Message-Id: <1537886365-24923-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/opp/core.c:762:19: warning:
 symbol '_add_opp_dev_unlocked' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/opp/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index aaef20c..cdf918a 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -759,8 +759,8 @@ static void _remove_opp_dev(struct opp_device *opp_dev,
 	kfree(opp_dev);
 }
 
-struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
-					 struct opp_table *opp_table)
+static struct opp_device *_add_opp_dev_unlocked(const struct device *dev,
+						struct opp_table *opp_table)
 {
 	struct opp_device *opp_dev;
 	int ret;
