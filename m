From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 07 Jul 2005 22:16:58 +0000
Subject: Re: [KJ] [patch 2.6.13-rc1 02/23] Audit return code of create_proc_*
Message-Id: <200507080216.58787.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707154518.886592000@rhum.iomeda.fr>
In-Reply-To: <20050707154518.886592000@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 07 July 2005 19:44, Christophe Lucas wrote:
> --- 2.6.13-rc1.orig/drivers/net/wireless/atmel.c
> +++ 2.6.13-rc1/drivers/net/wireless/atmel.c
>  struct net_device *init_atmel_card( unsigned short irq, int port, const AtmelFWType fw_type,  
>  				    struct device *sys_dev, int (*card_present)(void *), void *card)
>  {
> +	struct proc_dir_entry* ent;

	struct proc_dir_entry *ent;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
