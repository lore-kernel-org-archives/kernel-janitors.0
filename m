From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 03 Jul 2005 22:11:33 +0000
Subject: Re: [KJ] [PATCH 2.6.13-c1 3/17] fix sparse warnings (__nocast type)
Message-Id: <200507040211.34047.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031849.43357.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031849.43357.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 03 July 2005 22:49, Victor Fusco wrote:
> --- linux-2.6-git.orig/mm/mempool.c
> +++ linux-2.6-git/mm/mempool.c
> @@ -205,7 +205,7 @@
>  	void *element;
>  	unsigned long flags;
>  	wait_queue_t wait;
> -	int gfp_temp;
> +	unsigned int __nocast gfp_temp;

Already in -mm, but only function parameters should be __nocast annotated.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
