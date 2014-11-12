From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Wed, 12 Nov 2014 15:45:40 +0000
Subject: Re: [patch -next] amd-xgbe: fix ->rss_hash_type
Message-Id: <546380A4.1030105@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141112083135.GA12795@mwanda>
In-Reply-To: <20141112083135.GA12795@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/12/2014 02:31 AM, Dan Carpenter wrote:
> There was a missing break statement so we set everything to
> PKT_HASH_TYPE_L3 even when we intended to use PKT_HASH_TYPE_L4.
>
> Fixes: 5b9dfe299e55 ('amd-xgbe: Provide support for receive side scaling')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
> This driver has a lot of Sparse endian warnings.
> http://lwn.net/Articles/205624/

I'll send a patch to address the endian warnings.

Thanks,
Tom

>
> diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
> index 7daa2cd..55ba1dc 100644
> --- a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
> +++ b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
> @@ -1601,6 +1601,7 @@ static int xgbe_dev_read(struct xgbe_channel *channel)
>   		case RX_DESC3_L34T_IPV6_UDP:
>   			packet->rss_hash_type = PKT_HASH_TYPE_L4;
>
> +			break;
>   		default:
>   			packet->rss_hash_type = PKT_HASH_TYPE_L3;
>   		}
>
