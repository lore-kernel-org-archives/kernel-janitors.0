From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 Jan 2016 12:19:52 +0000
Subject: [PATCH] media: bt8xx: constify or51211_config structure
Message-Id: <1451823592-31761-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The or51211_config structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/pci/bt8xx/dvb-bt8xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/dvb-bt8xx.c b/drivers/media/pci/bt8xx/dvb-bt8xx.c
index d407244..8aeb14c 100644
--- a/drivers/media/pci/bt8xx/dvb-bt8xx.c
+++ b/drivers/media/pci/bt8xx/dvb-bt8xx.c
@@ -458,7 +458,7 @@ static void or51211_sleep(struct dvb_frontend * fe)
 	bttv_write_gpio(bt->bttv_nr, 0x0001, 0x0000);
 }
 
-static struct or51211_config or51211_config = {
+static const struct or51211_config or51211_config = {
 	.demod_address = 0x15,
 	.request_firmware = or51211_request_firmware,
 	.setmode = or51211_setmode,

