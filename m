From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2014 13:35:56 +0000
Subject: Re: [patch] drm/exynos: potential use after free in exynos_drm_open()
Message-Id: <20140121133556.GY7444@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140121065748.GC31535@elgon.mountain> <52DE69F3.9070307@bfs.de>
	<52DE6B8B.6080304@bfs.de>
In-Reply-To: <52DE6B8B.6080304@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Jan 21, 2014 at 01:43:55PM +0100, walter harms wrote:
> 
> i have just noticed: The function already exits
> 
> 194 static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
> 195 {
> 196         if (!file->driver_priv)
> 197                 return;
> 198
> 199         kfree(file->driver_priv);
> 200         file->driver_priv = NULL;
> 201 }

The function is different in the current code.  I glanced through
drm_open_helper() and I don't see that file->driver_priv to NULL is
needed anyway...

regards,
dan carpenter

