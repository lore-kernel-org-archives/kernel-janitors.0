From: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Date: Wed, 26 May 2010 11:29:59 +0000
Subject: Re: [patch] hotplug/shpchp_hpc: add parenthesis in SLOT_REG_RSVDZ_MASK
Message-Id: <4BFD0637.8070300@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100526104639.GA16631@bicker>
In-Reply-To: <20100526104639.GA16631@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Good catch.
Reviewed-by: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>

(2010/05/26 19:46), Dan Carpenter wrote:
> The SLOT_REG_RSVDZ_MASK macro is normally used like this:
> 	slot_reg&= ~SLOT_REG_RSVDZ_MASK;
> The ~ operator has higher precedence than the | operator from inside the
> macro, so it needs parenthesis.
> 
> Signed-off-by: Dan Carpenter<error27@gmail.com>
> 
> diff --git a/drivers/pci/hotplug/shpchp_hpc.c b/drivers/pci/hotplug/shpchp_hpc.c
> index 5f5e8d2..d3985e7 100644
> --- a/drivers/pci/hotplug/shpchp_hpc.c
> +++ b/drivers/pci/hotplug/shpchp_hpc.c
> @@ -113,7 +113,7 @@
>   #define CON_PFAULT_INTR_MASK	(1<<  28)
>   #define MRL_CHANGE_SERR_MASK	(1<<  29)
>   #define CON_PFAULT_SERR_MASK	(1<<  30)
> -#define SLOT_REG_RSVDZ_MASK	(1<<  15) | (7<<  21)
> +#define SLOT_REG_RSVDZ_MASK	((1<<  15) | (7<<  21))
> 
>   /*
>    * SHPC Command Code definitnions
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 


