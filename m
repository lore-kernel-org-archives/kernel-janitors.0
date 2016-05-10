From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 May 2016 19:20:04 +0000
Subject: [patch -mainline] qlcnic: potential NULL dereference in qlcnic_83xx_get_minidump_template()
Message-Id: <20160510192004.GA30712@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dept-GELinuxNICDev@qlogic.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If qlcnic_fw_cmd_get_minidump_temp() fails then "fw_dump->tmpl_hdr" is
NULL or possibly freed.  It can lead to an oops later.

Fixes: d01a6d3c8ae1 ('qlcnic: Add support to enable capability to extend minidump for iSCSI')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_minidump.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_minidump.c
index cda9e60..0844b7c 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_minidump.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_minidump.c
@@ -1417,6 +1417,7 @@ void qlcnic_83xx_get_minidump_template(struct qlcnic_adapter *adapter)
 	struct qlcnic_fw_dump *fw_dump = &ahw->fw_dump;
 	struct pci_dev *pdev = adapter->pdev;
 	bool extended = false;
+	int ret;
 
 	prev_version = adapter->fw_version;
 	current_version = qlcnic_83xx_get_fw_version(adapter);
@@ -1427,8 +1428,11 @@ void qlcnic_83xx_get_minidump_template(struct qlcnic_adapter *adapter)
 		if (qlcnic_83xx_md_check_extended_dump_capability(adapter))
 			extended = !qlcnic_83xx_extend_md_capab(adapter);
 
-		if (!qlcnic_fw_cmd_get_minidump_temp(adapter))
-			dev_info(&pdev->dev, "Supports FW dump capability\n");
+		ret = qlcnic_fw_cmd_get_minidump_temp(adapter);
+		if (ret)
+			return;
+
+		dev_info(&pdev->dev, "Supports FW dump capability\n");
 
 		/* Once we have minidump template with extended iSCSI dump
 		 * capability, update the minidump capture mask to 0x1f as
