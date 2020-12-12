From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Dec 2020 09:46:58 +0000
Subject: [PATCH] Bluetooth: btqcomsmd: Fix a resource leak in error handling paths in the probe function
Message-Id: <20201212094658.83861-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agross@kernel.org, bjorn.andersson@linaro.org, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Some resource should be released in the error handling path of the probe
function, as already done in the remove function.

The remove function was fixed in commit 5052de8deff5 ("soc: qcom: smd:
Transition client drivers from smd to rpmsg")

Fixes: 1511cc750c3d ("Bluetooth: Introduce Qualcomm WCNSS SMD based HCI driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/btqcomsmd.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
index 98d53764871f..2acb719e596f 100644
--- a/drivers/bluetooth/btqcomsmd.c
+++ b/drivers/bluetooth/btqcomsmd.c
@@ -142,12 +142,16 @@ static int btqcomsmd_probe(struct platform_device *pdev)
 
 	btq->cmd_channel = qcom_wcnss_open_channel(wcnss, "APPS_RIVA_BT_CMD",
 						   btqcomsmd_cmd_callback, btq);
-	if (IS_ERR(btq->cmd_channel))
-		return PTR_ERR(btq->cmd_channel);
+	if (IS_ERR(btq->cmd_channel)) {
+		ret = PTR_ERR(btq->cmd_channel);
+		goto destroy_acl_channel;
+	}
 
 	hdev = hci_alloc_dev();
-	if (!hdev)
-		return -ENOMEM;
+	if (!hdev) {
+		ret = -ENOMEM;
+		goto destroy_cmd_channel;
+	}
 
 	hci_set_drvdata(hdev, btq);
 	btq->hdev = hdev;
@@ -161,14 +165,21 @@ static int btqcomsmd_probe(struct platform_device *pdev)
 	hdev->set_bdaddr = qca_set_bdaddr_rome;
 
 	ret = hci_register_dev(hdev);
-	if (ret < 0) {
-		hci_free_dev(hdev);
-		return ret;
-	}
+	if (ret < 0)
+		goto hci_free_dev;
 
 	platform_set_drvdata(pdev, btq);
 
 	return 0;
+
+hci_free_dev:
+	hci_free_dev(hdev);
+destroy_cmd_channel:
+	rpmsg_destroy_ept(btq->cmd_channel);
+destroy_acl_channel:
+	rpmsg_destroy_ept(btq->acl_channel);
+
+	return ret;
 }
 
 static int btqcomsmd_remove(struct platform_device *pdev)
-- 
2.27.0
