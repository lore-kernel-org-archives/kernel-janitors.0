From: =?windows-1252?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Date: Fri, 03 Jul 2015 09:38:10 +0000
Subject: Re: [patch] drm/radeon: fix underflow in r600_cp_dispatch_texture()
Message-Id: <55965802.3080705@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150703085428.GB11901@mwanda>
In-Reply-To: <20150703085428.GB11901@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On 03.07.2015 10:54, Dan Carpenter wrote:
> The "if (pass_size > buf->total)" can underflow so I have changed the
> type of size and pass_size to unsigned to avoid this problem.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

> ---
> This code is on the way out, but whatever.  I may as well send this
> patch since I already wrote the patch.

Yeah, indeed but it will still take a while until we can really remove it.

Well, maybe it's time to give it a try.

Regards,
Christian.

>
> diff --git a/drivers/gpu/drm/radeon/r600_cp.c b/drivers/gpu/drm/radeon/r6=
00_cp.c
> index 09e3f39..98f9ada 100644
> --- a/drivers/gpu/drm/radeon/r600_cp.c
> +++ b/drivers/gpu/drm/radeon/r600_cp.c
> @@ -2483,7 +2483,7 @@ int r600_cp_dispatch_texture(struct drm_device *dev,
>   	struct drm_buf *buf;
>   	u32 *buffer;
>   	const u8 __user *data;
> -	int size, pass_size;
> +	unsigned int size, pass_size;
>   	u64 src_offset, dst_offset;
>  =20
>   	if (!radeon_check_offset(dev_priv, tex->offset)) {

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
