From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Wed, 13 Apr 2005 16:07:17 +0000
Subject: Re: [KJ] [PATCH] drivers/ieee1394/hosts.c : Use of time_after() macro
Message-Id: <29495f1d0504130907572ea40d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425D3FF0.1020406@feitoza.com.br>
In-Reply-To: <425D3FF0.1020406@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/13/05, Marcelo Feitoza Parisi <marcelo@feitoza.com.br> wrote:
> Use of time_after() macro, defined at linux/jiffies.h, which deal with
> wrapping correctly and are nicer to read.
> 
> --
> 
> Marcelo Feitoza Parisi
> marcelo at feitoza.com.br
> http://marcelo.feitoza.com.br/
> 
> Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
> 
> --- linux/drivers/ieee1394/hosts.c 2005-03-02 04:38:07.000000000 -0300
> +++ development/drivers/ieee1394/hosts.c 2005-04-09 22:06:53.000000000 -0300
> @@ -18,6 +18,7 @@
> #include <linux/slab.h>
> #include <linux/pci.h>
> #include <linux/timer.h>
> +#include <linux/jiffies.h>
> 
> #include "csr1212.h"
> #include "ieee1394.h"
> @@ -217,7 +218,7 @@ int hpsb_update_config_rom_image(struct
> 
>     /* IEEE 1394a-2000 prohibits using the same generation number
>     * twice in a 60 second period. */
>     - if (jiffies - host->csr.gen_timestamp[next_gen] < 60 * HZ)
>     + if (time_after(jiffies, host->csr.gen_timestamp[next_gen] - 60 * HZ))

I think this should be

if (time_before(jiffies, host->csr.gen_timestamp[next_gen] + 60 * HZ))

subtracting in a comparison is somehow confusing to me :)

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
