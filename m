From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Sep 2019 18:43:34 +0000
Subject: [PATCH][next] usb: cdns3: remove redundant assignment to ret on error exit path
Message-Id: <20190902184334.27406-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Laszczak <pawell@cadence.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where an allocation fails for priv_ep ret is
assigned -ENOMEM and the code exits via the exit path 'err'.
The exit path returns -ENOMEM without using variable ret, so
the assingment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/gadget.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 0eb3022838d6..de0e14a4fb9f 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2447,10 +2447,8 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
 
 		priv_ep = devm_kzalloc(priv_dev->dev, sizeof(*priv_ep),
 				       GFP_KERNEL);
-		if (!priv_ep) {
-			ret = -ENOMEM;
+		if (!priv_ep)
 			goto err;
-		}
 
 		/* set parent of endpoint object */
 		priv_ep->cdns3_dev = priv_dev;
-- 
2.20.1
