From: Frans Klaver <fransklaver@gmail.com>
Date: Thu, 23 Mar 2017 13:43:44 +0000
Subject: Re: [PATCH] drm/i915/kvmgt: avoid dereferencing a potentially null info pointer
Message-Id: <CAH6sp9PYkq_PTx9x86+xaw+azZOSQr7DkrDW_M6+_3yDf2KzWA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323122230.19064-1-colin.king@canonical.com>
In-Reply-To: <20170323122230.19064-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, DRI mailing list <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 23, 2017 at 1:22 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> info is being checked to see if it is a null pointer, however, vpgu is
> dereferencing info before this check, leading to a potential null
> pointer dereference.  If info is null, then the error message being
> printed by macro gvt_vgpu_err and this requires vpgu to exist. We can
> use a null vpgu as the macro has a sanity check to see if vpgu is null,
> so this is OK.
>
> Detected with CoverityScan, CID#1420672 ("Dereference nefore null check")

s,nefore,before,


>
> Fixes: 695fbc08d80f ("drm/i915/gvt: replace the gvt_err with gvt_vgpu_err")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 1ea3eb270de8..f8619a772c44 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1339,9 +1339,9 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
>
>  static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
>  {
> -       struct intel_vgpu *vgpu = info->vgpu;
> -
>         if (!info) {
> +               struct intel_vgpu *vgpu = NULL;
> +
>                 gvt_vgpu_err("kvmgt_guest_info invalid\n");
>                 return false;
>         }

Does this mean the original gvt_err() macro is no longer there?

And apparently gvt_vgpu_err is a macro that depends on the specifics
of its environment? Yikes.

Cheers,
Frans
