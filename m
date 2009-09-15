From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 15 Sep 2009 09:44:57 +0000
Subject: Re: [PATCH 2/8] drivers/media/video/uvc: introduce missing kfree
Message-Id: <200909151144.57816.laurent.pinchart@ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111821010.10552@pc-004.diku.dk> <200909132239.21806.laurent.pinchart@ideasonboard.com> <Pine.LNX.4.64.0909132254430.31000@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0909132254430.31000@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

On Sunday 13 September 2009 22:55:30 Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Move the kzalloc and associated test after the stream/query test, to avoid
> the need to free the allocated if the stream/query test fails.
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,f1,l;
> position p1,p2;
> expression *ptr != NULL;
> @@
> 
> x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x = NULL) S
> <... when != x
>      when != if (...) { <+...x...+> }
> (
> x->f1 = E
> 
>  (x->f1 = NULL || ...)
> 
>  f(...,x->f1,...)
> )
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> 
>  return@p2 ...;
> )
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> print "* file: %s kmalloc %s return %s" %
>  (p1[0].file,p1[0].line,p2[0].line) // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  drivers/media/video/uvc/uvc_video.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/video/uvc/uvc_video.c
>  b/drivers/media/video/uvc/uvc_video.c index 5b757f3..f960e8e 100644
> --- a/drivers/media/video/uvc/uvc_video.c
> +++ b/drivers/media/video/uvc/uvc_video.c
> @@ -124,13 +124,14 @@ static int uvc_get_video_ctrl(struct uvc_streaming
>  *stream, int ret;
> 
>  	size = stream->dev->uvc_version >= 0x0110 ? 34 : 26;
> +	if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) &&
> +			query = UVC_GET_DEF)

This fits in the 80 columns limit, no need to split the statement on multiple 
lines.

> +		return -EIO;
> +
>  	data = kmalloc(size, GFP_KERNEL);
>  	if (data = NULL)
>  		return -ENOMEM;
> 
> -	if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) && query = UVC_GET_DEF)
> -		return -EIO;
> -
>  	ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
>  		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
>  		size, UVC_CTRL_STREAMING_TIMEOUT);

Other than that,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Laurent Pinchart
