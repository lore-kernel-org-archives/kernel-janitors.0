From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:42:09 +0000
Subject: [PATCH net-next] net: hns: make function hns_gmac_wait_fifo_clean() static
Message-Id: <1536975729-187303-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Peng Li <lipeng321@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c:322:5: warning:
 symbol 'hns_gmac_wait_fifo_clean' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c
index 09e4061..aaf72c0 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c
@@ -319,7 +319,7 @@ static void hns_gmac_set_promisc(void *mac_drv, u8 en)
 		hns_gmac_set_uc_match(mac_drv, en);
 }
 
-int hns_gmac_wait_fifo_clean(void *mac_drv)
+static int hns_gmac_wait_fifo_clean(void *mac_drv)
 {
 	struct mac_driver *drv = (struct mac_driver *)mac_drv;
 	int wait_cnt;
