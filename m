From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 29 Apr 2019 12:26:30 +0000
Subject: [PATCH -next] usb: typec: ucsi: ccg: fix missing unlock on error in ccg_cmd_write_flash_row()
Message-Id: <20190429122630.59334-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190429121940.GA15384@kuha.fi.intel.com>
In-Reply-To: <20190429121940.GA15384@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function ccg_cmd_write_flash_row()
in the error handling case.

Fixes: 5c9ae5a87573 ("usb: typec: ucsi: ccg: add firmware flashing support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 4632b91a04a6..9d46aa9e4e35 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -631,6 +631,7 @@ ccg_cmd_write_flash_row(struct ucsi_ccg *uc, u16 row,
 	ret = i2c_master_send(client, buf, CCG4_ROW_SIZE + 2);
 	if (ret != CCG4_ROW_SIZE + 2) {
 		dev_err(uc->dev, "REG_FLASH_RW_MEM write fail %d\n", ret);
+		mutex_unlock(&uc->lock);
 		return ret < 0 ? ret : -EIO;
 	}
