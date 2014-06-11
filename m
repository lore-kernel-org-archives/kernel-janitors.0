From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 07:06:09 +0000
Subject: [patch] drm/tegra: sor - missing unlock on error
Message-Id: <20140611070608.GD16443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>

We should unlock before returning the error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 27c979b..64f57fa 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -516,7 +516,7 @@ static int tegra_output_sor_enable(struct tegra_output *output)
 		if (err < 0) {
 			dev_err(sor->dev, "failed to probe eDP link: %d\n",
 				err);
-			return err;
+			goto unlock;
 		}
 	}
 
