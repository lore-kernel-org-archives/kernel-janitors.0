From: Andy Walls <awalls@md.metrocast.net>
Date: Tue, 23 Oct 2012 22:36:37 +0000
Subject: Re: [PATCH 13/23] tuners/xc2028: Replace memcpy with struct assignment
Message-Id: <1351031798.2459.31.camel@palomino.walls.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
	 <1351022246-8201-13-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-13-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

On Tue, 2012-10-23 at 16:57 -0300, Ezequiel Garcia wrote:
> This kind of memcpy() is error-prone. Its replacement with a struct
> assignment is prefered because it's type-safe and much easier to read.
> 
> Found by coccinelle. Hand patched and reviewed.
> Tested by compilation only.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier struct_name;
> struct struct_name to;
> struct struct_name from;
> expression E;
> @@
> -memcpy(&(to), &(from), E);
> +to = from;
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
> ---
>  drivers/media/tuners/tuner-xc2028.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/media/tuners/tuner-xc2028.c b/drivers/media/tuners/tuner-xc2028.c
> index 7bcb6b0..0945173 100644
> --- a/drivers/media/tuners/tuner-xc2028.c
> +++ b/drivers/media/tuners/tuner-xc2028.c
> @@ -870,7 +870,7 @@ check_device:
>  	}
>  
>  read_not_reliable:
> -	memcpy(&priv->cur_fw, &new_fw, sizeof(priv->cur_fw));
> +	priv->cur_fw = new_fw;

This memcpy() can get called almost every time
tuner-xc2028.c:generic_set_freq() is called.  

This copies a 32 byte (I think) structure on a 32 bit machine.

I am assuming the difference in performance between the memcpy and
assignment operator is negligible.

Regards,
Andy


>  	/*
>  	 * By setting BASE in cur_fw.type only after successfully loading all


