From: Ian Kent <raven@themaw.net>
Date: Mon, 16 Apr 2012 01:19:59 +0000
Subject: Re: [PATCH] fs/autofs4/dev-ioctl.c: add missing free_dev_ioctl
Message-Id: <1334539199.2250.1.camel@perseus.themaw.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334396928-17537-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1334396928-17537-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, autofs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2012-04-14 at 11:48 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Free param as done in the other error-handling code.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Oops!
Acked-by: Ian Kent <raven@themaw.net>

> 
> ---
>  fs/autofs4/dev-ioctl.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/autofs4/dev-ioctl.c b/fs/autofs4/dev-ioctl.c
> index 9dacb85..f99c2ce 100644
> --- a/fs/autofs4/dev-ioctl.c
> +++ b/fs/autofs4/dev-ioctl.c
> @@ -651,7 +651,8 @@ static int _autofs_dev_ioctl(unsigned int command, struct autofs_dev_ioctl __use
>  	fn = lookup_dev_ioctl(cmd);
>  	if (!fn) {
>  		AUTOFS_WARN("unknown command 0x%08x", command);
> -		return -ENOTTY;
> +		err = -ENOTTY;
> +		goto out;
>  	}
>  
>  	fp = NULL;
> 
> --
> To unsubscribe from this list: send the line "unsubscribe autofs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


