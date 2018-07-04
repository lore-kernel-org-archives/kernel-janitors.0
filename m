From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:38:09 +0000
Subject: [PATCH] drm/panel: type promotion bug in s6e8aa0_read_mtp_id()
Message-Id: <20180704093807.s3lqsb2v6dg2k43d@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The ARRAY_SIZE() macro is type size_t.  If s6e8aa0_dcs_read() returns a
negative error code, then "ret < ARRAY_SIZE(id)" is false because the
negative error code is type promoted to a high positive value.

Fixes: 02051ca06371 ("drm/panel: add S6E8AA0 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index a188a3959f1a..6ad827b93ae1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -823,7 +823,7 @@ static void s6e8aa0_read_mtp_id(struct s6e8aa0 *ctx)
 	int ret, i;
 
 	ret = s6e8aa0_dcs_read(ctx, 0xd1, id, ARRAY_SIZE(id));
-	if (ret < ARRAY_SIZE(id) || id[0] = 0x00) {
+	if (ret < 0 || ret < ARRAY_SIZE(id) || id[0] = 0x00) {
 		dev_err(ctx->dev, "read id failed\n");
 		ctx->error = -EIO;
 		return;
