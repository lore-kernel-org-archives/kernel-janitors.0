From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Fri, 19 May 2017 22:41:24 +0000
Subject: Re: [PATCH] staging: speakup: signedness bug in spk_ttyio_in_nowait()
Message-Id: <20170519224124.ekuvlposspgqelfr@var.youpi.perso.aquilenet.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519212718.3pa52aiihtk4o6t2@mwanda>
In-Reply-To: <20170519212718.3pa52aiihtk4o6t2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter, on sam. 20 mai 2017 00:27:18 +0300, wrote:
> On most of the common arches char is signed so it can't ever = 0xff.
> Let's fix this by making it a u8.
> 
> Fixes: 6b9ad1c742bf ("staging: speakup: add send_xchar, tiocmset and input functionality for tty")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> diff --git a/drivers/staging/speakup/spk_ttyio.c b/drivers/staging/speakup/spk_ttyio.c
> index 6e0f042f6a44..8ed7c71c712f 100644
> --- a/drivers/staging/speakup/spk_ttyio.c
> +++ b/drivers/staging/speakup/spk_ttyio.c
> @@ -220,7 +220,7 @@ static unsigned char spk_ttyio_in(void)
>  
>  static unsigned char spk_ttyio_in_nowait(void)
>  {
> -	char rv = ttyio_in(0);
> +	u8 rv = ttyio_in(0);
>  
>  	return (rv = 0xff) ? 0 : rv;
>  }
> 

-- 
Samuel
Now, it we had this sort of thing:
  yield -a     for yield to all traffic
  yield -t     for yield to trucks
  yield -f     for yield to people walking (yield foot)
  yield -d t*  for yield on days starting with t
...you'd have a lot of dead people at intersections, and traffic jams you
wouldn't believe...
(Discussion in comp.os.linux.misc on the intuitiveness of commands.)
