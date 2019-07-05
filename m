From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 05 Jul 2019 08:26:25 +0000
Subject: [PATCH net-next] nfp: tls: fix error return code in nfp_net_tls_add()
Message-Id: <20190705082625.168515-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>, Dirk van der Merwe <dirk.vandermerwe@netronome.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -EINVAL from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 1f35a56cf586 ("nfp: tls: add/delete TLS TX connections")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/netronome/nfp/crypto/tls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/netronome/nfp/crypto/tls.c b/drivers/net/ethernet/netronome/nfp/crypto/tls.c
index 3ee829d69c04..9f7ccb7da417 100644
--- a/drivers/net/ethernet/netronome/nfp/crypto/tls.c
+++ b/drivers/net/ethernet/netronome/nfp/crypto/tls.c
@@ -344,6 +344,7 @@ nfp_net_tls_add(struct net_device *netdev, struct sock *sk,
 
 	if (!reply->handle[0] && !reply->handle[1]) {
 		nn_dp_warn(&nn->dp, "FW returned NULL handle\n");
+		err = -EINVAL;
 		goto err_fw_remove;
 	}
