From: Gabriel Fernandez <gabriel.fernandez@st.com>
Date: Wed, 17 Dec 2014 10:23:09 +0000
Subject: Re: [patch] phy: miphy28lp: unlock on error in miphy28lp_init()
Message-Id: <5491598D.2050808@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141216235523.GF31467@mwanda>
In-Reply-To: <20141216235523.GF31467@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Acked-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>


Thanks Dan !


Best Regards

Gabriel

On 12/17/2014 12:55 AM, Dan Carpenter wrote:
> We need to unlock before returning the -EINVAL here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/phy/phy-miphy28lp.c b/drivers/phy/phy-miphy28lp.c
> index e34da13..27fa62c 100644
> --- a/drivers/phy/phy-miphy28lp.c
> +++ b/drivers/phy/phy-miphy28lp.c
> @@ -1050,7 +1050,8 @@ static int miphy28lp_init(struct phy *phy)
>   		ret = miphy28lp_init_usb3(miphy_phy);
>   		break;
>   	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		break;
>   	}
>   
>   	mutex_unlock(&miphy_dev->miphy_mutex);

