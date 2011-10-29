From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Oct 2011 07:20:20 +0000
Subject: [patch] Staging: sep: potential buffer overflow in ioctl
Message-Id: <20111029072020.GB17780@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

tail_size is determined by several variables that come from the user
so we should verify that it's not too large.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/sep/sep_driver.c b/drivers/staging/sep/sep_driver.c
index 8ac3fae..e624e28 100644
--- a/drivers/staging/sep/sep_driver.c
+++ b/drivers/staging/sep/sep_driver.c
@@ -2120,6 +2120,8 @@ static int sep_prepare_input_output_dma_table_in_dcb(struct sep_device *sep,
 			}
 		}
 		if (tail_size) {
+			if (tail_size > sizeof(dcb_table_ptr->tail_data))
+				return -EINVAL;
 			if (is_kva = true) {
 				memcpy(dcb_table_ptr->tail_data,
 					(void *)(app_in_address + data_in_size -
