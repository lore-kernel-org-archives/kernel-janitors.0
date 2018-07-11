From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 11 Jul 2018 13:15:54 +0000
Subject: [PATCH -next] staging: pi433: fix error return code in pi433_probe()
Message-Id: <1531314954-179244-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, minhnpq16@gmail.com, viro@zeniv.linux.org.uk, srishtishar@gmail.com, Valentin.Vidic@CARNet.hr, simon@nikanor.nu, linux@wolf-entwicklungen.de
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the kthread_run() error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 293602d..d4bfac1 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1235,6 +1235,7 @@ static int pi433_probe(struct spi_device *spi)
 					     device->minor);
 	if (IS_ERR(device->tx_task_struct)) {
 		dev_dbg(device->dev, "start of send thread failed");
+		retval = PTR_ERR(device->tx_task_struct);
 		goto send_thread_failed;
 	}
 



