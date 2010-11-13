From: Nicolas Kaiser <nikai@nikai.net>
Date: Sat, 13 Nov 2010 18:46:50 +0000
Subject: [PATCH 2/2] staging: comedi: fix memory leak
Message-Id: <20101113194650.28a0be1b@absol.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Instead of freeing outBuffer, inBuffer gets freed twice.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
Only compile tested. I hope I got it right?

 drivers/staging/comedi/drivers/usbdux.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
index aca4d14..696ee04 100644
--- a/drivers/staging/comedi/drivers/usbdux.c
+++ b/drivers/staging/comedi/drivers/usbdux.c
@@ -2295,8 +2295,8 @@ static void tidy_up(struct usbduxsub *usbduxsub_tmp)
 	usbduxsub_tmp->inBuffer = NULL;
 	kfree(usbduxsub_tmp->insnBuffer);
 	usbduxsub_tmp->insnBuffer = NULL;
-	kfree(usbduxsub_tmp->inBuffer);
-	usbduxsub_tmp->inBuffer = NULL;
+	kfree(usbduxsub_tmp->outBuffer);
+	usbduxsub_tmp->outBuffer = NULL;
 	kfree(usbduxsub_tmp->dac_commands);
 	usbduxsub_tmp->dac_commands = NULL;
 	kfree(usbduxsub_tmp->dux_commands);
-- 
1.7.2.2
