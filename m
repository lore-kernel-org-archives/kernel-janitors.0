From: Jerome Glisse <jglisse@redhat.com>
Date: Tue, 14 Feb 2012 18:10:11 +0000
Subject: Re: [patch] drm/radeon/evergreen: make texdw[] array larger
Message-Id: <20120214181011.GA5772@homer.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120214073811.GA2906@elgon.mountain>
In-Reply-To: <20120214073811.GA2906@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

On Tue, Feb 14, 2012 at 10:38:11AM +0300, Dan Carpenter wrote:
> We store stuff in texdw[7] so this array needs to have 8 elements.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Jerome Glisse <jglisse@redhat.com>
> 
> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
> index 2ed17f7..49203b6 100644
> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> @@ -638,7 +638,7 @@ static int evergreen_cs_track_validate_texture(struct radeon_cs_parser *p,
>  	struct eg_surface surf;
>  	unsigned long toffset, moffset;
>  	unsigned dim, llevel, mslice, width, height, depth, i;
> -	u32 texdw[7];
> +	u32 texdw[8];
>  	int r;
>  
>  	texdw[0] = radeon_get_ib_value(p, idx + 0);
