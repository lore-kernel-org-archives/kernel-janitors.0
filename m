From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 12:13:01 +0000
Subject: [PATCH] sfc: remove redundant variable old_vlan
Message-Id: <20180704121301.8896-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>, Bert Kenward <bkenward@solarflare.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable old_vlan is being assigned but is never used hence it is
and can be removed.

Cleans up clang warning:
warning: variable 'old_vlan' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sfc/ef10_sriov.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sfc/ef10_sriov.c b/drivers/net/ethernet/sfc/ef10_sriov.c
index 8820be83ce85..3d76fd1504c2 100644
--- a/drivers/net/ethernet/sfc/ef10_sriov.c
+++ b/drivers/net/ethernet/sfc/ef10_sriov.c
@@ -564,7 +564,7 @@ int efx_ef10_sriov_set_vf_vlan(struct efx_nic *efx, int vf_i, u16 vlan,
 {
 	struct efx_ef10_nic_data *nic_data = efx->nic_data;
 	struct ef10_vf *vf;
-	u16 old_vlan, new_vlan;
+	u16 new_vlan;
 	int rc = 0, rc2 = 0;
 
 	if (vf_i >= efx->vf_count)
@@ -619,7 +619,6 @@ int efx_ef10_sriov_set_vf_vlan(struct efx_nic *efx, int vf_i, u16 vlan,
 	}
 
 	/* Do the actual vlan change */
-	old_vlan = vf->vlan;
 	vf->vlan = new_vlan;
 
 	/* Restore everything in reverse order */
-- 
2.17.1

