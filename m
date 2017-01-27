From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Jan 2017 08:06:22 +0000
Subject: [patch] [media] mantis_dvb: fix some error codes in mantis_dvb_init()
Message-Id: <20170127080622.GA4153@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be returning negative error codes here or it leads to a crash.
This also silences a static checker warning.

	drivers/media/pci/mantis/mantis_cards.c:250 mantis_pci_probe()
	warn: 'mantis->dmxdev.dvbdev->fops' double freed

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/mantis/mantis_dvb.c b/drivers/media/pci/mantis/mantis_dvb.c
index 5a71e1791cf5..0db4de3a2285 100644
--- a/drivers/media/pci/mantis/mantis_dvb.c
+++ b/drivers/media/pci/mantis/mantis_dvb.c
@@ -226,11 +226,12 @@ int mantis_dvb_init(struct mantis_pci *mantis)
 			goto err5;
 		} else {
 			if (mantis->fe = NULL) {
+				result = -ENOMEM;
 				dprintk(MANTIS_ERROR, 1, "FE <NULL>");
 				goto err5;
 			}
-
-			if (dvb_register_frontend(&mantis->dvb_adapter, mantis->fe)) {
+			result = dvb_register_frontend(&mantis->dvb_adapter, mantis->fe);
+			if (result) {
 				dprintk(MANTIS_ERROR, 1, "ERROR: Frontend registration failed");
 
 				if (mantis->fe->ops.release)
