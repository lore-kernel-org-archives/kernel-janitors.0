From: chas williams - CONTRACTOR <chas@cmf.nrl.navy.mil>
Date: Wed, 28 Nov 2012 15:40:44 +0000
Subject: Re: [patch] atm: forever loop loading ambassador firmware
Message-Id: <20121128104044.785f1041@thirdoffive.cmf.nrl.navy.mil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121127172935.GB1059@elgon.mountain>
In-Reply-To: <20121127172935.GB1059@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 27 Nov 2012 20:29:35 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There was a forever loop introduced here when we converted this to
> request_firmware() back in 2008.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This certainly does seem to be the case.

Acked-by: Chas Williams <chas@cmf.nrl.navy.mil>

> ---
> Spotted in code reading.  Untested.
> 
> diff --git a/drivers/atm/ambassador.c b/drivers/atm/ambassador.c
> index 89b30f3..ff7bb8a 100644
> --- a/drivers/atm/ambassador.c
> +++ b/drivers/atm/ambassador.c
> @@ -1961,6 +1961,7 @@ static int __devinit ucode_init (loader_block * lb, amb_dev * dev) {
>      res = loader_verify(lb, dev, rec);
>      if (res)
>        break;
> +    rec = ihex_next_binrec(rec);
>    }
>    release_firmware(fw);
>    if (!res)
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

