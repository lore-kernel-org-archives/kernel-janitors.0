From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 15 Jul 2020 18:12:16 +0000
Subject: Re: [PATCH] drm/nouveau: add the missed kfree() for nouveau_bo_alloc()
Message-Id: <df40519c-1850-6dfc-35bf-bdcc2eb6c117@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

> … to fix it.

I suggest to replace this wording by the tag “Fixes”.


…
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -276,8 +276,10 @@  nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
>  			break;
>  	}
>
> -	if (WARN_ON(pi < 0))
> +	if (WARN_ON(pi < 0)) {
> +		kfree(nvbo);
>  		return ERR_PTR(-EINVAL);
> +	}

I propose to move such common exception handling to the end of
this function implementation so that a bit of duplicate code will be avoided.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=e9919e11e219eaa5e8041b7b1a196839143e9125#n481

Regards,
Markus
