From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 21 Jun 2005 19:42:47 +0000
Subject: Re: [KJ] [PATCH] Audit return code : drivers/char/applicom.c
Message-Id: <200506212342.47529.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 21 June 2005 23:30, randy_dunlap wrote:
> On Tue, 21 Jun 2005 12:13:13 +0200 Christophe Lucas wrote:
> --- 2.6.12-orig/drivers/char/applicom.c
> +++ 2.6.12/drivers/char/applicom.c

>  void cleanup_module(void)
>  {
> -	int i;
> +	unsigned int i;
> 
> what is the purpose of this change?  no description for it.

IIRC, gcc 4 sez something about comparing signed and unsigned blah blah, despite

	int i;
	for (i = 0; i < N; i++)

being standard C idiom.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
