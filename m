From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Feb 2014 14:17:53 +0000
Subject: Re: [patch] drm/radeon: delete a stray tab
Message-Id: <CADnq5_P-6Sj06eRCbCF0KT+fxyftWcx-dW3gWuKicDLf_OgjVw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140217200130.GA22453@elgon.mountain>
In-Reply-To: <20140217200130.GA22453@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>

On Mon, Feb 17, 2014 at 3:01 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Static checkers complain that probably curly braces were intended here,
> but actually it makes more sense to remove the extra tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> index f2b9e21ce4da..5623e7542d99 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -1680,7 +1680,7 @@ bool evergreen_hpd_sense(struct radeon_device *rdev, enum radeon_hpd_id hpd)
>         case RADEON_HPD_6:
>                 if (RREG32(DC_HPD6_INT_STATUS) & DC_HPDx_SENSE)
>                         connected = true;
> -                       break;
> +               break;
>         default:
>                 break;
>         }
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
