From: Joe Perches <joe@perches.com>
Date: Tue, 18 Aug 2020 17:06:52 +0000
Subject: Re: [PATCH] staging: kpc2000: kpc_dma: fix spelling mistake "for for" -> "for"
Message-Id: <516b2816dddbc9427e4f0a5a6a57e77292014e7a.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200818164654.381588-1-colin.king@canonical.com>
In-Reply-To: <20200818164654.381588-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2020-08-18 at 17:46 +0100, Colin King wrote:
> There are a couple of duplicated "for" spelling mistakes in dev_err
> error messages. Fix these.

Might as well remove the messages instead.

> diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
[]
> @@ -53,7 +53,7 @@ static int kpc_dma_transfer(struct dev_private_data *priv,
>  
>  	acd = kzalloc(sizeof(*acd), GFP_KERNEL);
>  	if (!acd) {
> -		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for for the aio data\n");
> +		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for the aio data\n");
>  		return -ENOMEM;
>  	}
>  	memset(acd, 0x66, sizeof(struct aio_cb_data));

Also there's no reason to use kzalloc then a memset over
the alloc'ed memory or a different sizeof style for the
alloc then memset.

Setting the struct content to 0x66 does seem odd.

> @@ -69,7 +69,7 @@ static int kpc_dma_transfer(struct dev_private_data *priv,
>  	acd->user_pages = kcalloc(acd->page_count, sizeof(struct page *),
>  				  GFP_KERNEL);
>  	if (!acd->user_pages) {
> -		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for for the page pointers\n");
> +		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for the page pointers\n");
>  		rv = -ENOMEM;
>  		goto err_alloc_userpages;
>  	}

Maybe:
---
 drivers/staging/kpc2000/kpc_dma/fileops.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
index dd716edd9b1b..c5330ad6b175 100644
--- a/drivers/staging/kpc2000/kpc_dma/fileops.c
+++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
@@ -51,12 +51,11 @@ static int kpc_dma_transfer(struct dev_private_data *priv,
 
 	ldev = priv->ldev;
 
-	acd = kzalloc(sizeof(*acd), GFP_KERNEL);
-	if (!acd) {
-		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for for the aio data\n");
+	acd = kmalloc(sizeof(*acd), GFP_KERNEL);
+	if (!acd)
 		return -ENOMEM;
-	}
-	memset(acd, 0x66, sizeof(struct aio_cb_data));
+
+	memset(acd, 0x66, sizeof(*acd));
 
 	acd->priv = priv;
 	acd->ldev = priv->ldev;
@@ -69,7 +68,6 @@ static int kpc_dma_transfer(struct dev_private_data *priv,
 	acd->user_pages = kcalloc(acd->page_count, sizeof(struct page *),
 				  GFP_KERNEL);
 	if (!acd->user_pages) {
-		dev_err(&priv->ldev->pldev->dev, "Couldn't kmalloc space for for the page pointers\n");
 		rv = -ENOMEM;
 		goto err_alloc_userpages;
 	}
