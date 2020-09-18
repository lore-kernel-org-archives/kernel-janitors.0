From: Corey Minyard <minyard@acm.org>
Date: Fri, 18 Sep 2020 21:35:19 +0000
Subject: Re: [PATCH] ipmi: msghandler: Fix a signedness bug
Message-Id: <20200918213519.GK3674@minyard.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918142756.GB909725@mwanda>
In-Reply-To: <20200918142756.GB909725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 18, 2020 at 05:27:56PM +0300, Dan Carpenter wrote:
> The type for the completion codes should be unsigned char instead of
> char.  If it is declared as a normal char then the conditions in
> __get_device_id() are impossible because the IPMI_DEVICE_IN_FW_UPDATE_ERR
> error codes are higher than 127.
> 
>     drivers/char/ipmi/ipmi_msghandler.c:2449 __get_device_id()
>     warn: impossible condition '(bmc->cc = 209) => ((-128)-127 = 209)'

Dang, I should have spotted that.  Thanks, it's applied.

-corey

> 
> Fixes: f8910ffa81b0 ("ipmi:msghandler: retry to get device id on an error")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 2 +-
>  drivers/char/ipmi/ipmi_si_intf.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 555c3b1e4926..8774a3b8ff95 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -319,7 +319,7 @@ struct bmc_device {
>  	int                    dyn_guid_set;
>  	struct kref	       usecount;
>  	struct work_struct     remove_work;
> -	char		       cc; /* completion code */
> +	unsigned char	       cc; /* completion code */
>  };
>  #define to_bmc_device(x) container_of((x), struct bmc_device, pdev.dev)
>  
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 164f85007080..0b3dbc7e39fd 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -1344,7 +1344,7 @@ static int try_get_dev_id(struct smi_info *smi_info)
>  			resp + 2, resp_len - 2, &smi_info->device_id);
>  	if (rv) {
>  		/* record completion code */
> -		char cc = *(resp + 2);
> +		unsigned char cc = *(resp + 2);
>  
>  		if ((cc = IPMI_DEVICE_IN_FW_UPDATE_ERR
>  		    || cc = IPMI_DEVICE_IN_INIT_ERR
> -- 
> 2.28.0
> 
