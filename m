From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Tue, 11 Oct 2011 20:59:25 +0000
Subject: Re: [patch] Staging: cx25821: off by on in cx25821_vidioc_s_input()
Message-Id: <4E94AE2D.4050408@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132643.GB31424@elgon.mountain>
In-Reply-To: <20111007132643.GB31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "Leonid V. Fedorenchik" <leonidsbox@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, devel@driverdev.osuosl.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Em 07-10-2011 10:26, Dan Carpenter escreveu:
> If "i" is 2 then when we call cx25821_video_mux() we'd end up going
> past the end of the cx25821_boards[dev->board]->input[].
> 
> The INPUT() macro obfuscates what's going on in that function so it's
> a bit hard to follow.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't have this hardware, so I can't actually test this.  Please
> review this carefully.
> 
> diff --git a/drivers/staging/cx25821/cx25821-video.c b/drivers/staging/cx25821/cx25821-video.c
> index 084fc08..acd7c4b 100644
> --- a/drivers/staging/cx25821/cx25821-video.c
> +++ b/drivers/staging/cx25821/cx25821-video.c
> @@ -1312,7 +1312,7 @@ int cx25821_vidioc_s_input(struct file *file, void *priv, unsigned int i)
>  			return err;
>  	}
>  
> -	if (i > 2) {
> +	if (i >= 2) {

It would be better to add a NUM_INPUT macro (or something like that, defined together
with the INPUT macro) that would do an ARRAY_SIZE(cx25821_boards) and use it here, 
instead of a "2" magic number.

Thanks,
Mauro

>  		dprintk(1, "%s(): -EINVAL\n", __func__);
>  		return -EINVAL;
>  	}
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

