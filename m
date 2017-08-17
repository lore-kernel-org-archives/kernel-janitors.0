From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 17 Aug 2017 22:07:11 +0000
Subject: Re: [PATCH][V2] drm/nouveau: perform null check on msto[i] rathern than msto
Message-Id: <CAKb7Uvh0G_KyVjh=p59R_qLF8qz+j0_s93WhscAhMYcV1-Z1AA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817220323.26717-1-colin.king@canonical.com>
In-Reply-To: <20170817220323.26717-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Aug 17, 2017 at 6:03 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The null check on the array msto is incorrect since msto is never
> null. The null check should be instead on msto[i] since this is
> being dereferenced in the call to drm_mode_connector_attach_encoder.
>
> Thanks to Emil Velikov for pointing out the mistake in my original
> fix and for suggesting the correct fix.
>
> Detected by CoverityScan, CID#1375915 ("Array compared against 0")
>
> Fixes: f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.2 multi-stream")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/nouveau/nv50_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
> index f7b4326a4641..ed444ecd9e85 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -3141,7 +3141,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
>         mstc->connector.funcs->reset(&mstc->connector);
>         nouveau_conn_attach_properties(&mstc->connector);
>
> -       for (i = 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto; i++)
> +       for (i = 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto[i]; i++)

Ben will have to rule on which way is correct, but another
interpretation is that it should be

for (...; i < ARRAY_SIZE; i++)
  if (mstm->msto[i])
    do_stuff()

I haven't the faintest clue whether the msto array can have "holes" or not.

>                 drm_mode_connector_attach_encoder(&mstc->connector, &mstm->msto[i]->encoder);
>
>         drm_object_attach_property(&mstc->connector.base, dev->mode_config.path_property, 0);
> --
> 2.11.0
>
