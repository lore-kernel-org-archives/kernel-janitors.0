From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Aug 2019 13:10:33 +0000
Subject: Re: [PATCH] media: dvb: redundant assignment to variable tmp
Message-Id: <20190827131033.GD23584@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827111527.26337-1-colin.king@canonical.com>
In-Reply-To: <20190827111527.26337-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 27, 2019 at 12:15:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable tmp is being assigned a value that is never read and tmp
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
> 
> Addresses-Coverity: ("Ununsed value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/dvb-frontends/sp8870.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/sp8870.c b/drivers/media/dvb-frontends/sp8870.c
> index 655db8272268..f6793c9c2dc3 100644
> --- a/drivers/media/dvb-frontends/sp8870.c
> +++ b/drivers/media/dvb-frontends/sp8870.c
> @@ -378,8 +378,6 @@ static int sp8870_read_ber (struct dvb_frontend* fe, u32 * ber)
>  	if (ret < 0)
>  		return -EIO;
>  
> -	tmp = ret & 0x3F;
> -

This is pre git code.  It's not clear if the tmp is supposed to be used
or if we can remove the sp8870_readreg() call also...  The problem is
that we're disabling the warning without necessarily writing the best
fix.  It's better to leave the warning there until we are more sure of
the correct fix.  The warning has useful information and it's not
hurting anyone.

regards,
dan carpenter
