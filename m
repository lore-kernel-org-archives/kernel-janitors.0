From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:10:38 +0000
Subject: [PATCH net-next] net: aquantia: make symbol hw_atl_boards static
Message-Id: <1516673438-170662-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Arcari <darcari@redhat.com>, Colin Ian King <colin.king@canonical.com>, David VomLehn <vomlehn@texas.net>, Igor Russkikh <igor.russkikh@aquantia.com>, Pavel Belous <pavel.belous@aquantia.com>, Dmitrii Tarakanov <Dmitrii.Tarakanov@aquantia.com>, Alexander Loktionov <Alexander.Loktionov@aquantia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c:50:34: warning:
 symbol 'hw_atl_boards' was not declared. Should it be static?

Fixes: 4948293ff963 ("net: aquantia: Introduce new AQC devices and capabilities")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
index f5dd5f7..51a1a90 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
@@ -47,7 +47,7 @@
 	{}
 };
 
-const struct aq_board_revision_s hw_atl_boards[] = {
+static const struct aq_board_revision_s hw_atl_boards[] = {
 	{ AQ_DEVICE_ID_0001,	AQ_HWREV_1,	&hw_atl_ops_a0, &hw_atl_a0_caps_aqc107, },
 	{ AQ_DEVICE_ID_D100,	AQ_HWREV_1,	&hw_atl_ops_a0, &hw_atl_a0_caps_aqc100, },
 	{ AQ_DEVICE_ID_D107,	AQ_HWREV_1,	&hw_atl_ops_a0, &hw_atl_a0_caps_aqc107, },

