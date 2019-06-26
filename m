From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Jun 2019 16:35:17 +0000
Subject: [PATCH] usb: gadget: udc: renesas_usb3: remove redundant assignment to ret
Message-Id: <20190626163517.18530-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171102155325.24137-1-colin.king@canonical.com>
In-Reply-To: <20171102155325.24137-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being initialized with a value that is never read and
ret is being re-assigned immediately after the initialization in both
paths of an if statement. This is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 5a960fce31c5..87062d22134d 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -1168,7 +1168,7 @@ static void usb3_set_status_stage(struct renesas_usb3_ep *usb3_ep,
 static void usb3_p0_xfer(struct renesas_usb3_ep *usb3_ep,
 			 struct renesas_usb3_request *usb3_req)
 {
-	int ret = -EAGAIN;
+	int ret;
 
 	if (usb3_ep->dir_in)
 		ret = usb3_write_pipe(usb3_ep, usb3_req, USB3_P0_WRITE);
-- 
2.20.1
