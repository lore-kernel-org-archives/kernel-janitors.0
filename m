From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 14 Aug 2017 05:43:56 +0000
Subject: [PATCH] [media] v4l2: av7110_v4l: constify v4l2_audio structure
Message-Id: <1502689436-31008-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

This v4l2_audio structure is only copied into other structures,
so it can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/pci/ttpci/av7110_v4l.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttpci/av7110_v4l.c
index 397fe14..e4cf42c 100644
--- a/drivers/media/pci/ttpci/av7110_v4l.c
+++ b/drivers/media/pci/ttpci/av7110_v4l.c
@@ -218,7 +218,7 @@ static int stv0297_set_tv_freq(struct saa7146_dev *dev, u32 freq)
 static struct saa7146_standard dvb_standard[];
 static struct saa7146_standard standard[];
 
-static struct v4l2_audio msp3400_v4l2_audio = {
+static const struct v4l2_audio msp3400_v4l2_audio = {
 	.index = 0,
 	.name = "Television",
 	.capability = V4L2_AUDCAP_STEREO

