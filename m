From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 03 Jul 2005 22:45:00 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 16/17] fix sparse warnings (__nocast type)
Message-Id: <200507040245.00278.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031906.48856.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031906.48856.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sunday 03 July 2005 23:06, Victor Fusco wrote:
> --- linux-2.6-git.orig/drivers/ieee1394/raw1394.c
> +++ linux-2.6-git/drivers/ieee1394/raw1394.c
> 
> -static struct pending_request *__alloc_pending_request(int flags)
> +static struct
> +pending_request *__alloc_pending_request(unsigned int __nocast flags)

Very wrong line break. There are two styles in the kernel:

a)	struct foo * bar(void)
	{
	}

b)	struct foo *
	bar(void)
	{
	}

drivers/ieee1394/raw1394.c uses a). Stick to it.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
