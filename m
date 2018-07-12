From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2018 12:23:45 +0000
Subject: [PATCH net] qlogic: check kstrtoul() for errors
Message-Id: <20180712122345.dstjfogysfvfl2iq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harish Patil <harish.patil@cavium.com>, Himanshu Madhani <himanshu.madhani@qlogic.com>
Cc: Manish Chopra <manish.chopra@cavium.com>, Dept-GELinuxNICDev@cavium.com, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally left out the error handling for kstrtoul().

Fixes: a520030e326a ("qlcnic: Implement flash sysfs callback for 83xx adapter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c
index 891f03a7a33d..8d7b9bb910f2 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c
@@ -1128,6 +1128,8 @@ static ssize_t qlcnic_83xx_sysfs_flash_write_handler(struct file *filp,
 	struct qlcnic_adapter *adapter = dev_get_drvdata(dev);
 
 	ret = kstrtoul(buf, 16, &data);
+	if (ret)
+		return ret;
 
 	switch (data) {
 	case QLC_83XX_FLASH_SECTOR_ERASE_CMD:
