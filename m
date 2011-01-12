From: walter harms <wharms@bfs.de>
Date: Wed, 12 Jan 2011 12:44:48 +0000
Subject: Re: [patch v3] [media] av7110: check for negative array offset
Message-Id: <4D2DA240.7010200@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107194153.GA1959@bicker>
In-Reply-To: <20110107194153.GA1959@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 07.01.2011 20:41, schrieb Dan Carpenter:
> info->num comes from the user.  It's type int.  If the user passes
> in a negative value that would cause memory corruption.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> V2: change the check instead of making num and unsigned int
> V3: white space changes
> 
> diff --git a/drivers/media/dvb/ttpci/av7110_ca.c b/drivers/media/dvb/ttpci/av7110_ca.c
> index 122c728..923a8e2 100644
> --- a/drivers/media/dvb/ttpci/av7110_ca.c
> +++ b/drivers/media/dvb/ttpci/av7110_ca.c
> @@ -277,7 +277,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
>  	{
>  		ca_slot_info_t *info=(ca_slot_info_t *)parg;
>  
> -		if (info->num > 1)
> +		if (info->num < 0 || info->num > 1)
>  			return -EINVAL;

maybe i miss the point but anything else than 0 will cause -EINVAL ?
Is that intended ?

re,
 wh


>  		av7110->ci_slot[info->num].num = info->num;
>  		av7110->ci_slot[info->num].type = FW_CI_LL_SUPPORT(av7110->arm_app) ?
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
