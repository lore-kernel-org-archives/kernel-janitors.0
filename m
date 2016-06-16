From: Or Gerlitz <ogerlitz@mellanox.com>
Date: Thu, 16 Jun 2016 14:15:49 +0000
Subject: Re: [patch] devlink: clean up a condition
Message-Id: <326e2050-176c-291a-a1ec-2d5f13930657@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616065032.GB23129@mwanda>
In-Reply-To: <20160616065032.GB23129@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Saeed Mahameed <saeedm@mellanox.com>, Hadar Har-Zion <hadarh@mellanox.com>

On 6/16/2016 9:50 AM, Dan Carpenter wrote:
> Presumably having a _get() function implies that we also have a _set()
> function but lets make it match when we're calling.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/net/core/devlink.c b/net/core/devlink.c
> index a4f88cb..b2e592a 100644
> --- a/net/core/devlink.c
> +++ b/net/core/devlink.c
> @@ -1461,7 +1461,7 @@ static int devlink_nl_cmd_eswitch_mode_set_doit(struct sk_buff *skb,
>   
>   	mode = nla_get_u16(info->attrs[DEVLINK_ATTR_ESWITCH_MODE]);
>   
> -	if (ops && ops->eswitch_mode_get)
> +	if (ops && ops->eswitch_mode_set)
>   		return ops->eswitch_mode_set(devlink, mode);
>   	return -EOPNOTSUPP;
>   }


good catch Dan, we will incorporate that into the patch set

