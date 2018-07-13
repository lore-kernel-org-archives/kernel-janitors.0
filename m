From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 10:45:01 +0000
Subject: [PATCH] usb: usbip: remove redundant pointer ep
Message-Id: <20180713104501.11482-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer ep is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'ep' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/usbip/vudc_dev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 1b9a4f87db59..1634d8698e15 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -279,12 +279,10 @@ static int vep_disable(struct usb_ep *_ep)
 static struct usb_request *vep_alloc_request(struct usb_ep *_ep,
 		gfp_t mem_flags)
 {
-	struct vep *ep;
 	struct vrequest *req;
 
 	if (!_ep)
 		return NULL;
-	ep = to_vep(_ep);
 
 	req = kzalloc(sizeof(*req), mem_flags);
 	if (!req)
-- 
2.17.1

