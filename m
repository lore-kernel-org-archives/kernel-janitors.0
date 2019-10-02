From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 02 Oct 2019 05:47:37 +0000
Subject: Re: [PATCH v4] drm/amdgpu: fix multiple memory leaks in acp_hw_init
Message-Id: <c03a8983-3f83-0596-96fa-a1a9312e82f8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002034612.26607-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191002034612.26607-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> ---

Why did you omit the patch change log at this place?


>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 34 ++++++++++++++++---------


> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -189,7 +189,7 @@ static int acp_hw_init(void *handle)
…
> +	struct i2s_platform_data *i2s_pdata = NULL;
…

I propose to reconsider this update suggestion once more.


> @@ -393,6 +396,13 @@ static int acp_hw_init(void *handle)
>  	val &= ~ACP_SOFT_RESET__SoftResetAud_MASK;
>  	cgs_write_register(adev->acp.cgs_device, mmACP_SOFT_RESET, val);
>  	return 0;
> +
> +failure:
> +	kfree(i2s_pdata);
> +	kfree(adev->acp.acp_res);
> +	kfree(adev->acp.acp_cell);
> +	kfree(adev->acp.acp_genpd);
> +	return r;
>  }
>
>  /**

Are you going to follow a known programming guideline?
https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resources#MEM12-C.Considerusingagotochainwhenleavingafunctiononerrorwhenusingandreleasingresources-CompliantSolution%28copy_process%28%29fromLinuxkernel%29

Regards,
Markus
