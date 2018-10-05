From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 11:22:06 +0000
Subject: [PATCH -next] [media] media: drop pointless static qualifier in vpfe_ipipeif_init()
Message-Id: <1538738526-131410-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538738466-129133-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538738466-129133-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

There is no need to have the 'resource_size_t res_len' variable static
since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/davinci_vpfe/dm365_ipipeif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c b/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
index a53231b..e191829 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
@@ -998,7 +998,7 @@ int vpfe_ipipeif_init(struct vpfe_ipipeif_device *ipipeif,
 	struct v4l2_subdev *sd = &ipipeif->subdev;
 	struct media_pad *pads = &ipipeif->pads[0];
 	struct media_entity *me = &sd->entity;
-	static resource_size_t  res_len;
+	resource_size_t  res_len;
 	struct resource *res;
 	int ret;
