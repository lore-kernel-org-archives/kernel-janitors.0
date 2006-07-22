From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 22 Jul 2006 13:43:22 +0000
Subject: Re: [KJ] [PATCH] drivers/mtd/nand/toto.c: Fix non-existent goto
Message-Id: <20060722134322.GA1899@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060721125348.GA25203@Chamillionaire.breakpoint.cc>
In-Reply-To: <20060721125348.GA25203@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 21, 2006 at 02:53:48PM +0200, Florian Westphal wrote:
> Fix nonexistent "goto out_buf".

> --- a/drivers/mtd/nand/toto.c
> +++ b/drivers/mtd/nand/toto.c
> @@ -166,7 +166,7 @@ static int __init toto_init(void)
>  	default:{
>  			printk(KERN_WARNING "Unsupported Nand device\n");
>  			err = -ENXIO;
> -			goto out_buf;
> +			goto out_mtd;
>  		}
>  	}

However, this driver marked as broken and fixing it isn't just fixing
one label.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
