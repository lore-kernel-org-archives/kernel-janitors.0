From: Sudeep Dutt <sudeep.dutt@intel.com>
Date: Tue, 13 Oct 2015 16:20:22 +0000
Subject: Re: [patch] misc: mic/scif: re-take a lock on error path
Message-Id: <1444753222.93285.236.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151013125206.GA2524@mwanda>
In-Reply-To: <20151013125206.GA2524@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>, Nikhil Rao <nikhil.rao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2015-10-13 at 15:52 +0300, Dan Carpenter wrote:
> The caller expects that we take this lock again before returning
> otherwise it you get double unlocks and races.
> 

Reviewed-by: Sudeep Dutt <sudeep.dutt@intel.com>

Thanks for the fix!

> Fixes: ba612aa8b487 ('misc: mic: SCIF memory registration and unregistration')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
> index e288996..980ef13 100644
> --- a/drivers/misc/mic/scif/scif_rma.c
> +++ b/drivers/misc/mic/scif/scif_rma.c
> @@ -680,6 +680,7 @@ int scif_unregister_window(struct scif_window *window)
>  			}
>  		} else {
>  			/* Return ENXIO since unregistration is in progress */
> +			mutex_lock(&ep->rma_info.rma_lock);
>  			return -ENXIO;
>  		}
>  retry:


