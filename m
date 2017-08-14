From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 14 Aug 2017 05:25:56 +0000
Subject: [PATCH] misc: mic: constify virtio_config_ops structure
Message-Id: <1502688356-23041-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: kernel-janitors@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

This virtio_config_ops structure is only stored in the config field
of a virtio_device structure and this field is const, so the
virtio_config_ops structure can also be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/misc/mic/vop/vop_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mic/vop/vop_main.c b/drivers/misc/mic/vop/vop_main.c
index a341938..c05caa8 100644
--- a/drivers/misc/mic/vop/vop_main.c
+++ b/drivers/misc/mic/vop/vop_main.c
@@ -425,7 +425,7 @@ static int vop_find_vqs(struct virtio_device *dev, unsigned nvqs,
 /*
  * The config ops structure as defined by virtio config
  */
-static struct virtio_config_ops vop_vq_config_ops = {
+static const struct virtio_config_ops vop_vq_config_ops = {
 	.get_features = vop_get_features,
 	.finalize_features = vop_finalize_features,
 	.get = vop_get,

