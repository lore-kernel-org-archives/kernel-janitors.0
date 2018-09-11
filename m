From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 11 Sep 2018 11:51:29 +0000
Subject: [PATCH net-next] qlcnic: Remove set but not used variables 'fw_mbx' and 'hdr_size'
Message-Id: <1536666689-3906-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harish Patil <harish.patil@cavium.com>, Manish Chopra <manish.chopra@cavium.com>, "David S. Miller" <davem@davemloft.net>
Cc: Yue Haibing <yuehaibing@huawei.com>, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c: In function 'qlcnic_sriov_pull_bc_msg':
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c:907:6: warning:
 variable 'fw_mbx' set but not used [-Wunused-but-set-variable]

drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c: In function 'qlcnic_sriov_issue_bc_post':
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c:939:16: warning:
 variable 'hdr_size' set but not used [-Wunused-but-set-variable]

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c
index 77e386e..f7c2f32 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c
@@ -904,13 +904,11 @@ static void qlcnic_sriov_pull_bc_msg(struct qlcnic_adapter *adapter,
 				     u32 *hdr, u32 *pay, u32 size)
 {
 	struct qlcnic_hardware_context *ahw = adapter->ahw;
-	u32 fw_mbx;
 	u8 i, max = 2, hdr_size, j;
 
 	hdr_size = (sizeof(struct qlcnic_bc_hdr) / sizeof(u32));
 	max = (size / sizeof(u32)) + hdr_size;
 
-	fw_mbx = readl(QLCNIC_MBX_FW(ahw, 0));
 	for (i = 2, j = 0; j < hdr_size; i++, j++)
 		*(hdr++) = readl(QLCNIC_MBX_FW(ahw, i));
 	for (; j < max; i++, j++)
@@ -936,7 +934,7 @@ static int __qlcnic_sriov_issue_bc_post(struct qlcnic_vf_info *vf)
 static int qlcnic_sriov_issue_bc_post(struct qlcnic_bc_trans *trans, u8 type)
 {
 	struct qlcnic_vf_info *vf = trans->vf;
-	u32 pay_size, hdr_size;
+	u32 pay_size;
 	u32 *hdr, *pay;
 	int ret;
 	u8 pci_func = trans->func_id;
@@ -947,14 +945,12 @@ static int qlcnic_sriov_issue_bc_post(struct qlcnic_bc_trans *trans, u8 type)
 	if (type = QLC_BC_COMMAND) {
 		hdr = (u32 *)(trans->req_hdr + trans->curr_req_frag);
 		pay = (u32 *)(trans->req_pay + trans->curr_req_frag);
-		hdr_size = (sizeof(struct qlcnic_bc_hdr) / sizeof(u32));
 		pay_size = qlcnic_sriov_get_bc_paysize(trans->req_pay_size,
 						       trans->curr_req_frag);
 		pay_size = (pay_size / sizeof(u32));
 	} else {
 		hdr = (u32 *)(trans->rsp_hdr + trans->curr_rsp_frag);
 		pay = (u32 *)(trans->rsp_pay + trans->curr_rsp_frag);
-		hdr_size = (sizeof(struct qlcnic_bc_hdr) / sizeof(u32));
 		pay_size = qlcnic_sriov_get_bc_paysize(trans->rsp_pay_size,
 						       trans->curr_rsp_frag);
 		pay_size = (pay_size / sizeof(u32));
