From: Sudeep Dutt <sudeep.dutt@intel.com>
Date: Wed, 08 Aug 2018 23:13:43 +0000
Subject: Re: [PATCH] misc: mic: SCIF Fix scif_get_new_port() error handling
Message-Id: <1533770023.18931.412.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180802084222.xa3uwxld5en3cfzx@kili.mountain>
In-Reply-To: <20180802084222.xa3uwxld5en3cfzx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 2018-08-02 at 01:42 -0700, Dan Carpenter wrote:
> There are only 2 callers of scif_get_new_port() and both appear to get
> the error handling wrong.  Both treat zero returns as error, but it
> actually returns negative error codes and >= 0 on success.
> 
> Fixes: e9089f43c9a7 ("misc: mic: SCIF open close bind and listen APIs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I have not tested this patch.  Please review carefully.

Thanks for the patch Dan.

Reviewed-by: Sudeep Dutt <sudeep.dutt@intel.com>

> 
> diff --git a/drivers/misc/mic/scif/scif_api.c b/drivers/misc/mic/scif/scif_api.c
> index 463f06d0b4ef..8dd0ccedeb94 100644
> --- a/drivers/misc/mic/scif/scif_api.c
> +++ b/drivers/misc/mic/scif/scif_api.c
> @@ -371,11 +371,10 @@ int scif_bind(scif_epd_t epd, u16 pn)
>  			goto scif_bind_exit;
>  		}
>  	} else {
> -		pn = scif_get_new_port();
> -		if (!pn) {
> -			ret = -ENOSPC;
> +		ret = scif_get_new_port();
> +		if (ret < 0)
>  			goto scif_bind_exit;
> -		}
> +		pn = ret;
>  	}
>  
>  	ep->state = SCIFEP_BOUND;
> @@ -649,13 +648,12 @@ int __scif_connect(scif_epd_t epd, struct scif_port_id *dst, bool non_block)
>  			err = -EISCONN;
>  		break;
>  	case SCIFEP_UNBOUND:
> -		ep->port.port = scif_get_new_port();
> -		if (!ep->port.port) {
> -			err = -ENOSPC;
> -		} else {
> -			ep->port.node = scif_info.nodeid;
> -			ep->conn_async_state = ASYNC_CONN_IDLE;
> -		}
> +		err = scif_get_new_port();
> +		if (err < 0)
> +			break;
> +		ep->port.port = err;
> +		ep->port.node = scif_info.nodeid;
> +		ep->conn_async_state = ASYNC_CONN_IDLE;
>  		/* Fall through */
>  	case SCIFEP_BOUND:
>  		/*


