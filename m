From: Alex Williamson <alex.williamson@redhat.com>
Date: Wed, 18 Sep 2019 18:49:59 +0000
Subject: Re: [PATCH] sample: vfio mdev display - Fix a missing error code in an error handling path
Message-Id: <20190918124959.2741993f@x1.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190916202240.30189-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190916202240.30189-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kwankhede@nvidia.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>

On Mon, 16 Sep 2019 22:22:40 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'ret' is known to be 0 at this point. So explicitly set it to -ENOMEM if
> 'framebuffer_alloc()' fails.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  samples/vfio-mdev/mdpy-fb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
> index 2719bb259653..6fe0187f47a2 100644
> --- a/samples/vfio-mdev/mdpy-fb.c
> +++ b/samples/vfio-mdev/mdpy-fb.c
> @@ -131,8 +131,10 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
>  		 width, height);
>  
>  	info = framebuffer_alloc(sizeof(struct mdpy_fb_par), &pdev->dev);
> -	if (!info)
> +	if (!info) {
> +		ret = -ENOMEM;
>  		goto err_release_regions;
> +	}
>  	pci_set_drvdata(pdev, info);
>  	par = info->par;
>  

I think you're only scratching the surface here, this looks more
complete to me:

diff --git a/samples/vfio-mdev/mdpy-fb.c b/samples/vfio-mdev/mdpy-fb.c
index 2719bb259653..a760e130bd0d 100644
--- a/samples/vfio-mdev/mdpy-fb.c
+++ b/samples/vfio-mdev/mdpy-fb.c
@@ -117,22 +117,27 @@ static int mdpy_fb_probe(struct pci_dev *pdev,
 	if (format != DRM_FORMAT_XRGB8888) {
 		pci_err(pdev, "format mismatch (0x%x != 0x%x)\n",
 			format, DRM_FORMAT_XRGB8888);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release_regions;
 	}
 	if (width < 100	 || width > 10000) {
 		pci_err(pdev, "width (%d) out of range\n", width);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release_regions;
 	}
 	if (height < 100 || height > 10000) {
 		pci_err(pdev, "height (%d) out of range\n", height);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_release_regions;
 	}
 	pci_info(pdev, "mdpy found: %dx%d framebuffer\n",
 		 width, height);
 
 	info = framebuffer_alloc(sizeof(struct mdpy_fb_par), &pdev->dev);
-	if (!info)
+	if (!info) {
+		ret = -ENOMEM;
 		goto err_release_regions;
+	}
 	pci_set_drvdata(pdev, info);
 	par = info->par;
 
