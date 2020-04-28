From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 15:06:50 +0000
Subject: [PATCH -next] staging: pi433: fix error return code in pi433_probe()
Message-Id: <20200428150650.102340-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kirill Smelkov <kirr@nexedi.com>, Nishka Dasgupta <nishkadg.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

Fix to return negative error code -ENOMEM from cdev alloc failed error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 313d22f6210f..c8d0c63fdd1d 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1230,6 +1230,7 @@ static int pi433_probe(struct spi_device *spi)
 	device->cdev = cdev_alloc();
 	if (!device->cdev) {
 		dev_dbg(device->dev, "allocation of cdev failed");
+		retval = -ENOMEM;
 		goto cdev_failed;
 	}
 	device->cdev->owner = THIS_MODULE;
