From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 04 Jun 2005 16:05:33 +0000
Subject: Re: [KJ] [patch] wireless: char* -> char[] conversion in airo.c
Message-Id: <200506042005.33955.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050604150603.GD9687@nd47.coderock.org>
In-Reply-To: <20050604150603.GD9687@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 04 June 2005 19:06, Domen Puncer wrote:
> This conversion makes code from line 7101 right:
> 	if (copy_to_user(com.data, swversion, sizeof(swversion)))
> 
> size output (before, after):
>   55416    2228     160   57804    e1cc drivers/net/wireless/airo.o
>   55412    2228     160   57800    e1c8 drivers/net/wireless/airo.o

> --- c/drivers/net/wireless/airo.c
> +++ a/drivers/net/wireless/airo.c

> +static char swversion[] = "2.1";

Looks good.

2.95.3:
	   text	   data	    bss	    dec	    hex	filename
before	  51118	   2156	    160	  53434	   d0ba	drivers/net/wireless/airo.o
after	  51118	   2156	    160	  53434	   d0ba	drivers/net/wireless/airo.o

You won't fool him. :-)

3.3.5-20050130:
before	  46999	   2156	    160	  49315	   c0a3	drivers/net/wireless/airo.o
after	  46994	   2156	    160	  49310	   c09e	drivers/net/wireless/airo.o

4.1.0-20050522:
before	  45555	   2220	    160	  47935	   bb3f	drivers/net/wireless/airo.o
after	  45550	   2220	    160	  47930	   bb3a	drivers/net/wireless/airo.o
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
