From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Jan 2019 23:59:10 +0000
Subject: [PATCH] net: vxge: fix indentation issue
Message-Id: <20190116235910.29277-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Mason <jdmason@kudzu.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a goto statement that indented too deeply, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/neterion/vxge/vxge-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/neterion/vxge/vxge-main.c b/drivers/net/ethernet/neterion/vxge/vxge-main.c
index 5ae3fa82909f..0da7393b2ef3 100644
--- a/drivers/net/ethernet/neterion/vxge/vxge-main.c
+++ b/drivers/net/ethernet/neterion/vxge/vxge-main.c
@@ -2553,7 +2553,7 @@ static int vxge_add_isr(struct vxgedev *vdev)
 			vxge_debug_init(VXGE_ERR,
 				"%s: Defaulting to INTA",
 				vdev->ndev->name);
-				goto INTA_MODE;
+			goto INTA_MODE;
 		}
 
 		msix_idx = (vdev->vpaths[0].handle->vpath->vp_id *
-- 
2.19.1
