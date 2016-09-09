From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 09 Sep 2016 08:43:12 +0000
Subject: Re: [PATCH] [media] usb: constify vb2_ops structures
Message-Id: <1549816.Lv63yEq5Dv@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473379141-17286-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473379141-17286-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Hi Julia,

Thank you for the patch.

On Friday 09 Sep 2016 01:59:01 Julia Lawall wrote:
> Check for vb2_ops structures that are only stored in the ops field of a
> vb2_queue structure.  That field is declared const, so vb2_ops structures
> that have this property can be declared as const also.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct vb2_ops i@p = { ... };
> 
> @ok@
> identifier r.i;
> struct vb2_queue e;
> position p;
> @@
> e.ops = &i@p;
> 
> @bad@
> position p != {r.p,ok.p};
> identifier r.i;
> struct vb2_ops e;
> @@
> e@i@p
> 
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct vb2_ops i = { ... };
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

For

>  drivers/media/usb/uvc/uvc_queue.c       |    2 +-

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

