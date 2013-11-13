From: Jason Cooper <jason@lakedaemon.net>
Date: Wed, 13 Nov 2013 15:18:30 +0000
Subject: Re: [patch] bus: mvebu-mbus: potential forever loop in mvebu_mbus_init()
Message-Id: <20131113151830.GV10335@titan.lakedaemon.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113075024.GH25541@elgon.mountain>
In-Reply-To: <20131113075024.GH25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan,

On Wed, Nov 13, 2013 at 10:50:24AM +0300, Dan Carpenter wrote:
> "of_id->compatible" is an array and not a pointer so it can never be
> NULL.

Thanks for pointing this out.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I'm not able to compile this.
> 
> diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
> index 2394e97..c646a76 100644
> --- a/drivers/bus/mvebu-mbus.c
> +++ b/drivers/bus/mvebu-mbus.c
> @@ -734,11 +734,11 @@ int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
>  {
>  	const struct of_device_id *of_id;
>  
> -	for (of_id = of_mvebu_mbus_ids; of_id->compatible; of_id++)
> +	for (of_id = of_mvebu_mbus_ids; of_id->compatible[0]; of_id++)
>  		if (!strcmp(of_id->compatible, soc))
>  			break;

Ezequiel et al,

The comment above the declaration for of_mvebu_mbus_ids says:

/*
 * The driver doesn't yet have a DT binding because the details of
 * this DT binding still need to be sorted out. However, as a
 * preparation, we already use of_device_id to match a SoC description
 * string against the SoC specific details of this driver.
 */

I believe we have a binding now.  ;-)  Care to look this over and
provide a more complete cleanup patch?

thx,

Jason.
