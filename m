From: Nicolas Kaiser <nikai@nikai.net>
Date: Sat, 13 Nov 2010 18:43:27 +0000
Subject: [PATCH 1/2] staging: comedi: fix typo in error message
Message-Id: <20101113194327.38142df9@absol.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix typo in error message of dux commands allocation.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
 drivers/staging/comedi/drivers/usbdux.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index 1f177a6..aca4d14 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -2398,7 +2398,7 @@ static int usbduxsub_probe(struct usb_interface *uinterf,
 	usbduxsub[index].dux_commands = kzalloc(SIZEOFDUXBUFFER, GFP_KERNEL);
 	if (!usbduxsub[index].dux_commands) {
 		dev_err(dev, "comedi_: usbdux: "
-			"error alloc space for dac commands\n");
+			"error alloc space for dux commands\n");
 		tidy_up(&(usbduxsub[index]));
 		up(&start_stop_sem);
 		return -ENOMEM;
-- 
1.7.2.2
