From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Sep 2009 20:45:51 +0000
Subject: Re: [PATCH 2/8] drivers/media/video/uvc: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0909132245220.31000@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111821010.10552@pc-004.diku.dk>
 <200909132239.21806.laurent.pinchart@ideasonboard.com>
In-Reply-To: <200909132239.21806.laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> > -	if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) && query = UVC_GET_DEF)
> > -		return -EIO;
> > +	if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) &&
> > +			query = UVC_GET_DEF) {
> > +		ret = -EIO;
> > +		goto out;
> > +	}
> 
> This check can be moved before kmalloc(), removing the need to free memory in 
> case of error.
> 
> Julia, do you want to submit a modified patch or should I do it myself ?

I can do it.  I will send a revised patch shortly.

julia
