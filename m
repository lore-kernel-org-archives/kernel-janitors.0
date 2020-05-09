From: Colin King <colin.king@canonical.com>
Date: Sat, 09 May 2020 21:57:56 +0000
Subject: [PATCH] net: usb: qmi_wwan: remove redundant assignment to variable status
Message-Id: <20200509215756.506840-2-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509215756.506840-1-colin.king@canonical.com>
In-Reply-To: <20200509215756.506840-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being initializeed with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/usb/qmi_wwan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 4bb8552a00d3..b0eab6e5279d 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -719,7 +719,7 @@ static int qmi_wwan_change_dtr(struct usbnet *dev, bool on)
 
 static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
 {
-	int status = -1;
+	int status;
 	u8 *buf = intf->cur_altsetting->extra;
 	int len = intf->cur_altsetting->extralen;
 	struct usb_interface_descriptor *desc = &intf->cur_altsetting->desc;
-- 
2.25.1
