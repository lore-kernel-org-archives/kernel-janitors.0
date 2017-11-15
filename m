From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Nov 2017 14:03:20 +0000
Subject: [PATCH] qed: use kzalloc instead of kmalloc and memset
Message-Id: <20171115140320.14174-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Replace kmalloc followed by a memset with kzalloc

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dcbx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dcbx.c b/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
index 6e15d3c10ebf..fe7c1f230028 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
@@ -1277,11 +1277,10 @@ static struct qed_dcbx_get *qed_dcbnl_get_dcbx(struct qed_hwfn *hwfn,
 {
 	struct qed_dcbx_get *dcbx_info;
 
-	dcbx_info = kmalloc(sizeof(*dcbx_info), GFP_ATOMIC);
+	dcbx_info = kzalloc(sizeof(*dcbx_info), GFP_ATOMIC);
 	if (!dcbx_info)
 		return NULL;
 
-	memset(dcbx_info, 0, sizeof(*dcbx_info));
 	if (qed_dcbx_query_params(hwfn, dcbx_info, type)) {
 		kfree(dcbx_info);
 		return NULL;
-- 
2.14.1

