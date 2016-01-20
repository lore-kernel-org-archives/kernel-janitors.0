From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jan 2016 18:51:08 +0000
Subject: Re: [patch] drm/amd/powerplay: indent a couple if statements
Message-Id: <CADnq5_OgwfNv3UhrHWC9LFexfADvuNfAT80FPPGq5Dv9nK_EFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160120101748.GA20143@mwanda>
In-Reply-To: <20160120101748.GA20143@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Eric Huang <JinHuiEric.Huang@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, Thierry Reding <treding@nvidia.com>, Rex Zhu <Rex.Zhu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Jan 20, 2016 at 5:17 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We recently redid the indenting, but missed these two if statements.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h b/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h
> index b7429a5..b10df32 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h
> @@ -293,7 +293,7 @@ fInt GetScaledFraction(int X, int factor)
>         }
>
>         if (factor = 1)
> -       return (ConvertToFraction(X));
> +               return ConvertToFraction(X);
>
>         fValue = fDivide(ConvertToFraction(X * uPow(-1, bNEGATED)), ConvertToFraction(factor));
>
> @@ -371,7 +371,7 @@ fInt fDivide (fInt X, fInt Y)
>         fZERO = ConvertToFraction(0);
>
>         if (Equal(Y, fZERO))
> -       return fZERO;
> +               return fZERO;
>
>         longlongX = (int64_t)X.full;
>         longlongY = (int64_t)Y.full;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
