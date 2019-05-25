From: Mao Wenan <maowenan@huawei.com>
Date: Sat, 25 May 2019 04:26:42 +0000
Subject: [PATCH net] =?UTF-8?q?staging:=20Remove=20set=20but=20not=20used?= =?UTF-8?q?=20variable=20=E2=80=98
Message-Id: <20190525042642.78482-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: gregkh@linuxfoundation.org, jeremy@azazel.net
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/kpc2000/kpc_spi/spi_driver.c: In function
‘kp_spi_transfer_one_message’:
drivers/staging/kpc2000/kpc_spi/spi_driver.c:282:9: warning: variable
‘status’ set but not used [-Wunused-but-set-variable]
     int status = 0;
         ^~~~~~
The variable 'status' is not used any more, remve it.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/staging/kpc2000/kpc_spi/spi_driver.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_spi/spi_driver.c b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
index 86df16547a92..16f9518f8d63 100644
--- a/drivers/staging/kpc2000/kpc_spi/spi_driver.c
+++ b/drivers/staging/kpc2000/kpc_spi/spi_driver.c
@@ -279,7 +279,6 @@ kp_spi_transfer_one_message(struct spi_master *master, struct spi_message *m)
     struct kp_spi       *kpspi;
     struct spi_transfer *transfer;
     union kp_spi_config sc;
-    int status = 0;
     
     spidev = m->spi;
     kpspi = spi_master_get_devdata(master);
@@ -332,7 +331,6 @@ kp_spi_transfer_one_message(struct spi_master *master, struct spi_message *m)
     /* do the transfers for this message */
     list_for_each_entry(transfer, &m->transfers, transfer_list) {
         if (transfer->tx_buf = NULL && transfer->rx_buf = NULL && transfer->len) {
-            status = -EINVAL;
             break;
         }
         
@@ -370,7 +368,6 @@ kp_spi_transfer_one_message(struct spi_master *master, struct spi_message *m)
             m->actual_length += count;
             
             if (count != transfer->len) {
-                status = -EIO;
                 break;
             }
         }
-- 
2.20.1
