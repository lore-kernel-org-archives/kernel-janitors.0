From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Aug 2020 16:46:54 +0000
Subject: [PATCH] staging: kpc2000: kpc_dma: fix spelling mistake "for for" -> "for"
Message-Id: <20200818164654.381588-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of duplicated "for" spelling mistakes in dev_err
error messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/kpc2000/kpc_dma/fileops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
index dd716edd9b1b..e1c7c04f16fe 100644
--- a/drivers/staging/kpc2000/kpc_dma/fileops.c
+++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
@@ -53,7 +53,7 @@ static int kpc_dma_transfer(struct dev_private_data *priv,
 
 	acd = kzalloc(sizeof(*acd), GFP_KERNEL);
 	if (!acd) {
-		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for for the aio data\n");
+		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for the aio data\n");
 		return -ENOMEM;
 	}
 	memset(acd, 0x66, sizeof(struct aio_cb_data));
@@ -69,7 +69,7 @@ static int kpc_dma_transfer(struct dev_private_data *priv,
 	acd->user_pages = kcalloc(acd->page_count, sizeof(struct page *),
 				  GFP_KERNEL);
 	if (!acd->user_pages) {
-		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for for the page pointers\n");
+		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for the page pointers\n");
 		rv = -ENOMEM;
 		goto err_alloc_userpages;
 	}
-- 
2.27.0
