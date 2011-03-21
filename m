From: "Bounine, Alexandre" <Alexandre.Bounine@idt.com>
Date: Mon, 21 Mar 2011 18:34:44 +0000
Subject: RE: [patch] rapidio: potential null deref on failure path
Message-Id: <0CE8B6BE3C4AD74AB97D9D29BD24E55201A58AA6@CORPEXCH1.na.ads.idt.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319044032.GC2008@bicker>
In-Reply-To: <20110319044032.GC2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> From: Dan Carpenter [mailto:error27@gmail.com]
> Sent: Saturday, March 19, 2011 12:41 AM
> To: Matt Porter
> Cc: Bounine, Alexandre; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch] rapidio: potential null deref on failure path
> 
> If rio is not a switch then "rswitch" is null.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/rapidio/rio-scan.c b/drivers/rapidio/rio-scan.c
> index a50391b..3a59d5f 100644
> --- a/drivers/rapidio/rio-scan.c
> +++ b/drivers/rapidio/rio-scan.c
> @@ -517,7 +517,7 @@ static struct rio_dev __devinit
> *rio_setup_device(struct rio_net *net,
>  	return rdev;
> 
>  cleanup:
> -	if (rswitch->route_table)
> +	if (rio_is_switch(rdev))
>  		kfree(rswitch->route_table);
> 
>  	kfree(rdev);

Acked-by: Alexandre Bounine <alexandre.bounine@idt.com>

