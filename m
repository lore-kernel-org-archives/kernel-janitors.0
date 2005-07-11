From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 11 Jul 2005 10:10:52 +0000
Subject: Re: [KJ] [PATCH 06/20] Fix "nocast type" warnings
Message-Id: <200507111410.52368.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507102318.54458.victor@cetuc.puc-rio.br>
In-Reply-To: <200507102318.54458.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 11 July 2005 03:18, Victor Fusco wrote:
> --- linux-git.orig/drivers/atm/fore200e.c
> +++ linux-git/drivers/atm/fore200e.c
>  static void*
> -fore200e_kmalloc(int size, int flags)
> +fore200e_kmalloc(int size, unsigned int __nocast flags)
>  {
>      void* chunk = kmalloc(size, flags);
>  
       if (chunk)
           memset(chunk, 0x00, size);
       else
           printk(FORE200E "kmalloc() failed, requested size = %d, flags = 0x%x\n", size, flags);

       return chunk;
   }

kcalloc() on steroids. ;-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
