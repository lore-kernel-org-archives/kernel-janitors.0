From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Oct 2017 17:04:56 +0000
Subject: [PATCH] crypto: qat: remove unused and redundant pointer vf_info
Message-Id: <20171012170456.32505-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Salvatore Benedetto <salvatore.benedetto@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Ahsan Atta <ahsan.atta@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer vf_info is being assigned but never read, it is redundant
and therefore can be removed.

Cleans up clang warning: Value stored to 'vf_info' is never read

Fixes: ed8ccaef52fa ("crypto: qat - Add support for SRIOV")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/qat/qat_common/adf_dev_mgr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/crypto/qat/qat_common/adf_dev_mgr.c b/drivers/crypto/qat/qat_common/adf_dev_mgr.c
index 8afac52677a6..2d06409bd3c4 100644
--- a/drivers/crypto/qat/qat_common/adf_dev_mgr.c
+++ b/drivers/crypto/qat/qat_common/adf_dev_mgr.c
@@ -228,11 +228,8 @@ int adf_devmgr_add_dev(struct adf_accel_dev *accel_dev,
 		list_add_tail(&map->list, &vfs_table);
 	} else if (accel_dev->is_vf && pf) {
 		/* VF on host */
-		struct adf_accel_vf_info *vf_info;
 		struct vf_id_map *map;
 
-		vf_info = pf->pf.vf_info + adf_get_vf_id(accel_dev);
-
 		map = adf_find_vf(adf_get_vf_num(accel_dev));
 		if (map) {
 			struct vf_id_map *next;
-- 
2.14.1

