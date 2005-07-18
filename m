From: Domen Puncer <domen@coderock.org>
Date: Mon, 18 Jul 2005 16:48:50 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/u14-34f.c : Use of the time_before()
Message-Id: <20050718164850.GF2457@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15971692457679043=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D8B640.4030705@feitoza.com.br>
In-Reply-To: <42D8B640.4030705@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

--===============15971692457679043==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/07/05 04:24 -0300, Marcelo Feitoza Parisi wrote:

> Use of the time_before() macro, defined at linux/jiffies.h, which deal
> with wrapping correctly and are nicer to read.
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/scsi/u14-34f.c	2005-07-13 17:52:25.000000000 -0300
> +++ linux-kj/drivers/scsi/u14-34f.c	2005-07-16 01:11:52.217178840 -0300
> @@ -421,6 +421,7 @@
>  #include <linux/init.h>
>  #include <linux/ctype.h>
>  #include <linux/spinlock.h>
> +#include <linux/jiffies.h>
>  #include <asm/dma.h>
>  #include <asm/irq.h>
>  
> @@ -746,7 +747,8 @@
>  static int board_inquiry(unsigned int j) {
>     struct mscp *cpp;
>     dma_addr_t id_dma_addr;
> -   unsigned int time, limit = 0;
> +   unsigned int limit = 0;
> +   unsigned long time;
>  
>     id_dma_addr = pci_map_single(HD(j)->pdev, HD(j)->board_id,
>                      sizeof(HD(j)->board_id), PCI_DMA_BIDIRECTIONAL);
> @@ -779,7 +781,7 @@
>  
>     spin_unlock_irq(&driver_lock);
>     time = jiffies;
> -   while ((jiffies - time) < HZ && limit++ < 20000) udelay(100L);
> +   while (time_before(jiffies, time + HZ) && limit++ < 20000) udelay(100L);

This looks similar, hehe. I wonder how many times it got copy
pasted.
ssleep() should be better.

> -   while ((jiffies - time) < (10 * HZ) && limit++ < 200000) udelay(100L);
> +   while (time_before(jiffies, time + (10 * HZ))
> +		   && limit++ < 200000) udelay(100L);

Ditto.

--===============15971692457679043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15971692457679043==--
