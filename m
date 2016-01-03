From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 Jan 2016 11:58:14 +0000
Subject: [PATCH] av7110: constify sp8870_config structure
Message-Id: <1451822294-9559-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

This sp8870_config structure is never modified, so declare it as
const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/pci/ttpci/av7110.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/av7110.c b/drivers/media/pci/ttpci/av7110.c
index a69dc6a..18d229f 100644
--- a/drivers/media/pci/ttpci/av7110.c
+++ b/drivers/media/pci/ttpci/av7110.c
@@ -1739,7 +1739,7 @@ static int alps_tdlb7_request_firmware(struct dvb_frontend* fe, const struct fir
 #endif
 }
 
-static struct sp8870_config alps_tdlb7_config = {
+static const struct sp8870_config alps_tdlb7_config = {
 
 	.demod_address = 0x71,
 	.request_firmware = alps_tdlb7_request_firmware,

