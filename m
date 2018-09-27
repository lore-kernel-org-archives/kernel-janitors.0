From: Colin King <colin.king@canonical.com>
Date: Thu, 27 Sep 2018 22:23:32 +0000
Subject: [PATCH] usb: usbtmc: check size before allocating buffer and remove duplicated allocation
Message-Id: <20180927222332.13360-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Bayless <steve_bayless@keysight.com>, Guido Kiener <guido@kiener-muenchen.de>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the allocation of a buffer is performed before a sanity check on
the required buffer size and if the buffer size is too large the error exit
return leaks the allocated buffer.  Fix this by checking the size before
allocating.

Also, the same buffer is allocated again inside an if statement, causing
the first allocation to be leaked.  Fix this by removing this second
redundant allocation.

Detected by CoverityScan, CID#1473697 ("Resource leak")

Fixes: 658f24f4523e ("usb: usbtmc: Add ioctl for generic requests on control")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/class/usbtmc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 0fcb81a1399b..c01edff190d2 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -1895,18 +1895,14 @@ static int usbtmc_ioctl_request(struct usbtmc_device_data *data,
 	if (res)
 		return -EFAULT;
 
+	if (request.req.wLength > USBTMC_BUFSIZE)
+		return -EMSGSIZE;
+
 	buffer = kmalloc(request.req.wLength, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
 
-	if (request.req.wLength > USBTMC_BUFSIZE)
-		return -EMSGSIZE;
-
 	if (request.req.wLength) {
-		buffer = kmalloc(request.req.wLength, GFP_KERNEL);
-		if (!buffer)
-			return -ENOMEM;
-
 		if ((request.req.bRequestType & USB_DIR_IN) = 0) {
 			/* Send control data to device */
 			res = copy_from_user(buffer, request.data,
-- 
2.17.1
