From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Oct 2017 12:57:51 +0000
Subject: [PATCH] drm/kirin: Checking for IS_ERR() instead of NULL
Message-Id: <20171005125751.jvtjms62vbtxuvak@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xinliang Liu <z.liuxinliang@hisilicon.com>, Rob Herring <robh@kernel.org>
Cc: Rongrong Zou <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>, Jyri Sarha <jsarha@ti.com>, Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>, Russell King <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The of_graph_get_remote_node() function doesn't return error pointers,
it returns NULL on error so I've updated the check.

Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index e27352ca26c4..527aa58485fa 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -236,8 +236,8 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	}
 
 	remote = of_graph_get_remote_node(np, 0, 0);
-	if (IS_ERR(remote))
-		return PTR_ERR(remote);
+	if (!remote)
+		return -ENODEV;
 
 	drm_of_component_match_add(dev, &match, compare_of, remote);
 	of_node_put(remote);
