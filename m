From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 17:03:20 +0000
Subject: [PATCH 13/15] drivers/usb/misc/rio500.c: removes unnecessary semicolon
Message-Id: <1347469402-27557-13-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cesar Miquel <miquel@df.uba.ar>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rio500-users@lists.sourceforge.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/usb/misc/rio500.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/rio500.c b/drivers/usb/misc/rio500.c
index 1084124..b9b356a 100644
--- a/drivers/usb/misc/rio500.c
+++ b/drivers/usb/misc/rio500.c
@@ -338,7 +338,7 @@ write_rio(struct file *file, const char __user *buffer,
 				thistime -= partial;
 			} else
 				break;
-		};
+		}
 		if (result) {
 			dev_err(&rio->rio_dev->dev, "Write Whoops - %x\n",
 				result);

