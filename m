From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Oct 2018 15:19:32 +0000
Subject: [PATCH] media: dib0700: fix spelling mistake "Amplifyer" -> "Amplifier"
Message-Id: <20181012151932.21841-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in MODULE_PARM_DESC text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/dvb-usb/dib0700_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 7551dce96f64..9311f7d4bba5 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -29,7 +29,7 @@
 
 static int force_lna_activation;
 module_param(force_lna_activation, int, 0644);
-MODULE_PARM_DESC(force_lna_activation, "force the activation of Low-Noise-Amplifyer(s) (LNA), if applicable for the device (default: 0=automatic/off).");
+MODULE_PARM_DESC(force_lna_activation, "force the activation of Low-Noise-Amplifier(s) (LNA), if applicable for the device (default: 0=automatic/off).");
 
 struct dib0700_adapter_state {
 	int (*set_param_save) (struct dvb_frontend *);
-- 
2.17.1
