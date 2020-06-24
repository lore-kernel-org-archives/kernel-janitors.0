From: Nirmoy <nirmodas@amd.com>
Date: Wed, 24 Jun 2020 14:33:30 +0000
Subject: Re: [PATCH][next] drm: amdgpu: fix premature goto because of missing braces
Message-Id: <f9ceecb4-2679-c0e2-8f64-4dd2a4f5401f@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624141423.6307-1-colin.king@canonical.com>
In-Reply-To: <20200624141423.6307-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nirmoy Das <nirmoy.das@amd.com>, Sonny Jiang <sonny.jiang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Acked-by: Nirmoy Das <nirmoy.das@amd.com>


Thanks,

Nirmoy

On 6/24/20 4:14 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the goto statement is skipping over a lot of setup code
> because it is outside of an if-block and should be inside it. Fix
> this by adding missing if statement braces.
>
> Addresses-Coverity: ("Structurally dead code")
> Fixes: fd151ca5396d ("drm amdgpu: SI UVD v3_1")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> index 599719e89c31..7cf4b11a65c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> @@ -642,9 +642,10 @@ static int uvd_v3_1_hw_init(void *handle)
>   	uvd_v3_1_start(adev);
>   
>   	r = amdgpu_ring_test_helper(ring);
> -	if (r)
> +	if (r) {
>   		DRM_ERROR("amdgpu: UVD ring test fail (%d).\n", r);
> -	goto done;
> +		goto done;
> +	}
>   
>   	r = amdgpu_ring_alloc(ring, 10);
>   	if (r) {
