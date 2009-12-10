From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 10 Dec 2009 02:05:41 +0000
Subject: Re: [PATCH 5/12] drivers/media/video/uvc: Correct size given to memset
Message-Id: <200912100305.41707.laurent.pinchart@ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912092023310.1870@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912092023310.1870@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

thanks for the patch.

On Wednesday 09 December 2009 20:23:49 Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Memset should be given the size of the structure, not the size of the
>  pointer.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> type T;
> T *x;
> expression E;
> @@
> 
> memset(x, E, sizeof(
> + *
>  x))
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
