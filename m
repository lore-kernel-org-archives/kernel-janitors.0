From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Feb 2020 20:33:07 +0000
Subject: Re: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
Message-Id: <CAL_Jsq+BFrJ-bdDuKxCJ0OX=rLGsoHVf6u55irCA7duCJBB7sA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200203152724.42611-1-yuehaibing@huawei.com>
In-Reply-To: <20200203152724.42611-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org, Hulk Robot <hulkci@huawei.com>, Boris Brezillon <boris.brezillon@collabora.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Linux Media Mailing List <linux-media@vger.kernel.org>

On Mon, Feb 3, 2020 at 9:33 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanup':
> drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
>
> commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> involved this unused variable.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to drm-misc-fixes.

Rob
