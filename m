From: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Date: Tue, 07 Feb 2017 11:30:17 +0000
Subject: Re: [PATCH][net-next] net: bridge: remove redundant check to see if err is set
Message-Id: <d92d3afc-140f-8959-c6ea-9758eb1aa539@cumulusnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207105638.17918-1-colin.king@canonical.com>
In-Reply-To: <20170207105638.17918-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Stephen Hemminger <stephen@networkplumber.org>, "David S . Miller" <davem@davemloft.net>, bridge@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/02/17 11:56, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The error check on err is redundant as it is being checked
> previously each time it has been updated.  Remove this redundant
> check.
> 
> Detected with CoverityScan, CID#140030("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/bridge/br_netlink.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
> index fc5d885..cdc4e2a 100644
> --- a/net/bridge/br_netlink.c
> +++ b/net/bridge/br_netlink.c
> @@ -612,9 +612,6 @@ static int br_afspec(struct net_bridge *br,
>  				return err;
>  			break;
>  		}
> -
> -		if (err)
> -			return err;
>  	}
>  
>  	return err;
> 

Actually that code can be reduced further, I'll follow up with a patch later.

Reviewed-by: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>

