From: Borislav Petkov <bp@alien8.de>
Date: Tue, 25 Sep 2018 10:11:07 +0000
Subject: Re: [PATCH -next] EDAC: Remove set but not used variable 'type'
Message-Id: <20180925101107.GA23986@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537842964-109749-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537842964-109749-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Luck <tony.luck@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2018 at 02:36:04AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/edac/skx_edac.c: In function 'skx_mce_output_error':
> drivers/edac/skx_edac.c:949:8: warning:
>  variable 'type' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/edac/skx_edac.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/skx_edac.c b/drivers/edac/skx_edac.c
> index b2987ef..3ffdbc4 100644
> --- a/drivers/edac/skx_edac.c
> +++ b/drivers/edac/skx_edac.c
> @@ -959,15 +959,11 @@ static void skx_mce_output_error(struct mem_ctl_info *mci,
>  	recoverable = GET_BITFIELD(m->status, 56, 56);
>  
>  	if (uncorrected_error) {
> -		if (ripv) {
> -			type = "FATAL";
> +		if (ripv)
>  			tp_event = HW_EVENT_ERR_FATAL;
> -		} else {
> -			type = "NON_FATAL";
> +		else
>  			tp_event = HW_EVENT_ERR_UNCORRECTED;
> -		}
>  	} else {
> -		type = "CORRECTED";
>  		tp_event = HW_EVENT_ERR_CORRECTED;
>  	}

Looks like this @type thing was never used. Tony, did you want to use it
for something?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
