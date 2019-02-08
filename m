From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Feb 2019 15:52:59 +0000
Subject: [PATCH] usb: host: oxu210hp-hcd: fix indentation issue
Message-Id: <20190208155259.11702-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A statement is indented too deeply, fix this by removing a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/oxu210hp-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index c5e6e8d0b5ef..f06a291f05f8 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -1323,7 +1323,7 @@ static struct list_head *qh_urb_transaction(struct oxu_hcd *oxu,
 	}
 
 	/* by default, enable interrupt on urb completion */
-		qtd->hw_token |= cpu_to_le32(QTD_IOC);
+	qtd->hw_token |= cpu_to_le32(QTD_IOC);
 	return head;
 
 cleanup:
-- 
2.20.1
