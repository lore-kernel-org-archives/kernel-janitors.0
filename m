From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Apr 2014 15:21:12 +0000
Subject: [patch] drm/panel: s6e8aa0: silence array overflow warning
Message-Id: <20140409152112.GD24536@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Smatch complains that we are reading beyond the end of the array here:

	drivers/gpu/drm/panel/panel-s6e8aa0.c:852 s6e8aa0_read_mtp_id()
	warn: buffer overflow 's6e8aa0_variants' 4 <= 4

We set the error code, so it's not harmful but it looks like a return
was intended here so lets add that and silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.

diff --git a/drivers/gpu/drm/panel/panel-s6e8aa0.c b/drivers/gpu/drm/panel/panel-s6e8aa0.c
index 35941d2..06e57a2 100644
--- a/drivers/gpu/drm/panel/panel-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-s6e8aa0.c
@@ -847,6 +847,7 @@ static void s6e8aa0_read_mtp_id(struct s6e8aa0 *ctx)
 	if (i >= ARRAY_SIZE(s6e8aa0_variants)) {
 		dev_err(ctx->dev, "unsupported display version %d\n", id[1]);
 		ctx->error = -EINVAL;
+		return;
 	}
 
 	ctx->variant = &s6e8aa0_variants[i];
