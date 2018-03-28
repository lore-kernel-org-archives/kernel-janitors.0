From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:09 +0000
Subject: [PATCH net-next] cxgb4: fix error return code in adap_init0()
Message-Id: <1522241469-77623-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ganesh Goudar <ganeshgr@chelsio.com>, Kumar Sanghvi <kumaras@chelsio.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the hash filter init error
handling case instead of 0, as done elsewhere in this function.

Fixes: 5c31254e35a8 ("cxgb4: initialize hash-filter configuration")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index 57d38f8..0072580 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -4449,7 +4449,8 @@ static int adap_init0(struct adapter *adap)
 		adap->params.ofldq_wr_cred = val[5];
 
 		if (caps_cmd.niccaps & htons(FW_CAPS_CONFIG_NIC_HASHFILTER)) {
-			if (init_hash_filter(adap) < 0)
+			ret = init_hash_filter(adap);
+			if (ret < 0)
 				goto bye;
 		} else {
 			adap->params.offload = 1;

