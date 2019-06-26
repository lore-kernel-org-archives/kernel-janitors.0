From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Jun 2019 10:10:41 +0000
Subject: [PATCH] intel-ish-hid: Fix a use after free in load_fw_from_host()
Message-Id: <20190626101041.GE3242@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We have to print the filename first before we can kfree it.

Fixes: 91b228107da3 ("HID: intel-ish-hid: ISH firmware loader client driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 22ba21457035..aa2dbed30fc3 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -816,9 +816,9 @@ static int load_fw_from_host(struct ishtp_cl_data *client_data)
 		goto end_err_fw_release;
 
 	release_firmware(fw);
-	kfree(filename);
 	dev_info(cl_data_to_dev(client_data), "ISH firmware %s loaded\n",
 		 filename);
+	kfree(filename);
 	return 0;
 
 end_err_fw_release:
-- 
2.20.1
