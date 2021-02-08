From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Mon, 08 Feb 2021 09:17:42 +0000
Subject: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a int
Message-Id: <c6c99dba-aea9-304c-2246-e24632955479@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210207230751.8576-1-colin.king@canonical.com>
In-Reply-To: <20210207230751.8576-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am 08.02.21 um 00:07 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The left shift of int 32 bit integer constant 1 is evaluated using 32
> bit arithmetic and then assigned to an unsigned 64 bit integer. In the
> case where *frag is 32 or more this can lead to an oveflow.  Avoid this
> by shifting 1ULL.

Well that can't happen. Take a look at the code in that function:

>                 max_frag = 31;
...
>         if (*frag >= max_frag) {
>                 *frag = max_frag;
>                 *frag_end = end & ~((1ULL << max_frag) - 1);
>         } else {
>                 *frag_end = start + (1 << *frag);
>         }

But I'm fine with applying the patch if it silences your warning.

Regards,
Christian.

>
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: dfcd99f6273e ("drm/amdgpu: meld together VM fragment and huge page handling")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9d19078246c8..53a925600510 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1412,7 +1412,7 @@ static void amdgpu_vm_fragment(struct amdgpu_vm_update_params *params,
>   		*frag = max_frag;
>   		*frag_end = end & ~((1ULL << max_frag) - 1);
>   	} else {
> -		*frag_end = start + (1 << *frag);
> +		*frag_end = start + (1ULL << *frag);
>   	}
>   }
>   
