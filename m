From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Thu, 20 Feb 2014 10:24:58 +0000
Subject: Re: [patch] [media] stv0900: remove an unneeded check
Message-Id: <5305D7FA.9090402@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140206092402.GA31780@elgon.mountain>
In-Reply-To: <20140206092402.GA31780@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Michael Krufky <mkrufky@linuxtv.org>, Cong Ding <dinggnu@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/06/14 10:24, Dan Carpenter wrote:
> No need to check "lock" twice here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Regards,

	Hans

> 
> diff --git a/drivers/media/dvb-frontends/stv0900_sw.c b/drivers/media/dvb-frontends/stv0900_sw.c
> index 0a40edfad739..4ce1d260b3eb 100644
> --- a/drivers/media/dvb-frontends/stv0900_sw.c
> +++ b/drivers/media/dvb-frontends/stv0900_sw.c
> @@ -1081,7 +1081,7 @@ static int stv0900_wait_for_lock(struct stv0900_internal *intp,
>  	lock = stv0900_get_demod_lock(intp, demod, dmd_timeout);
>  
>  	if (lock)
> -		lock = lock && stv0900_get_fec_lock(intp, demod, fec_timeout);
> +		lock = stv0900_get_fec_lock(intp, demod, fec_timeout);
>  
>  	if (lock) {
>  		lock = 0;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

