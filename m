From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Dec 2020 14:51:11 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix spelling mistake "Heterogenous" -> "Heterogeneous"
Message-Id: <CADnq5_MtLo6SiWOSADwmTEr46gEfqC5Oj15Tj4TypGx8tsAoAQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201215105651.138391-1-colin.king@canonical.com>
In-Reply-To: <20201215105651.138391-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, Dec 15, 2020 at 5:56 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a comment in the Kconfig. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index b3672d10ea54..e8fb10c41f16 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: MIT
>  #
> -# Heterogenous system architecture configuration
> +# Heterogeneous system architecture configuration
>  #
>
>  config HSA_AMD
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
