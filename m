From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 11 Aug 2010 08:02:10 +0000
Subject: [PATCH] staging: usbip: fix memory leak
Message-Id: <1281513732-5441-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Kulikov Vasiliy <segooon@gmail.com>, Endre Kollar <taxy443@gmail.com>, Tejun Heo <tj@kernel.org>, "Brian G. Merrell" <bgmerrell@novell.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

If stub_probe() failed then do not increase interf_count. In original
code sdev was leaked as its interf_count never reaches 0.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/usbip/stub_dev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/usbip/stub_dev.c b/drivers/staging/usbip/stub_dev.c
index b6b753a..b186b5f 100644
--- a/drivers/staging/usbip/stub_dev.c
+++ b/drivers/staging/usbip/stub_dev.c
@@ -427,11 +427,11 @@ static int stub_probe(struct usb_interface *interface,
 
 
 	if (busid_priv->status = STUB_BUSID_ALLOC) {
-		busid_priv->interf_count++;
 		sdev = busid_priv->sdev;
 		if (!sdev)
 			return -ENODEV;
 
+		busid_priv->interf_count++;
 		dev_info(&interface->dev,
 		 "USB/IP Stub: register a new interface "
 		 "(bus %u dev %u ifn %u)\n", udev->bus->busnum, udev->devnum,
-- 
1.7.0.4

