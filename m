From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 21 Apr 2015 09:43:08 +0000
Subject: Re: [patch] drm/nouveau/platform: checking for IS_ERR() instead of NULL
Message-Id: <55361BAC.3010503@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150421092507.GB12098@mwanda>
In-Reply-To: <20150421092507.GB12098@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: Ben Skeggs <bskeggs@redhat.com>, Vince Hsu <vinceh@nvidia.com>, Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On 04/21/2015 06:25 PM, Dan Carpenter wrote:
> iommu_domain_alloc() returns NULL on error, it doesn't return error
> pointers.

Oops, that's right.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
