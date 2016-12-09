From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 14:34:49 +0000
Subject: [PATCH 1/4] staging: greybus: camera: One function call less in gb_camera_configure_streams() after 
Message-Id: <4e76f717-9382-f48f-afa4-b8b6982e327d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
In-Reply-To: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Dec 2016 18:25:13 +0100

The kfree() function was called in one case by the
gb_camera_configure_streams() function during error handling
even if the passed variable contained a null pointer.

This issue was detected by using the Coccinelle software.

Adjust a jump target according to the Linux coding style convention.

Fixes: 3265edaf0d70433699eece915fcca6509332c0e8 ("greybus: Add driver for the camera class protocol")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/greybus/camera.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 1c5b41ae6774..4479caed81bd 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -537,14 +537,15 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 		return -EINVAL;
 
 	req_size = sizeof(*req) + nstreams * sizeof(req->config[0]);
-	resp_size = sizeof(*resp) + nstreams * sizeof(resp->config[0]);
-
 	req = kmalloc(req_size, GFP_KERNEL);
-	resp = kmalloc(resp_size, GFP_KERNEL);
-	if (!req || !resp) {
-		kfree(req);
-		kfree(resp);
+	if (!req)
 		return -ENOMEM;
+
+	resp_size = sizeof(*resp) + nstreams * sizeof(resp->config[0]);
+	resp = kmalloc(resp_size, GFP_KERNEL);
+	if (!resp) {
+		ret = -ENOMEM;
+		goto free_request;
 	}
 
 	req->num_streams = nstreams;
@@ -647,8 +648,9 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 
 done_skip_pm_put:
 	mutex_unlock(&gcam->mutex);
-	kfree(req);
 	kfree(resp);
+free_request:
+	kfree(req);
 	return ret;
 }
 
-- 
2.11.0

