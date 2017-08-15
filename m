From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Tue, 15 Aug 2017 14:38:34 +0000
Subject: Re: [PATCH] thunderbolt: fix incorrect value assigned to req->response_type
Message-Id: <20170815143834.GL2369@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170815143133.26500-1-colin.king@canonical.com>
In-Reply-To: <20170815143133.26500-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, Aug 15, 2017 at 03:31:33PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> req->response_type is being assigned the sizeof TB_CFG_PKG_RESET
> and should actually be assigned TB_CFG_PKG_RESET. Fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

IIRC I already acked this some time ago ;-)

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

BTW, you should CC Greg as he has been gathering Thunderbolt related
patches. I added him now.

> ---
>  drivers/thunderbolt/ctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index 69c0232a22f8..fb40dd0588b9 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -804,7 +804,7 @@ struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route,
>  	req->request_type = TB_CFG_PKG_RESET;
>  	req->response = &reply;
>  	req->response_size = sizeof(reply);
> -	req->response_type = sizeof(TB_CFG_PKG_RESET);
> +	req->response_type = TB_CFG_PKG_RESET;
>  
>  	res = tb_cfg_request_sync(ctl, req, timeout_msec);
>  
> -- 
> 2.11.0
