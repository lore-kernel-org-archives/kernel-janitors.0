From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 16:37:37 +0000
Subject: Re: [PATCH v2] drm/amdgpu: fix multiple memory leaks
Message-Id: <1cc7e3f9-69fb-e8dc-4bfc-dbb69de66ec7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190918190529.17298-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190918190529.17298-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Chunming Zhou <David1.Zhou@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen A McCamant <smccaman@umn.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> v2: moved the released into goto error handlings

A better version comment should be moved below the triple dashes.


Will the tag “Fixes” be added?


> @@ -393,6 +395,16 @@ static int acp_hw_init(void *handle)
>  	val &= ~ACP_SOFT_RESET__SoftResetAud_MASK;
>  	cgs_write_register(adev->acp.cgs_device, mmACP_SOFT_RESET, val);
>  	return 0;
> +
> +out4:
> +	kfree(i2s_pdata);
> +out3:
> +	kfree(adev->acp.acp_res);
> +out2:
> +	kfree(adev->acp.acp_cell);
> +out1:
> +	kfree(adev->acp.acp_genpd);
> +	return ret;
>  }
>
>  /**

I suggest to reconsider the label selection according to the Linux coding style.

Regards,
Markus
