From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Dec 2015 09:21:22 +0000
Subject: [patch] qlcnic: fix a loop exit condition better
Message-Id: <20151224092122.GG29642@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151215201734.GJ5177@mwanda>
In-Reply-To: <20151215201734.GJ5177@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dept-GELinuxNICDev@qlogic.com
Cc: netdev@vger.kernel.org, manish.chopra@qlogic.com, kernel-janitors@vger.kernel.org

In the original code, if we succeeded on the last iteration through the
loop then we still returned failure.

Fixes: 389e4e04ad2d ('qlcnic: fix a timeout loop')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_vnic.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_vnic.c
index b1a452f..3490675 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_vnic.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_vnic.c
@@ -252,7 +252,7 @@ int qlcnic_83xx_check_vnic_state(struct qlcnic_adapter *adapter)
 		state = QLCRDX(ahw, QLC_83XX_VNIC_STATE);
 	}
 
-	if (!idc->vnic_wait_limit) {
+	if (state != QLCNIC_DEV_NPAR_OPER) {
 		dev_err(&adapter->pdev->dev,
 			"vNIC mode not operational, state check timed out.\n");
 		return -EIO;
