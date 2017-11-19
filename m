From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Nov 2017 12:41:33 +0000
Subject: [PATCH] net: vxge: Fix some indentation issues
Message-Id: <20171119124133.3198-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jdmason@kudzu.us, davem@davemloft.net, edumazet@google.com, keescook@chromium.org, mark.rutland@arm.com, stephen@networkplumber.org, mlichvar@redhat.com, colin.king@canonical.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Some statements are not enough or too much indented.
Fix it to improve readalbility.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/neterion/vxge/vxge-main.c | 37 +++++++++++++-------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/neterion/vxge/vxge-main.c b/drivers/net/ethernet/neterion/vxge/vxge-main.c
index fe7e0e1dd01d..b2299f2b2155 100644
--- a/drivers/net/ethernet/neterion/vxge/vxge-main.c
+++ b/drivers/net/ethernet/neterion/vxge/vxge-main.c
@@ -1530,7 +1530,7 @@ static int vxge_reset_vpath(struct vxgedev *vdev, int vp_id)
 			vxge_debug_init(VXGE_ERR,
 				"vxge_hw_vpath_reset failed for"
 				"vpath:%d", vp_id);
-				return status;
+			return status;
 		}
 	} else
 		return VXGE_HW_FAIL;
@@ -1950,19 +1950,19 @@ static enum vxge_hw_status vxge_rth_configure(struct vxgedev *vdev)
 	 * for all VPATHs. The h/w only uses the lowest numbered VPATH
 	 * when steering frames.
 	 */
-	 for (index = 0; index < vdev->no_of_vpath; index++) {
+	for (index = 0; index < vdev->no_of_vpath; index++) {
 		status = vxge_hw_vpath_rts_rth_set(
 				vdev->vpaths[index].handle,
 				vdev->config.rth_algorithm,
 				&hash_types,
 				vdev->config.rth_bkt_sz);
-		 if (status != VXGE_HW_OK) {
+		if (status != VXGE_HW_OK) {
 			vxge_debug_init(VXGE_ERR,
 				"RTH configuration failed for vpath:%d",
 				vdev->vpaths[index].device_id);
 			return status;
-		 }
-	 }
+		}
+	}
 
 	return status;
 }
@@ -1991,7 +1991,7 @@ static enum vxge_hw_status vxge_reset_all_vpaths(struct vxgedev *vdev)
 				vxge_debug_init(VXGE_ERR,
 					"vxge_hw_vpath_reset failed for "
 					"vpath:%d", i);
-					return status;
+				return status;
 			}
 		}
 	}
@@ -2474,32 +2474,31 @@ static int vxge_add_isr(struct vxgedev *vdev)
 			switch (msix_idx) {
 			case 0:
 				snprintf(vdev->desc[intr_cnt], VXGE_INTR_STRLEN,
-				"%s:vxge:MSI-X %d - Tx - fn:%d vpath:%d",
+					"%s:vxge:MSI-X %d - Tx - fn:%d vpath:%d",
 					vdev->ndev->name,
 					vdev->entries[intr_cnt].entry,
 					pci_fun, vp_idx);
 				ret = request_irq(
-				    vdev->entries[intr_cnt].vector,
+					vdev->entries[intr_cnt].vector,
 					vxge_tx_msix_handle, 0,
 					vdev->desc[intr_cnt],
 					&vdev->vpaths[vp_idx].fifo);
-					vdev->vxge_entries[intr_cnt].arg +				vdev->vxge_entries[intr_cnt].arg  						&vdev->vpaths[vp_idx].fifo;
 				irq_req = 1;
 				break;
 			case 1:
 				snprintf(vdev->desc[intr_cnt], VXGE_INTR_STRLEN,
-				"%s:vxge:MSI-X %d - Rx - fn:%d vpath:%d",
+					"%s:vxge:MSI-X %d - Rx - fn:%d vpath:%d",
 					vdev->ndev->name,
 					vdev->entries[intr_cnt].entry,
 					pci_fun, vp_idx);
 				ret = request_irq(
-				    vdev->entries[intr_cnt].vector,
-					vxge_rx_msix_napi_handle,
-					0,
+					vdev->entries[intr_cnt].vector,
+					vxge_rx_msix_napi_handle, 0,
 					vdev->desc[intr_cnt],
 					&vdev->vpaths[vp_idx].ring);
-					vdev->vxge_entries[intr_cnt].arg +				vdev->vxge_entries[intr_cnt].arg  						&vdev->vpaths[vp_idx].ring;
 				irq_req = 1;
 				break;
@@ -2512,9 +2511,9 @@ static int vxge_add_isr(struct vxgedev *vdev)
 				vxge_rem_msix_isr(vdev);
 				vdev->config.intr_type = INTA;
 				vxge_debug_init(VXGE_ERR,
-					"%s: Defaulting to INTA"
-					, vdev->ndev->name);
-					goto INTA_MODE;
+					"%s: Defaulting to INTA",
+					vdev->ndev->name);
+				goto INTA_MODE;
 			}
 
 			if (irq_req) {
@@ -4505,8 +4504,8 @@ vxge_probe(struct pci_dev *pdev, const struct pci_device_id *pre)
 	if (status != VXGE_HW_OK) {
 		vxge_debug_init(VXGE_ERR,
 			"Failed to initialize device (%d)", status);
-			ret = -EINVAL;
-			goto _exit3;
+		ret = -EINVAL;
+		goto _exit3;
 	}
 
 	if (VXGE_FW_VER(ll_config->device_hw_info.fw_version.major,
-- 
2.14.1

