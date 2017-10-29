From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 29 Oct 2017 13:30:48 +0000
Subject: Re: [PATCH] [media] bdisp: remove redundant assignment to pix
Message-Id: <alpine.DEB.2.20.1710292129380.2004@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171029132105.6444-1-colin.king@canonical.com>
In-Reply-To: <20171029132105.6444-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Sun, 29 Oct 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer pix is being initialized to a value and a little later
> being assigned the same value again. Remove the redundant second
> duplicate assignment. Cleans up the clang warning:
>
> drivers/media/platform/sti/bdisp/bdisp-v4l2.c:726:26: warning: Value
> stored to 'pix' during its initialization is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> index 939da6da7644..14e99aeae140 100644
> --- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> +++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> @@ -731,7 +731,6 @@ static int bdisp_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  		return PTR_ERR(frame);
>  	}
>
> -	pix = &f->fmt.pix;

Why not keep this one and drop the first one?  Maybe it would be nice to
keep all the initializations related to pix together?

julia

>  	pix->width = frame->width;
>  	pix->height = frame->height;
>  	pix->pixelformat = frame->fmt->pixelformat;
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
