From: Ben Skeggs <skeggsb@gmail.com>
Date: Sat, 31 Jan 2015 07:18:29 +0000
Subject: Re: [patch] drm/nouveau: indent an if statement
Message-Id: <CACAvsv6wGcsvBB6B2BGFGLxh=GB+G5ekgDiuxijL39kG7tXGQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150130082749.GA21357@mwanda>
In-Reply-To: <20150130082749.GA21357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On Fri, Jan 30, 2015 at 6:27 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This if statement is correct but it wasn't indented, so it looked like
> some code was missing.
Thanks Dan, applied (along with a fix for the owner thing you mentioned).

Ben.

>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
> index 42cac13..f20e4ca 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
> @@ -182,7 +182,7 @@ mxm_show_unmatched(struct nvkm_mxm *mxm, u8 *data, void *info)
>  {
>         u64 desc = *(u64 *)data;
>         if ((desc & 0xf0) != 0xf0)
> -       nv_info(mxm, "unmatched output device 0x%016llx\n", desc);
> +               nv_info(mxm, "unmatched output device 0x%016llx\n", desc);
>         return true;
>  }
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
