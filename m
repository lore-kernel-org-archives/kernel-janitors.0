From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:29 +0000
Subject: [PATCH 11/16] media: cx231xx: constify copied structure
Message-Id: <1577864614-5543-12-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The hauppauge_955q_lgdt3306a_config structure is only copied
into another structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/cx231xx/cx231xx-dvb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/media/usb/cx231xx/cx231xx-dvb.c
index e205f7f0a56a..0037b4b1381e 100644
--- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
+++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
@@ -147,7 +147,7 @@ static struct tda18271_config pv_tda18271_config = {
 	.small_i2c = TDA18271_03_BYTE_CHUNK_INIT,
 };
 
-static struct lgdt3306a_config hauppauge_955q_lgdt3306a_config = {
+static const struct lgdt3306a_config hauppauge_955q_lgdt3306a_config = {
 	.qam_if_khz         = 4000,
 	.vsb_if_khz         = 3250,
 	.spectral_inversion = 1,
