From: Dan Carpenter <error27@gmail.com>
Date: Fri, 12 Nov 2010 04:30:18 +0000
Subject: [patch] leds: pca9532: free after input_unregister_device()
Message-Id: <20101112043018.GB3644@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

input_unregister_device() frees data->idev so the second
input_free_device() is a double free.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 43d0875..e1700cd 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -286,7 +286,6 @@ exit:
 			case PCA9532_TYPE_N2100_BEEP:
 				if (data->idev != NULL) {
 					input_unregister_device(data->idev);
-					input_free_device(data->idev);
 					cancel_work_sync(&data->work);
 					data->idev = NULL;
 				}
@@ -341,7 +340,6 @@ static int pca9532_remove(struct i2c_client *client)
 		case PCA9532_TYPE_N2100_BEEP:
 			if (data->idev != NULL) {
 				input_unregister_device(data->idev);
-				input_free_device(data->idev);
 				cancel_work_sync(&data->work);
 				data->idev = NULL;
 			}
