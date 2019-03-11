From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 11 Mar 2019 14:37:39 +0000
Subject: [PATCH v2] staging: davinci: drop pointless static qualifier in vpfe_resizer_init()
Message-Id: <20190311143739.132064-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190311143551.GH2434@kadam>
In-Reply-To: <20190311143551.GH2434@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, Julia.Lawall@lip6.fr, kimbrownkd@gmail.com, colin.king@canonical.com, hans.verkuil@cisco.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

There is no need to have the 'T *v' variable static
since new value always be assigned before use it.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v1->v2: remove additional space character between resource_size_t and res_len. 
 drivers/staging/media/davinci_vpfe/dm365_resizer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_resizer.c b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
index 6098f43ac51b..93d6ea48915b 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_resizer.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_resizer.c
@@ -1881,7 +1881,7 @@ int vpfe_resizer_init(struct vpfe_resizer_device *vpfe_rsz,
 	struct v4l2_subdev *sd = &vpfe_rsz->crop_resizer.subdev;
 	struct media_pad *pads = &vpfe_rsz->crop_resizer.pads[0];
 	struct media_entity *me = &sd->entity;
-	static resource_size_t  res_len;
+	resource_size_t res_len;
 	struct resource *res;
 	int ret;
 
-- 
2.20.1
