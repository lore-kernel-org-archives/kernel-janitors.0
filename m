From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 May 2013 12:26:58 +0000
Subject: Re: [patch] agp: info leak in agpioc_info_wrap()
Message-Id: <20130531122658.GT23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130413091611.GA11215@elgon.mountain>
In-Reply-To: <20130413091611.GA11215@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Ping?

regards,
dan carpenter

On Sat, Apr 13, 2013 at 12:16:11PM +0300, Dan Carpenter wrote:
> On 64 bit systems the agp_info struct has a hole between ->agp_mode and
> ->aper_base.  We need to clear it to avoid leaking stack information to
> userspace.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
> index 2e04433..3fbce33 100644
> --- a/drivers/char/agp/frontend.c
> +++ b/drivers/char/agp/frontend.c
> @@ -729,6 +729,7 @@ static int agpioc_info_wrap(struct agp_file_private *priv, void __user *arg)
>  
>  	agp_copy_info(agp_bridge, &kerninfo);
>  
> +	memset(&userinfo, 0, sizeof(userinfo));
>  	userinfo.version.major = kerninfo.version.major;
>  	userinfo.version.minor = kerninfo.version.minor;
>  	userinfo.bridge_id = kerninfo.device->vendor |
