From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 19 Feb 2019 08:01:49 +0000
Subject: Re: [PATCH] net: ns83820: drop pointless static qualifier in ns83820_probe_phy()
Message-Id: <alpine.DEB.2.21.1902190857300.2570@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219080659.89732-1-maowenan@huawei.com>
In-Reply-To: <20190219080659.89732-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org



On Tue, 19 Feb 2019, Mao Wenan wrote:

> There is no need to have the 'int first' static
> since new value always be assigned before use it.
> The old codes of first dereferencing this variable have
> been commented out. So it is useless with 'static int first'.
> /*
> if (!first) {
>  ...
> }
> */
> first = 1;

Do you need the variable at all?

In the code, the commenting out is actually done with #if 0.  It could be
good for the commit log to reflect the code more accurately.

Can the #if 0 and code be removed?  Apparently it predates git.

A commented out printk below also predates git.

julia

>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/net/ethernet/natsemi/ns83820.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
> index 958fced4dacf..fb064df3a1a6 100644
> --- a/drivers/net/ethernet/natsemi/ns83820.c
> +++ b/drivers/net/ethernet/natsemi/ns83820.c
> @@ -1869,7 +1869,7 @@ static unsigned ns83820_mii_write_reg(struct ns83820 *dev, unsigned phy, unsigne
>  static void ns83820_probe_phy(struct net_device *ndev)
>  {
>  	struct ns83820 *dev = PRIV(ndev);
> -	static int first;
> +	int first;
>  	int i;
>  #define MII_PHYIDR1	0x02
>  #define MII_PHYIDR2	0x03
> --
> 2.20.1
>
>
