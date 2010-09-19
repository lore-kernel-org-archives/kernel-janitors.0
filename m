From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:55:18 +0000
Subject: [PATCH 13/14] uwb: fix device_register() error handling
Message-Id: <1284900918-24770-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Vrabel <david.vrabel@csr.com>, Tejun Heo <tj@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/uwb/umc-dev.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/uwb/umc-dev.c b/drivers/uwb/umc-dev.c
index 43ea998..e8e06ee 100644
--- a/drivers/uwb/umc-dev.c
+++ b/drivers/uwb/umc-dev.c
@@ -68,6 +68,7 @@ int umc_device_register(struct umc_dev *umc)
 	return 0;
 
 error_device_register:
+	put_device(&umc->dev);
 	release_resource(&umc->resource);
 error_request_resource:
 	return err;
-- 
1.7.0.4

