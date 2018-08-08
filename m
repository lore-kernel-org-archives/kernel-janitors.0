From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 08 Aug 2018 03:10:39 +0000
Subject: [PATCH net-next] ieee802154: hwsim: fix missing unlock on error in hwsim_add_one()
Message-Id: <1533697839-85602-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533696226-26445-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533696226-26445-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function hwsim_add_one()
in the error handling case.

Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ieee802154/mac802154_hwsim.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802154/mac802154_hwsim.c
index f4e9205..44d398c 100644
--- a/drivers/net/ieee802154/mac802154_hwsim.c
+++ b/drivers/net/ieee802154/mac802154_hwsim.c
@@ -810,8 +810,10 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
 	mutex_lock(&hwsim_phys_lock);
 	if (init) {
 		err = hwsim_subscribe_all_others(phy);
-		if (err < 0)
+		if (err < 0) {
+			mutex_unlock(&hwsim_phys_lock);
 			goto err_reg;
+		}
 	}
 	list_add_tail(&phy->list, &hwsim_phys);
 	mutex_unlock(&hwsim_phys_lock);

