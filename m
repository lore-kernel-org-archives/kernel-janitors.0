From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Jun 2019 11:27:25 +0000
Subject: [PATCH] staging: davinci: fix memory leaks and check for allocation failure
Message-Id: <20190608112725.27658-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are three error return paths that don't kfree params causing a
memory leak.  Fix this by adding an error return path that kfree's
params before returning.  Also add a check to see params failed to
be allocated.

Addresses-Coverity: ("Resource leak")
Fixes: da43b6ccadcf ("[media] davinci: vpfe: dm365: add IPIPE support for media controller driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
index 08c26f3c5282..52397ad0e3e2 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
@@ -1251,10 +1251,10 @@ static int ipipe_s_config(struct v4l2_subdev *sd, struct vpfe_ipipe_config *cfg)
 	struct vpfe_ipipe_device *ipipe = v4l2_get_subdevdata(sd);
 	unsigned int i;
 	int rval = 0;
+	struct ipipe_module_params *params;
 
 	for (i = 0; i < ARRAY_SIZE(ipipe_modules); i++) {
 		const struct ipipe_module_if *module_if;
-		struct ipipe_module_params *params;
 		void *from, *to;
 		size_t size;
 
@@ -1265,25 +1265,30 @@ static int ipipe_s_config(struct v4l2_subdev *sd, struct vpfe_ipipe_config *cfg)
 		from = *(void **)((void *)cfg + module_if->config_offset);
 
 		params = kmalloc(sizeof(*params), GFP_KERNEL);
+		if (!params)
+			return -ENOMEM;
 		to = (void *)params + module_if->param_offset;
 		size = module_if->param_size;
 
 		if (to && from && size) {
 			if (copy_from_user(to, (void __user *)from, size)) {
 				rval = -EFAULT;
-				break;
+				goto error_free;
 			}
 			rval = module_if->set(ipipe, to);
 			if (rval)
-				goto error;
+				goto error_free;
 		} else if (to && !from && size) {
 			rval = module_if->set(ipipe, NULL);
 			if (rval)
-				goto error;
+				goto error_free;
 		}
 		kfree(params);
 	}
-error:
+	return rval;
+
+error_free:
+	kfree(params);
 	return rval;
 }
 
-- 
2.20.1
