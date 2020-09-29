From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:32 +0000
Subject: [PATCH 09/20] media: pvrusb2: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-10-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
index 1fcf63218885..d1b984ec757d 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
@@ -594,7 +594,7 @@ static int pvr2_lgdt3306a_attach(struct pvr2_dvb_adapter *adap)
 	lgdt3306a_config.mpeg_mode = LGDT3306A_MPEG_PARALLEL;
 	lgdt3306a_config.tpclk_edge = LGDT3306A_TPCLK_FALLING_EDGE;
 	lgdt3306a_config.tpvalid_polarity = LGDT3306A_TP_VALID_LOW;
-	lgdt3306a_config.xtalMHz = 25, /* demod clock MHz; 24/25 supported */
+	lgdt3306a_config.xtalMHz = 25; /* demod clock MHz; 24/25 supported */
 
 	adap->i2c_client_demod[0] = dvb_module_probe("lgdt3306a", NULL,
 						     &adap->channel.hdw->i2c_adap,
