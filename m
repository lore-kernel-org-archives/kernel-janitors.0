From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 14:55:39 +0000
Subject: [patch] qlcnic: remove duplicate QLC_83XX_GET_LSO_CAPABILITY define
Message-Id: <20140609145539.GB9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shahed Shaikh <shahed.shaikh@qlogic.com>
Cc: Dept-HSGLinuxNICDev@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The QLC_83XX_GET_LSO_CAPABILITY define is cut and pasted twice so we can
delete the second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
index 97784d0..2bf101a 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
@@ -418,7 +418,6 @@ enum qlcnic_83xx_states {
 #define QLC_83XX_GET_FUNC_MODE_FROM_NPAR_INFO(val)	(val & 0x80000000)
 #define QLC_83XX_GET_LRO_CAPABILITY(val)		(val & 0x20)
 #define QLC_83XX_GET_LSO_CAPABILITY(val)		(val & 0x40)
-#define QLC_83XX_GET_LSO_CAPABILITY(val)		(val & 0x40)
 #define QLC_83XX_GET_HW_LRO_CAPABILITY(val)		(val & 0x400)
 #define QLC_83XX_GET_VLAN_ALIGN_CAPABILITY(val)	(val & 0x4000)
 #define QLC_83XX_GET_FW_LRO_MSS_CAPABILITY(val)	(val & 0x20000)
