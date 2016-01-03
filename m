From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 Jan 2016 12:27:53 +0000
Subject: [PATCH] media: bt8xx: constify sp887x_config structure
Message-Id: <1451824073-6962-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

This sp887x_config structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
This patch and the previous one on the same file can be applied in any order.

 drivers/media/pci/bt8xx/dvb-bt8xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/dvb-bt8xx.c b/drivers/media/pci/bt8xx/dvb-bt8xx.c
index d407244..a3aa0cd 100644
--- a/drivers/media/pci/bt8xx/dvb-bt8xx.c
+++ b/drivers/media/pci/bt8xx/dvb-bt8xx.c
@@ -318,7 +318,7 @@ static int microtune_mt7202dtf_request_firmware(struct dvb_frontend* fe, const s
 	return request_firmware(fw, name, &bt->bt->dev->dev);
 }
 
-static struct sp887x_config microtune_mt7202dtf_config = {
+static const struct sp887x_config microtune_mt7202dtf_config = {
 	.demod_address = 0x70,
 	.request_firmware = microtune_mt7202dtf_request_firmware,
 };

