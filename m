From: Colin King <colin.king@canonical.com>
Date: Tue, 12 May 2020 17:13:55 +0000
Subject: [PATCH][next] sfc: fix dereference of table before it is null checked
Message-Id: <20200512171355.221810-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>, Martin Habets <mhabets@solarflare.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer table is being dereferenced on a null check of
table->must_restore_filters before it is being null checked, leading
to a potential null pointer dereference issue.  Fix this by null
checking table before dereferencing it when checking for a null
table->must_restore_filters.

Addresses-Coverity: ("Dereference before null check")
Fixes: e4fe938cff04 ("sfc: move 'must restore' flags out of ef10-specific nic_data")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sfc/mcdi_filters.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/sfc/mcdi_filters.c b/drivers/net/ethernet/sfc/mcdi_filters.c
index 88de95a8c08c..455a62814fb9 100644
--- a/drivers/net/ethernet/sfc/mcdi_filters.c
+++ b/drivers/net/ethernet/sfc/mcdi_filters.c
@@ -1369,10 +1369,7 @@ void efx_mcdi_filter_table_restore(struct efx_nic *efx)
 
 	WARN_ON(!rwsem_is_locked(&efx->filter_sem));
 
-	if (!table->must_restore_filters)
-		return;
-
-	if (!table)
+	if (!table || !table->must_restore_filters)
 		return;
 
 	down_write(&table->lock);
-- 
2.25.1
