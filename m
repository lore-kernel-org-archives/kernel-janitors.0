From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Thu, 05 Jul 2018 13:06:43 +0000
Subject: Re: [PATCH -next] usb: typec: altmodes: Fix missing unlock on error in dp_altmode_activate()
Message-Id: <20180705130643.GB15989@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530696343-79595-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530696343-79595-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 09:25:43AM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function
> dp_altmode_activate() in the error handling case.
> 
> Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index ef12b15..83e3a38 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -349,8 +349,10 @@ static int dp_altmode_activate(struct typec_altmode *alt, int activate)
>  	cap = DP_CAP_CAPABILITY(dp->alt->vdo);
>  
>  	if ((con = DP_CONF_DFP_D && !(cap & DP_CAP_DFP_D)) ||
> -	    (con = DP_CONF_UFP_D && !(cap & DP_CAP_UFP_D)))
> -		return -EINVAL;
> +	    (con = DP_CONF_UFP_D && !(cap & DP_CAP_UFP_D))) {
> +		ret = -EINVAL;
> +		goto err_unlock;
> +	}
>  
>  	conf = dp->data.conf & ~DP_CONF_DUAL_D;
>  	conf |= con;

Thank you for the patch. Colin King found the same issue, and his
patch is also fixing some other issue with this function, so let's use
that instead.


Br,

-- 
heikki
