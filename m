From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 12 Oct 2017 14:43:58 +0000
Subject: Re: [PATCH] drm/kirin: Checking for IS_ERR() instead of NULL
Message-Id: <CAOw6vb+VxPoYeS6i78Gj-bDmJJyycUCpyQRDBjvcsqs+WDutyQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005125751.jvtjms62vbtxuvak@mwanda>
In-Reply-To: <20171005125751.jvtjms62vbtxuvak@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Feng <puck.chen@hisilicon.com>, kernel-janitors@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Jyri Sarha <jsarha@ti.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Jani Nikula <jani.nikula@intel.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Wei Yongjun <weiyongjun1@huawei.com>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rongrong Zou <zourongrong@gmail.com>, Thierry Reding <treding@nvidia.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>

On Thu, Oct 5, 2017 at 8:57 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The of_graph_get_remote_node() function doesn't return error pointers,
> it returns NULL on error so I've updated the check.
>
> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Hi Dan,
Apologies for missing this.

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index e27352ca26c4..527aa58485fa 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -236,8 +236,8 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
>         }
>
>         remote = of_graph_get_remote_node(np, 0, 0);
> -       if (IS_ERR(remote))
> -               return PTR_ERR(remote);
> +       if (!remote)
> +               return -ENODEV;
>
>         drm_of_component_match_add(dev, &match, compare_of, remote);
>         of_node_put(remote);
