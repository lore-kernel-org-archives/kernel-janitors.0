From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Nov 2017 11:35:00 +0000
Subject: [PATCH] drm/amd/powerplay: fix copy-n-paste error on vddci_buf index
Message-Id: <20171109113500.19593-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, Edward O'Callaghan <funfunctor@folklore1984.net>, Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The index to vddci_buf is using profile->ucElbVDDC_Num rather
than profile->ucElbVDDCI_Num; this looks like a copy-n-paste
error from previous code for the vddc_buf array and I'm pretty
sure this is incorrect. Fix this by using the correct variable.

Detected by CoverityScan, CID#1457172 ("Copy-paste error")

Fixes: 970d9804b00d ("drm/amd/powerplay: Add support functions for CI to ppatomctrl.c")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
index a129bc5b1844..c6febbf0bf69 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/ppatomctrl.c
@@ -1486,7 +1486,7 @@ int atomctrl_get_leakage_vddc_base_on_leakage(struct pp_hwmgr *hwmgr,
 				if (vddci_id_buf[i] = virtual_voltage_id) {
 					for (j = 0; j < profile->ucLeakageBinNum; j++) {
 						if (efuse_voltage_id <= leakage_bin[j]) {
-							*vddci = vddci_buf[j * profile->ucElbVDDC_Num + i];
+							*vddci = vddci_buf[j * profile->ucElbVDDCI_Num + i];
 							break;
 						}
 					}
-- 
2.14.1

