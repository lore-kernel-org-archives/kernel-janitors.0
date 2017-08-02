From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 02 Aug 2017 14:54:13 +0000
Subject: [PATCH] [media] DaVinci-VPBE: constify vpbe_dev_ops
Message-Id: <1501685653-4284-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

vpbe_dev_ops is only copied into the ops field at the end of a vpbe_device
structure, so it can be const.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

Does the ops field need to be inlined into the vpbe_device structure?

 drivers/media/platform/davinci/vpbe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index 3679b1e..7f64625 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -790,7 +790,7 @@ static void vpbe_deinitialize(struct device *dev, struct vpbe_device *vpbe_dev)
 	vpss_enable_clock(VPSS_VPBE_CLOCK, 0);
 }
 
-static struct vpbe_device_ops vpbe_dev_ops = {
+static const struct vpbe_device_ops vpbe_dev_ops = {
 	.g_cropcap = vpbe_g_cropcap,
 	.enum_outputs = vpbe_enum_outputs,
 	.set_output = vpbe_set_output,

